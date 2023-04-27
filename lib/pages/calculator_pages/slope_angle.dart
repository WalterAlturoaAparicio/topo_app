import 'dart:math';
import 'package:flutter/material.dart';
import 'package:snippet_coder_utils/hex_color.dart';
import 'package:topo_app/components/calculator_field.dart';

class SlopeAnglePage extends StatefulWidget {
  const SlopeAnglePage({Key? key}) : super(key: key);

  @override
  State<SlopeAnglePage> createState() => _SlopeAnglePageState();
}

class _SlopeAnglePageState extends State<SlopeAnglePage> {
  String mainColor = "#FCFCFC";
  String contrastColor = "#0b0d24";

  final TextEditingController _dNController = TextEditingController();
  final TextEditingController _dHController = TextEditingController();
  final TextEditingController _totalController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text("Angulo de inclinación"),
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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              const Text(
                "Introduce las distancias",
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.black, fontSize: 21),
              ),
              const Divider(
                height: 20.0,
                thickness: 2,
                color: Colors.black,
              ),
              SizedBox(
                height: 300,
                child: GridView.count(
                  crossAxisCount: 2,
                  childAspectRatio: 3.5,
                  children: [
                    const Padding(
                      padding:
                          EdgeInsets.only(top: 10.0, left: 15.0, bottom: 10),
                      child: Text("Distancia Nivel",
                          style: TextStyle(fontSize: 15)),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 20.0, bottom: 10),
                      child: CalculatorField(
                        inputController: _dNController,
                        enabled: true,
                      ),
                    ),
                    const Padding(
                      padding:
                          EdgeInsets.only(top: 10.0, left: 15.0, bottom: 10),
                      child: Text("Distancia horizontal",
                          style: TextStyle(fontSize: 15)),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 20.0, bottom: 10),
                      child: CalculatorField(
                        inputController: _dHController,
                        enabled: true,
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(top: 30.0, left: 35.0),
                      child: Text("Distancia vertical",
                          style: TextStyle(fontSize: 15)),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 20.0, top: 20),
                      child: CalculatorField(
                        inputController: _totalController,
                        enabled: false,
                      ),
                    ),
                  ],
                ),
              ),
              TextButton(
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(HexColor("#E8E8E8")),
                  ),
                  onPressed: () {
                    double dn = double.parse(_dNController.text);
                    double dh = double.parse(_dHController.text);
                    _totalController.text = atan2(dn, dh).toStringAsFixed(2);
                  },
                  child: const Text("Calcular")),
            ],
          ),
        ),
      ),
      backgroundColor: HexColor(mainColor),
    );
  }
}
