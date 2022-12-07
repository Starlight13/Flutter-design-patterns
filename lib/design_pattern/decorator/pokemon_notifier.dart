import 'package:design_patterns/design_pattern/decorator/notifier.dart';
import 'package:design_patterns/widget/common/message_widget.dart';
import 'package:flutter/material.dart';

class PokemonNotifier implements INotifier {
  @override
  List<Widget> displayMessage(String message) {
    return [
      MessageWidget(
        message: message,
        appIcon: Image.asset('assets/app_icon_assets/pokemon.png'),
        appName: 'PokemonGO',
      )
    ];
  }
}
