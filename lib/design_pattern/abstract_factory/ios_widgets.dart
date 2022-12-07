import 'package:design_patterns/design_pattern/abstract_factory/abstract_widgets.dart';
import 'package:flutter/cupertino.dart';

class IosSwitch implements ISwitch {
  @override
  Widget build(bool value, Function(bool p1) onChanged) {
    return CupertinoSwitch(value: value, onChanged: onChanged);
  }
}

class IosActivityIndicator implements IActivityIndicator {
  @override
  Widget build() {
    return const CupertinoActivityIndicator();
  }
}
