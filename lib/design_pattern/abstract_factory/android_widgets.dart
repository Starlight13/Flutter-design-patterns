import 'package:design_patterns/design_pattern/abstract_factory/abstract_widgets.dart';
import 'package:flutter/material.dart';

class AndroidSwitch implements ISwitch {
  @override
  Widget build(bool value, Function(bool p1) onChanged) {
    return Switch(value: value, onChanged: onChanged);
  }
}

class AndroidActivityIndicator implements IActivityIndicator {
  @override
  Widget build() {
    return const CircularProgressIndicator();
  }
}
