import 'package:flutter/material.dart';
import 'package:topo_app/pages/calculator.dart';
import 'package:topo_app/pages/edit_page.dart';
import 'package:topo_app/pages/home_page.dart';
import 'package:topo_app/pages/playground_page.dart';
import 'package:topo_app/pages/recent_page.dart';
import 'package:topo_app/pages/two_points.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/': ((context) => const MyHomePage()),
        '/new': ((context) => const PlayGroundPage()),
        '/new/formFPJ': ((context) => const NewFormPage()), 
        '/calculator': ((context) => const CalculatorPage()),
        '/map': ((context) => const RecentPage()),
        '/photo': ((context) => const RecentPage()),
        '/two_points': ((context) => const TwoPointsPage()),
      },
    );
  }
}
