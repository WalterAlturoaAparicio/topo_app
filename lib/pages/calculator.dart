import 'package:flutter/material.dart';
import 'package:snippet_coder_utils/hex_color.dart';
import 'package:topo_app/models/calculator_model.dart';

class CalculatorPage extends StatefulWidget {
  const CalculatorPage({Key? key}) : super(key: key);

  @override
  State<CalculatorPage> createState() => _CalculatorPageState();
}

class _CalculatorPageState extends State<CalculatorPage> {
  String mainColor = "#14173b";
  String contrastColor = "#0b0d24";
  List rutas = [
    CalculatorDirection("Rectangulares a polares", "two_points"),
    CalculatorDirection("Formula de heron", "heron"),
    CalculatorDirection("Distancia inclinada", "slope_distance"),
    CalculatorDirection("Distancia horizontal", "horizontal_distance"),
    CalculatorDirection("Distancia vertical", "vertical_distance"),
    CalculatorDirection("Angulo de inclinación", "slope_angle"),
    CalculatorDirection("Pendiente de una recta", "slope_line"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text("Calculadora"),
          backgroundColor: HexColor(contrastColor),
          leading: Padding(
              padding: const EdgeInsets.all(5.0),
              child: GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Image.asset(
                  "assets/images/logoTopoApp.jpg",
                ),
              ))),
      body: Stack(children: <Widget>[
        Positioned.fill(
          child: Image.asset(
            "assets/images/banda_policia.png",
            fit: BoxFit.fitWidth,
            alignment: Alignment.bottomLeft,
          ),
        ),
        Padding(
            padding:
                const EdgeInsets.only(left: 40.0, right: 40.0, bottom: 20.0),
            child: GridView.count(
              crossAxisCount: 1,
              childAspectRatio: 4,
              children: <Widget>[
                for (var ruta in rutas)
                  _buttonCalculated(ruta.nombre, ruta.direction),
              ],
            )),
      ]),
      backgroundColor: HexColor(mainColor),
    );
  }

  Widget _buttonCalculated(String name, String direction) {
    return Padding(
      padding: const EdgeInsets.only(top: 10.0),
      child: TextButton(
          style: ButtonStyle(
              backgroundColor:
                  MaterialStateProperty.all<Color>(HexColor(contrastColor))),
          onPressed: () {
            Navigator.pushNamed(context, "/" + direction);
          },
          child: Text(
            name,
            style: const TextStyle(color: Colors.white, fontSize: 20),
          )),
    );
  }
}
