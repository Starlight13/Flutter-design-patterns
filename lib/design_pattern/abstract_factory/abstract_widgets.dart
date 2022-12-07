import 'package:flutter/material.dart';

abstract class ISwitch {
  Widget build(bool value, Function(bool) onChanged);
}

abstract class IActivityIndicator {
  Widget build();
}
