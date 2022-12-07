import 'package:design_patterns/design_pattern/observer/subscriber.dart';

class GroceriesStoreNewsletter {
  GroceriesStoreNewsletter._();

  static final _instance = GroceriesStoreNewsletter._();

  factory GroceriesStoreNewsletter() => _instance;

  List<ISubscriber> subscribers = [];

  void subscribe(ISubscriber subscriber) {
    subscribers.add(subscriber);
    subscriber.update('You have successfully subscribed');
  }

  void unsubscribe(ISubscriber subscriber) {
    subscribers.remove(subscriber)
        ? subscriber.update('Sad to see you go...')
        : null;
  }

  void notifySubscribers(String message) {
    for (ISubscriber subscriber in subscribers) {
      subscriber.update(message);
    }
  }

  bool isSubscribed(ISubscriber subscriber) => subscribers.contains(subscriber);

  void clearSubscribers() => subscribers.clear();
}
