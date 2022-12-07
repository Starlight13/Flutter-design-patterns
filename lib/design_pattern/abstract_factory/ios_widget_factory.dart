import 'package:design_patterns/design_pattern/abstract_factory/abstract_widgets.dart';
import 'package:design_patterns/design_pattern/abstract_factory/ios_widgets.dart';
import 'package:design_patterns/design_pattern/abstract_factory/widget_factory.dart';

class IosWidgetFactory implements WidgetFactory {
  @override
  IActivityIndicator createActivityIndicator() {
    return IosActivityIndicator();
  }

  @override
  ISwitch createSwitch() {
    return IosSwitch();
  }
}
