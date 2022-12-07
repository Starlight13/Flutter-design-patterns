import 'package:design_patterns/design_pattern/decorator/notifier_decorator.dart';
import 'package:design_patterns/widget/common/message_widget.dart';
import 'package:flutter/material.dart';

class EmailNotifierDecorator extends NotifierDecorator {
  EmailNotifierDecorator(super.wrappee);

  @override
  List<Widget> displayMessage(String message) {
    return [
      MessageWidget(
        message: message,
        appIcon: SizedBox(
          height: 50.0,
          width: 50.0,
          child: Image.asset('assets/app_icon_assets/gmail.jpeg'),
        ),
        appName: 'Gmail',
      ),
      ...super.displayMessage(message),
    ];
  }
}
