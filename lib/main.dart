import 'package:flutter/material.dart';
import 'package:topo_app/pages/calculator.dart';
import 'package:topo_app/pages/calculator_pages/heron.dart';
import 'package:topo_app/pages/calculator_pages/horizontal_distance.dart';
import 'package:topo_app/pages/calculator_pages/slope_angle.dart';
import 'package:topo_app/pages/calculator_pages/slope_distance.dart';
import 'package:topo_app/pages/calculator_pages/slope_line.dart';
import 'package:topo_app/pages/calculator_pages/vertical_distance.dart';
import 'package:topo_app/pages/edit_page.dart';
import 'package:topo_app/pages/home_page.dart';
import 'package:topo_app/pages/manual.dart';
import 'package:topo_app/pages/playground_page.dart';
import 'package:topo_app/pages/recent_page.dart';
import 'package:topo_app/pages/calculator_pages/two_points.dart';

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
        '/heron': ((context) => const HeronPage()),
        '/slope_distance': ((context) => const SlopeDistancePage()),
        '/horizontal_distance': ((context) => const HDPage()),
        '/vertical_distance': ((context) => const VDPage()),
        '/slope_angle': ((context) => const SlopeAnglePage()),
        '/slope_line': ((context) => const SlopeLinePage()),
      },
    );
  }
}
