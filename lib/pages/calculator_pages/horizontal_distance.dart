import 'dart:math';

import 'package:flutter/material.dart';
import 'package:snippet_coder_utils/hex_color.dart';
import 'package:topo_app/components/calculator_field.dart';

class HDPage extends StatefulWidget {
  const HDPage({Key? key}) : super(key: key);

  @override
  State<HDPage> createState() => _HDPageState();
}

class _HDPageState extends State<HDPage> {
  String mainColor = "#FCFCFC";
  String contrastColor = "#0b0d24";

  final TextEditingController _norte1Controller = TextEditingController();
  final TextEditingController _norte2Controller = TextEditingController();
  final TextEditingController _este1Controller = TextEditingController();
  final TextEditingController _este2Controller = TextEditingController();
  final TextEditingController _totalController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text("Distancia horizontal"),
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
                "Introduce coordenadas norte y este",
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
                          EdgeInsets.only(top: 10.0, left: 45.0, bottom: 10),
                      child: Text("Norte 1", style: TextStyle(fontSize: 18)),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 20.0, bottom: 10),
                      child: CalculatorField(
                        inputController: _norte1Controller,
                        enabled: true,
                      ),
                    ),
                    const Padding(
                      padding:
                          EdgeInsets.only(top: 10.0, left: 45.0, bottom: 10),
                      child: Text("Norte 2", style: TextStyle(fontSize: 18)),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 20.0, bottom: 10),
                      child: CalculatorField(
                        inputController: _norte2Controller,
                        enabled: true,
                      ),
                    ),
                    const Padding(
                      padding:
                          EdgeInsets.only(top: 10.0, left: 45.0, bottom: 10),
                      child: Text("Este 1", style: TextStyle(fontSize: 18)),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 20.0, bottom: 10),
                      child: CalculatorField(
                        inputController: _este1Controller,
                        enabled: true,
                      ),
                    ),
                    const Padding(
                      padding:
                          EdgeInsets.only(top: 10.0, left: 45.0, bottom: 10),
                      child: Text("Este 2", style: TextStyle(fontSize: 18)),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 20.0, bottom: 10),
                      child: CalculatorField(
                        inputController: _este2Controller,
                        enabled: true,
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(top: 30.0, left: 35.0),
                      child: Text("Distancia total",
                          style: TextStyle(fontSize: 18)),
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
                    double norte1 = double.parse(_norte1Controller.text);
                    double norte2 = double.parse(_norte2Controller.text);
                    double este1 = double.parse(_este1Controller.text);
                    double este2 = double.parse(_este2Controller.text);

                    _totalController.text = sqrt(
                            pow((norte1 - norte2), 2) + pow((este1 - este2), 2))
                        .toStringAsFixed(2);
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
