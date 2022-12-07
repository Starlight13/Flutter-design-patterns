import 'package:design_patterns/design_pattern/observer/groceries_store_newsletter.dart';
import 'package:design_patterns/design_pattern/observer/subscriber.dart';
import 'package:design_patterns/widget/common/message_widget.dart';
import 'package:flutter/material.dart';

class PhoneWidget extends StatefulWidget {
  const PhoneWidget({super.key});

  @override
  State<PhoneWidget> createState() => _PhoneWidgetState();
}

class _PhoneWidgetState extends State<PhoneWidget> implements ISubscriber {
  Widget message = Container();
  final newsletter = GroceriesStoreNewsletter();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 250,
          width: 150,
          decoration: BoxDecoration(
            image: const DecorationImage(
              image: AssetImage('assets/app_icon_assets/wallpaper.jpeg'),
              fit: BoxFit.cover,
            ),
            borderRadius: BorderRadius.circular(30.0),
          ),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  width: 40.0,
                  height: 10.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.0),
                    color: Colors.black,
                  ),
                ),
              ),
              message
            ],
          ),
        ),
        Switch(
          value: newsletter.isSubscribed(this),
          onChanged: ((value) {
            setState(() {
              if (value) {
                newsletter.subscribe(this);
              } else {
                newsletter.unsubscribe(this);
              }
            });
          }),
        )
      ],
    );
  }

  @override
  void update(String message) {
    setState(() {
      this.message = MessageWidget(
        message: message,
        appIcon: SizedBox(
          height: 50.0,
          width: 50.0,
          child: Image.asset('assets/app_icon_assets/gmail.jpeg'),
        ),
        appName: 'Gmail',
      );
    });
  }
}
