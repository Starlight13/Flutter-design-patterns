import 'package:design_patterns/design_pattern/decorator/app_notifier_decorator.dart';
import 'package:design_patterns/design_pattern/decorator/email_notifier_decorator.dart';
import 'package:design_patterns/design_pattern/decorator/notifier.dart';
import 'package:design_patterns/design_pattern/decorator/pokemon_notifier.dart';
import 'package:design_patterns/design_pattern/decorator/sms_notifier_decorator.dart';
import 'package:design_patterns/widget/common/my_text_button.dart';
import 'package:flutter/material.dart';

class DecoratorWidget extends StatefulWidget {
  const DecoratorWidget({super.key});

  @override
  State<DecoratorWidget> createState() => _DecoratorWidgetState();
}

class _DecoratorWidgetState extends State<DecoratorWidget> {
  late INotifier notifier;
  late TextEditingController messageController;
  bool isEmailEnabled = false;
  bool isSmsEnabled = false;
  bool isAppEnabled = false;
  List<Widget> messages = [];

  @override
  void initState() {
    messageController =
        TextEditingController(text: 'Pickachu is somewhere nearby');
    notifier = PokemonNotifier();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        children: [
          Row(
            children: [
              const Text('Notify per email'),
              Switch(
                value: isEmailEnabled,
                onChanged: (value) => setState(
                  () {
                    isEmailEnabled = value;
                  },
                ),
              )
            ],
          ),
          Row(
            children: [
              const Text('Notify per sms'),
              Switch(
                value: isSmsEnabled,
                onChanged: (value) => setState(
                  () {
                    isSmsEnabled = value;
                  },
                ),
              )
            ],
          ),
          Row(
            children: [
              const Text('Notify per app'),
              Switch(
                value: isAppEnabled,
                onChanged: (value) => setState(
                  () {
                    isAppEnabled = value;
                  },
                ),
              )
            ],
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Expanded(
                child: TextField(
                  controller: messageController,
                ),
              ),
              const SizedBox(
                width: 20.0,
              ),
              MyTextButton(
                onTap: () => _sendMessage(messageController.text),
                text: 'Send message',
              ),
            ],
          ),
          const SizedBox(
            height: 30.0,
          ),
          Expanded(
            child: Stack(
              alignment: AlignmentDirectional.topCenter,
              children: [
                Positioned.fill(
                  child: Image.asset(
                    'assets/app_icon_assets/wallpaper.jpeg',
                    fit: BoxFit.fill,
                  ),
                ),
                ListView(
                  children: messages,
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  _sendMessage(String message) {
    notifier = PokemonNotifier();
    if (isEmailEnabled) {
      notifier = EmailNotifierDecorator(notifier);
    }
    if (isSmsEnabled) {
      notifier = SmsNotifierDecorator(notifier);
    }
    if (isAppEnabled) {
      notifier = AppNotifierDecorator(notifier);
    }
    setState(() {
      messages = notifier.displayMessage(message);
    });
  }
}
