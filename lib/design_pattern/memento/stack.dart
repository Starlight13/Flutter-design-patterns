class Stack<T> {
  final List<T> _list = [];

  void push(T value) => _list.add(value);

  T? pop() {
    if (_list.isNotEmpty) {
      return _list.removeLast();
    }
    return null;
  }

  bool get isEmpty => _list.isEmpty;
  bool get isNotEmpty => _list.isNotEmpty;

  @override
  String toString() => _list.toString();
}
