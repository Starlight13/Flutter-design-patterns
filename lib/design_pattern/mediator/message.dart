import 'package:design_patterns/design_pattern/mediator/component.dart';
import 'package:design_patterns/widget/common/message_widget.dart';
import 'package:flutter/material.dart';

class Message extends Component {
  final ValueNotifier<String> message = ValueNotifier('');
  final String receiverName;

  Message({super.key, required super.mediator, required this.receiverName});

  @override
  Widget? get child => ValueListenableBuilder(
        builder: ((context, value, child) {
          return MessageWidget(
              message: value,
              appIcon: Image.asset('assets/app_icon_assets/messages.png'),
              appName: receiverName);
        }),
        valueListenable: message,
      );
}
