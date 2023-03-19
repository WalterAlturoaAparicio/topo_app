import 'package:flutter/material.dart';
import 'package:snippet_coder_utils/hex_color.dart';

class CalculatorPage extends StatefulWidget {
  const CalculatorPage({Key? key}) : super(key: key);

  @override
  State<CalculatorPage> createState() => _CalculatorPageState();
}

class _CalculatorPageState extends State<CalculatorPage> {
  String mainColor = "#14173b";
  String contrastColor = "#0b0d24";

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
            padding: const EdgeInsets.only(left:40.0,right:40.0, bottom: 20.0),
            child: GridView.count(
              crossAxisCount: 1,
              childAspectRatio: 5,
              children: <Widget>[
                _buttonCalculated("Distancia entre dos puntos", "two_points"),
                _buttonCalculated("Distancia entre dos puntos", "two_points"),
                _buttonCalculated("Distancia entre dos puntos", "two_points"),
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
