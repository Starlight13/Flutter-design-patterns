import 'package:design_patterns/design_pattern/singleton/singleton.dart';
import 'package:flutter/material.dart';

class SingletonWidget extends StatefulWidget {
  const SingletonWidget({super.key});

  @override
  State<SingletonWidget> createState() => _SingletonWidgetState();
}

class _SingletonWidgetState extends State<SingletonWidget> {
  @override
  Widget build(BuildContext context) {
    const itemCount = 7;
    return ListView.builder(
      itemCount: itemCount,
      itemBuilder: ((context, index) {
        if (index == 4) {
          final notSingletonCounter = NotSingletonCounter();
          return ListTile(
            title:
                Text('Not singleton counter: ${notSingletonCounter.counter}'),
            trailing: IconButton(
              icon: const Icon(Icons.add),
              onPressed: () => setState(() {
                notSingletonCounter.counter += 1;
              }),
            ),
          );
        } else if (index == itemCount - 1) {
          return const Padding(
            padding: EdgeInsets.all(15.0),
            child: Text('"Not singleton" counter does not even work properly'
                ' because it always creates new instance when rebuilding widget.'),
          );
        } else {
          final singleton = SingletonCounter();
          return ListTile(
            title: Text('Singleton counter: ${singleton.counter}'),
            trailing: IconButton(
              icon: const Icon(Icons.add),
              onPressed: () => setState(() {
                singleton.counter += 1;
              }),
            ),
          );
        }
      }),
    );
  }
}
