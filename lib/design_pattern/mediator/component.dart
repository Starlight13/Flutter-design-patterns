import 'package:design_patterns/design_pattern/mediator/mediator.dart';
import 'package:flutter/material.dart';

abstract class Component extends StatelessWidget {
  final Mediator mediator;

  Widget? get child;

  const Component({super.key, required this.mediator});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => mediator.notify(sender: this, event: Event.tap),
      onDoubleTap: () => mediator.notify(sender: this, event: Event.doubleTap),
      child: child,
    );
  }
}
