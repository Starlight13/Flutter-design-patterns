import 'package:design_patterns/design_pattern/decorator/notifier_decorator.dart';
import 'package:design_patterns/widget/common/message_widget.dart';
import 'package:flutter/widgets.dart';

class AppNotifierDecorator extends NotifierDecorator {
  AppNotifierDecorator(super.wrappee);

  @override
  List<Widget> displayMessage(String message) {
    return [
      MessageWidget(
        message: message,
        appIcon: Image.asset(
          'assets/app_icon_assets/pokemon_home.png',
        ),
        appName: 'PokemonHOME',
      ),
      ...super.displayMessage(message),
    ];
  }
}
