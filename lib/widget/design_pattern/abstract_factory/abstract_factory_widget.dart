import 'package:design_patterns/design_pattern/abstract_factory/android_widget_factory.dart';
import 'package:design_patterns/design_pattern/abstract_factory/ios_widget_factory.dart';
import 'package:design_patterns/design_pattern/abstract_factory/widget_factory.dart';
import 'package:design_patterns/widget/design_pattern/abstract_factory/widget_display.dart';
import 'package:flutter/material.dart';

class AbstractFactoryWidget extends StatefulWidget {
  const AbstractFactoryWidget({super.key});

  @override
  State<AbstractFactoryWidget> createState() => _AbstractFactoryWidgetState();
}

class _AbstractFactoryWidgetState extends State<AbstractFactoryWidget> {
  bool isIosSwitch = true;
  WidgetFactory get widgetFactory =>
      isIosSwitch ? IosWidgetFactory() : AndroidWidgetFactory();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Android widgets',
              style: TextStyle(fontSize: 18.0),
            ),
            Switch(
              value: isIosSwitch,
              onChanged: (value) => setState(() {
                isIosSwitch = value;
              }),
            ),
            const Padding(
              padding: EdgeInsets.only(right: 28.0),
              child: Text(
                'iOS widgets',
                style: TextStyle(fontSize: 18.0),
              ),
            ),
          ],
        ),
        WidgetDisplay(widgetFactory: widgetFactory),
      ],
    );
  }
}
