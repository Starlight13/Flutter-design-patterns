import 'package:design_patterns/design_pattern/abstract_factory/abstract_widgets.dart';

abstract class WidgetFactory {
  ISwitch createSwitch();
  IActivityIndicator createActivityIndicator();
}
