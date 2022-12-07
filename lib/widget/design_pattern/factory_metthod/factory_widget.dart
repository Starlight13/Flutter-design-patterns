import 'package:design_patterns/design_pattern/factory/android_dialog.dart';
import 'package:design_patterns/design_pattern/factory/ios_dialog.dart';
import 'package:design_patterns/widget/common/my_text_button.dart';
import 'package:flutter/material.dart';

class FactoryWidget extends StatefulWidget {
  const FactoryWidget({super.key});

  @override
  State<FactoryWidget> createState() => _FactoryWidgetState();
}

class _FactoryWidgetState extends State<FactoryWidget> {
  bool isAndroidDialog = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Switch(
          value: isAndroidDialog,
          onChanged: ((value) => setState(() {
                isAndroidDialog = value;
              })),
        ),
        MyTextButton(
          onTap: () async {
            final dialog = isAndroidDialog ? AndroidDialog() : IosDialog();
            await dialog.show(context);
          },
          text: 'Show dialog',
        ),
      ],
    );
  }
}
