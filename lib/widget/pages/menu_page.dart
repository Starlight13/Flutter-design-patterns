import 'package:design_patterns/data/design_patterns.dart';
import 'package:design_patterns/widget/pages/design_pattern_details.dart';
import 'package:flutter/material.dart';
import 'package:grouped_list/grouped_list.dart';

class MenuPage extends StatelessWidget {
  static String id = 'menu_page';

  const MenuPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Design patterns')),
      body: SafeArea(
        child: GroupedListView(
          elements: designPatternsList,
          groupBy: ((element) => element.patternClassName),
          groupSeparatorBuilder: (value) => Container(
            color: Colors.deepPurple,
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 20.0, horizontal: 10.0),
              child: Text(
                '${value.name[0].toUpperCase()}${value.name.substring(1)}',
                style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 20.0),
              ),
            ),
          ),
          itemBuilder: (context, element) {
            return ListTile(
              title: Text(element.title),
              subtitle: Text(element.description),
              onTap: () => (Navigator.pushNamed(
                context,
                DesignPatternDetails.id,
                arguments: element,
              )),
            );
          },
          itemComparator: (element1, element2) => 0,
        ),
      ),
    );
  }
}
