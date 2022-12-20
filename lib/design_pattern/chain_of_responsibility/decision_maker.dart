import 'package:design_patterns/design_pattern/chain_of_responsibility/handler.dart';
import 'package:design_patterns/design_pattern/chain_of_responsibility/pet_request.dart';
import 'package:design_patterns/design_pattern/chain_of_responsibility/status.dart';
import 'package:flutter/material.dart';

class DecisionMaker {
  late final Handler? rootHandler;
  final List<Handler>? _handlers;

  final ValueNotifier<bool> canPet = ValueNotifier(false);
  // bool canPet = false;
  DecisionMaker({required List<Handler> handlers}) : _handlers = handlers {
    rootHandler = handlers.first;
    for (int i = 0; i < handlers.length - 1; i++) {
      handlers[i].next = handlers[i + 1];
    }
  }

  void makeDecision(PetRequest petRequest) async {
    rootHandler?.reset();
    canPet.value = await rootHandler?.handle(petRequest) ?? false;
    // canPet = await rootHandler?.handle(petRequest) ?? false;
  }

  Widget render() {
    return Column(
      children: [
        Flexible(
          flex: 2,
          child: ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            itemCount: _handlers?.length ?? 0,
            itemBuilder: ((context, index) {
              final handler = _handlers![index];
              return ValueListenableBuilder(
                valueListenable: handler.status,
                builder: ((context, value, child) {
                  Widget? icon;
                  if (value is Success) {
                    icon = const Icon(Icons.done, color: Colors.green);
                  } else if (value is Failure) {
                    icon = const Icon(Icons.close, color: Colors.red);
                  } else if (value is Loading) {
                    icon = const CircularProgressIndicator();
                  }
                  return ListTile(
                    title: Text(handler.name),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        if (value is Failure)
                          Text(
                            value.errorMessage,
                          ),
                        if (icon != null) icon
                      ],
                    ),
                  );
                }),
              );
            }),
          ),
        ),
        const SizedBox(
          height: 10.0,
        ),
        Flexible(
          flex: 1,
          child: ValueListenableBuilder(
            valueListenable: canPet,
            builder: ((context, value, child) {
              if (value) {
                return const Text(
                  'You can pet the dog!',
                  style: TextStyle(
                    fontSize: 20.0,
                  ),
                );
              } else {
                return Container();
              }
            }),
          ),
        )
      ],
    );
  }
}
