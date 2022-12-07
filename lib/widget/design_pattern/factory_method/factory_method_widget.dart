import 'package:design_patterns/design_pattern/factory/android_dialog.dart';
import 'package:design_patterns/design_pattern/factory/ios_dialog.dart';
import 'package:design_patterns/widget/common/my_text_button.dart';
import 'package:flutter/material.dart';

class FactoryMethodWidget extends StatefulWidget {
  const FactoryMethodWidget({super.key});

  @override
  State<FactoryMethodWidget> createState() => _FactoryMethodWidgetState();
}

class _FactoryMethodWidgetState extends State<FactoryMethodWidget> {
  bool isAndroidDialog = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('iOS dialog'),
              Switch(
                value: isAndroidDialog,
                onChanged: ((value) => setState(() {
                      isAndroidDialog = value;
                    })),
              ),
              const Text('Android dialog'),
            ],
          ),
          const SizedBox(
            height: 20.0,
          ),
          MyTextButton(
            onTap: () async {
              final dialog = isAndroidDialog ? AndroidDialog() : IosDialog();
              await dialog.show(context);
            },
            text: 'Show dialog',
            fontSize: 25.0,
          ),
        ],
      ),
    );
  }
}
