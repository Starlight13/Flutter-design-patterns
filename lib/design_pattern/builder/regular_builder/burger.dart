import 'package:design_patterns/design_pattern/builder/ingredients/ingredients.dart';
import 'package:flutter/material.dart';

class Burger {
  String? name;
  Bun? bread;
  Cheese? cheese;
  Meat? meat;
  Sauce? sauce;
  final List<Extra> extras = [];

  String get description =>
      '${meat?.name} sandwich in ${bread?.name} bread with ${cheese?.name}'
      ', topped with ${extras.map((e) => e.name).join(', ')} and ${sauce?.name}';

  int get calories => [bread, cheese, meat, sauce, ...extras]
      .fold(0, (value, element) => value + (element?.calories ?? 0));

  Widget render({required double topOffset}) {
    final ingredients = [
      meat,
      ...extras,
      cheese,
      sauce,
    ];
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Stack(
          alignment: Alignment.center,
          clipBehavior: Clip.none,
          children: [
            if (bread != null)
              Positioned(
                top: (ingredients.length + 1) * topOffset + 50,
                width: 300,
                child: bread!.renderBottom(),
              ),
            ...ingredients.asMap().entries.map((e) {
              if (e.value != null) {
                return Positioned(
                  top: (ingredients.length - e.key) * topOffset,
                  width: 300,
                  height: 200,
                  child: e.value!.render(),
                );
              }
              return Container();
            }).toList(),
            if (bread != null)
              SizedBox(
                width: 300,
                child: bread!.render(),
              ),
            Container(),
          ],
        ),
      ],
    );
  }
}

class PositionedIngredient extends StatelessWidget {
  final int index;
  final double topOffset;
  final Widget child;

  const PositionedIngredient({
    super.key,
    required this.topOffset,
    required this.child,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: index * topOffset,
      width: 300,
      child: child,
    );
  }
}
