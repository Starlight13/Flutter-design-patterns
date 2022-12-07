import 'package:design_patterns/design_pattern/decorator/notifier.dart';
import 'package:flutter/widgets.dart';

class NotifierDecorator implements INotifier {
  final INotifier wrappee;

  NotifierDecorator(this.wrappee);

  @override
  List<Widget> displayMessage(String message) {
    return wrappee.displayMessage(message);
  }
}
