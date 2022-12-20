import 'package:design_patterns/design_pattern/mediator/message_mediator.dart';
import 'package:flutter/material.dart';

class MediatorWidget extends StatelessWidget {
  const MediatorWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final mediator = MessageMediator();
    return Column(
      children: [
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Expanded(child: mediator.phoneMessage),
            Expanded(child: mediator.pcMessage),
          ],
        ),
        mediator.sendToPhone,
        mediator.sendToPc,
        mediator.sendToBoth,
        const Text('Tap or double tap on any of the buttons'),
      ],
    );
  }
}
