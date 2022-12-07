import 'package:design_patterns/design_pattern/observer/groceries_store.dart';
import 'package:design_patterns/widget/common/my_text_button.dart';
import 'package:design_patterns/widget/design_pattern/observer/phone_widget.dart';
import 'package:flutter/material.dart';

class ObserverWidget extends StatefulWidget {
  const ObserverWidget({super.key});

  @override
  State<ObserverWidget> createState() => _ObserverWidgetState();
}

class _ObserverWidgetState extends State<ObserverWidget> {
  final store = GroceriesStore();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20.0),
            child: Wrap(
              alignment: WrapAlignment.spaceAround,
              children: store.products.map((product) {
                return Column(
                  children: [
                    SizedBox(
                      height: 60.0,
                      width: 60.0,
                      child: Image.asset(product.imageName),
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          '${product.originalPrice}',
                          style: TextStyle(
                            decoration: product.isDiscounted
                                ? TextDecoration.lineThrough
                                : null,
                          ),
                        ),
                        if (product.isDiscounted)
                          Text(
                            ' ${product.price}',
                            style: const TextStyle(
                              color: Colors.red,
                            ),
                          )
                      ],
                    ),
                    MyTextButton(
                      onTap: () {
                        setState(() {
                          store.discountAction(product);
                        });
                      },
                      text: product.isDiscounted
                          ? 'Remove discount'
                          : 'Discount 10%',
                    )
                  ],
                );
              }).toList(),
            ),
          ),
          Column(
            children: [
              Wrap(
                spacing: 10.0,
                alignment: WrapAlignment.spaceAround,
                children: const [
                  PhoneWidget(),
                  PhoneWidget(),
                  PhoneWidget(),
                ],
              )
            ],
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    store.newsletter.clearSubscribers();
    super.dispose();
  }
}
