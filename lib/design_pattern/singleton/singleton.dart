abstract class Counter {
  int counter = 0;
}

class SingletonCounter extends Counter {
  SingletonCounter._();

  static final _instance = SingletonCounter._();

  factory SingletonCounter() => _instance;
}

class SingletonCounterTwo extends Counter {
  SingletonCounterTwo._();

  static final _instance = SingletonCounterTwo._();

  static SingletonCounterTwo get instance => _instance;
}

class SingletonCounterThree extends Counter {
  SingletonCounterThree._();

  static final instance = SingletonCounterThree._();
}

class NotSingletonCounter extends Counter {}
