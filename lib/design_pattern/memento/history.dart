import 'package:design_patterns/design_pattern/memento/memento_box_shape.dart';
import 'package:design_patterns/design_pattern/memento/stack.dart';

class History {
  final _boxShapeHistory = Stack<BoxShapeMemento>();

  void addSnapshot(BoxShapeMemento snapshot) {
    _boxShapeHistory.push(snapshot);
  }

  BoxShapeMemento? get getLastSnapshot => _boxShapeHistory.pop();

  bool get isEmpty => _boxShapeHistory.isEmpty;

  bool get isNotEmpty => _boxShapeHistory.isNotEmpty;
}
