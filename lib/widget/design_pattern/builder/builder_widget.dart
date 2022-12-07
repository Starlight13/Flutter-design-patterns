import 'package:design_patterns/design_pattern/builder/built_value/built_value.dart'
    as built_value;
import 'package:design_patterns/design_pattern/builder/ingredients/ingredients.dart';
import 'package:flutter/material.dart';

import 'package:design_patterns/design_pattern/builder/regular_builder/regular_builder.dart'
    as regular_builder;

class BuilderWidget extends StatefulWidget {
  const BuilderWidget({super.key});

  @override
  State<BuilderWidget> createState() => _BuilderWidgetState();
}

class _BuilderWidgetState extends State<BuilderWidget>
    with SingleTickerProviderStateMixin {
  final built_value.BurgerBuilder builtValueBuilder =
      built_value.BurgerBuilder();
  final regular_builder.BurgerBuilder regularBuilder =
      regular_builder.BurgerBuilder();

  final regular_builder.Director regularDirector = regular_builder.Director();

  regular_builder.Burger? burger;
  built_value.Burger? customBurger;
  String selectedBurger = '';
  bool showCustomPanel = false;

  late final AnimationController controller;
  late final Animation animation;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    );
    animation = Tween<double>(
      begin: 200,
      end: 25,
    ).animate(CurvedAnimation(
      parent: controller,
      curve: Curves.decelerate,
    ));
  }

  @override
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Text('Selected burger: $selectedBurger'),
          ListTile(
            title: const Text('Black burger'),
            subtitle: const Text('Black burger with patty'),
            onTap: () {
              customBurger = null;
              burger = null;
              regularDirector.buildBlackBurger(regularBuilder);
              setState(() {
                selectedBurger = 'Black burger';
                showCustomPanel = false;
              });
            },
          ),
          ListTile(
            title: const Text('Italian sandwich'),
            subtitle: const Text('Italian sandwich with salami'),
            onTap: () {
              customBurger = null;
              burger = null;
              regularDirector.buildItalianBLTSandwich(regularBuilder);
              setState(() {
                selectedBurger = 'Black burger';
                showCustomPanel = false;
              });
            },
          ),
          ListTile(
            title: const Text('Custom sandwich'),
            subtitle: const Text('Make your own'),
            onTap: () {
              customBurger = null;
              burger = null;
              setState(() {
                selectedBurger = 'Custom burger';
                showCustomPanel = true;
              });
            },
          ),
          TextButton(
            onPressed: () {
              setState(() {
                burger = regularBuilder.getBurger();
                customBurger = builtValueBuilder.build();
                builtValueBuilder.replace(built_value.Burger());
                selectedBurger = '';
                showCustomPanel = false;
                controller.forward(from: 0);
              });
            },
            child: const Text('Make burger'),
          ),
          if (showCustomPanel)
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text('Bun'),
                generateRadioOptions(
                  groupValue: builtValueBuilder.bread,
                  options: [
                    Black(),
                    White(),
                  ],
                  onChange: (value) => setState(
                    (() => builtValueBuilder.bread = value),
                  ),
                ),
                const Text('Cheese'),
                generateRadioOptions(
                  groupValue: builtValueBuilder.cheese,
                  options: [
                    Cheddar(),
                    Gouda(),
                  ],
                  onChange: (value) => setState(
                    (() => builtValueBuilder.cheese = value),
                  ),
                ),
                const Text('Sauce'),
                generateRadioOptions(
                  groupValue: builtValueBuilder.sauce,
                  options: [
                    Ketchup(),
                    Mayo(),
                  ],
                  onChange: (value) => setState(
                    (() => builtValueBuilder.sauce = value),
                  ),
                ),
                const Text('Meat'),
                generateRadioOptions(
                  groupValue: builtValueBuilder.meat,
                  options: [
                    Patty(),
                    Salami(),
                  ],
                  onChange: (value) => setState(
                    (() => builtValueBuilder.meat = value),
                  ),
                ),
                const Text('Extra'),
                ...generateCheckboxOptions()
              ],
            ),
          if (burger != null)
            AnimatedBuilder(
              builder: ((context, child) =>
                  burger!.render(topOffset: animation.value)),
              animation: animation,
            ),
          if (customBurger != null)
            AnimatedBuilder(
              builder: ((context, child) =>
                  customBurger!.render(topOffset: animation.value)),
              animation: animation,
            ),
        ],
      ),
    );
  }

  Widget generateRadioOptions<T>(
      {required T? groupValue,
      required List<T> options,
      required Function(T?) onChange}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: options.map(
        (option) {
          return Row(
            children: [
              Radio(
                value: option,
                groupValue: groupValue,
                onChanged: onChange,
              ),
              Text(option.runtimeType.toString()),
            ],
          );
        },
      ).toList(),
    );
  }

  List<Widget> generateCheckboxOptions() {
    final options = [Tomato(), Jalapeno(), Pickle()];
    return options
        .map(
          (e) => Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Checkbox(
                value: builtValueBuilder.extras?.contains(e) ?? false,
                onChanged: ((value) => setState(() {
                      (value ?? false)
                          ? builtValueBuilder.extras?.add(e)
                          : builtValueBuilder.extras?.remove(e);
                    })),
              ),
              Text(e.runtimeType.toString()),
            ],
          ),
        )
        .toList();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}
