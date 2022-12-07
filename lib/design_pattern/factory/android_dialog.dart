import 'package:design_patterns/design_pattern/factory/dialog.dart';
import 'package:flutter/material.dart';

class AndroidDialog extends IDialog {
  @override
  Widget builder(BuildContext context) {
    return AlertDialog(
      title: Text(title),
      content: const Text(
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: const Text('Close'),
        ),
      ],
    );
  }

  @override
  String get title => 'Android dialog';
}
