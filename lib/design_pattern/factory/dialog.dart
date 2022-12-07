import 'package:flutter/material.dart';

abstract class IDialog {
  String get title;
  Widget builder(BuildContext context);

  Future<void> show(BuildContext context) async {
    return showDialog(context: context, builder: builder);
  }
}
