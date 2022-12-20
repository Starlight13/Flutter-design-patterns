import 'package:design_patterns/design_pattern/mediator/component.dart';
import 'package:flutter/material.dart';

class Button extends Component {
  final String title;
  const Button(this.title, {super.key, required super.mediator});

  @override
  Widget? get child => Container(
        padding: const EdgeInsets.all(8.0),
        margin: const EdgeInsets.all(5.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5.0),
          color: Colors.purple,
        ),
        child: Center(
          child: Text(
            title,
            style: const TextStyle(color: Colors.white),
          ),
        ),
      );
}
