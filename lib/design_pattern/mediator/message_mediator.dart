import 'package:design_patterns/design_pattern/mediator/button.dart';
import 'package:design_patterns/design_pattern/mediator/component.dart';
import 'package:design_patterns/design_pattern/mediator/mediator.dart';
import 'package:design_patterns/design_pattern/mediator/message.dart';

class MessageMediator implements Mediator {
  late final Message phoneMessage = Message(
    mediator: this,
    receiverName: 'Phone',
  );
  late final Message pcMessage = Message(mediator: this, receiverName: 'PC');

  late final Button sendToPhone = Button('Send to phone', mediator: this);
  late final Button sendToPc = Button('Send to PC', mediator: this);
  late final Button sendToBoth = Button('Send to both', mediator: this);

  @override
  notify({required Component sender, required Event event}) {
    if (sender == sendToPhone) {
      _sendEventMessage([phoneMessage], event);
    } else if (sender == sendToPc) {
      _sendEventMessage([pcMessage], event);
    } else if (sender == sendToBoth) {
      _sendEventMessage([phoneMessage, pcMessage], event);
    }
  }

  void _sendEventMessage(List<Message> receivers, Event event) {
    for (final receiver in receivers) {
      if (event == Event.tap) {
        receiver.message.value = 'Tapped once';
      } else if (event == Event.doubleTap) {
        receiver.message.value = 'Tapped twice';
      }
    }
  }
}
