import 'package:design_patterns/design_pattern/abstract_factory/abstract_widgets.dart';
import 'package:design_patterns/design_pattern/abstract_factory/android_widgets.dart';
import 'package:design_patterns/design_pattern/abstract_factory/widget_factory.dart';

class AndroidWidgetFactory implements WidgetFactory {
  @override
  IActivityIndicator createActivityIndicator() {
    return AndroidActivityIndicator();
  }

  @override
  ISwitch createSwitch() {
    return AndroidSwitch();
  }
}
