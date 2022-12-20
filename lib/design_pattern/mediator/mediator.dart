import 'package:design_patterns/design_pattern/mediator/component.dart';

enum Event { tap, doubleTap }

abstract class Mediator {
  notify({required Component sender, required Event event});
}
