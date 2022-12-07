import 'package:design_patterns/data/model/design_pattern.dart';
import 'package:design_patterns/widget/design_pattern/design_pattern_factory.dart';
import 'package:flutter/material.dart';

class DesignPatternDetails extends StatelessWidget {
  static const String id = 'design_patten_details';

  const DesignPatternDetails({super.key});

  @override
  Widget build(BuildContext context) {
    final designPattern = _getDesignPatternFromRouteSettings(context);
    return Scaffold(
      appBar: AppBar(title: Text(designPattern.title)),
      body: DesignPatternWidgetFactory.createWidget(designPattern.id),
    );
  }

  DesignPattern _getDesignPatternFromRouteSettings(BuildContext context) {
    return ModalRoute.of(context)!.settings.arguments as DesignPattern;
  }
}
