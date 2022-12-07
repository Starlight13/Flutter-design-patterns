import 'package:built_value/built_value.dart';
import 'package:design_patterns/design_pattern/builder/ingredients/ingredients.dart';
import 'package:flutter/material.dart' as material;

part 'burger.g.dart';

abstract class Burger implements Built<Burger, BurgerBuilder> {
  Bun? get bread;
  Cheese? get cheese;
  Meat? get meat;
  Sauce? get sauce;
  List<Extra> get extras;

  Burger._();

  @BuiltValueHook(initializeBuilder: true)
  static void _setDefaults(BurgerBuilder b) => b..extras = [];
  factory Burger([void Function(BurgerBuilder) updates]) = _$Burger;

  String get description =>
      '${meat?.name} sandwich in ${bread?.name} bread with ${cheese?.name}'
      ', topped with ${extras.map((e) => e.name).join(', ')} and ${sauce?.name}';

  int get calories => [bread, cheese, meat, sauce, ...extras]
      .fold(0, (value, element) => value + (element?.calories ?? 0));

  material.Widget render({required double topOffset}) {
    final ingredients = [
      meat,
      ...extras,
      cheese,
      sauce,
    ];
    return material.Column(
      mainAxisSize: material.MainAxisSize.min,
      children: [
        material.Stack(
          alignment: material.Alignment.center,
          clipBehavior: material.Clip.none,
          children: [
            if (bread != null)
              material.Positioned(
                top: (ingredients.length + 1) * topOffset + 40,
                width: 300,
                child: bread!.renderBottom(),
              ),
            ...ingredients.asMap().entries.map((e) {
              if (e.value != null) {
                return material.Positioned(
                  top: (ingredients.length - e.key) * topOffset,
                  width: 300,
                  height: 200,
                  child: e.value!.render(),
                );
              }
              return material.Container();
            }).toList(),
            if (bread != null)
              material.SizedBox(
                width: 300,
                child: bread!.render(),
              ),
            material.Container(),
          ],
        ),
      ],
    );
  }
}
