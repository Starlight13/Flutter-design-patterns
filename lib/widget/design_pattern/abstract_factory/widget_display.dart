import 'package:design_patterns/design_pattern/abstract_factory/widget_factory.dart';
import 'package:flutter/material.dart';

class WidgetDisplay extends StatefulWidget {
  final WidgetFactory widgetFactory;
  const WidgetDisplay({super.key, required this.widgetFactory});

  @override
  State<WidgetDisplay> createState() => _WidgetDisplayState();
}

class _WidgetDisplayState extends State<WidgetDisplay> {
  bool flag = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Text(
          'Switch',
          style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
        ),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: widget.widgetFactory.createSwitch().build(
                flag,
                (value) => setState(
                  () => flag = value,
                ),
              ),
        ),
        const Text(
          'Activity Indicator',
          style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
        ),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: widget.widgetFactory.createActivityIndicator().build(),
        ),
      ],
    );
  }
}
