import 'package:design_patterns/design_pattern/decorator/notifier_decorator.dart';
import 'package:design_patterns/widget/common/message_widget.dart';
import 'package:flutter/material.dart';

class SmsNotifierDecorator extends NotifierDecorator {
  SmsNotifierDecorator(super.wrappee);

  @override
  List<Widget> displayMessage(String message) {
    return [
      MessageWidget(
        message: message,
        appIcon: Image.asset('assets/app_icon_assets/messages.png'),
        appName: 'Messages',
      ),
      ...super.displayMessage(message),
    ];
  }
}
