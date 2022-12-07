import 'package:design_patterns/widget/pages/design_pattern_details.dart';
import 'package:design_patterns/widget/pages/menu_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      initialRoute: MenuPage.id,
      routes: {
        MenuPage.id: (context) => const MenuPage(),
        DesignPatternDetails.id: (context) => const DesignPatternDetails(),
      },
    );
  }
}
