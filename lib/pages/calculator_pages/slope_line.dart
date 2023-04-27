import 'package:flutter/material.dart';
import 'package:snippet_coder_utils/hex_color.dart';
import 'package:topo_app/components/calculator_field.dart';

class SlopeLinePage extends StatefulWidget {
  const SlopeLinePage({Key? key}) : super(key: key);

  @override
  State<SlopeLinePage> createState() => _SlopeLinePageState();
}

class _SlopeLinePageState extends State<SlopeLinePage> {
  String mainColor = "#FCFCFC";
  String contrastColor = "#0b0d24";

  final TextEditingController _xInicialController = TextEditingController();
  final TextEditingController _yInicialController = TextEditingController();
  final TextEditingController _xFinalController = TextEditingController();
  final TextEditingController _yFinalController = TextEditingController();
  final TextEditingController _totalController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text("Pendiente de una recta"),
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
                "Introduce coordenadas iniciales y las coordenadas finales",
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.black, fontSize: 21),
              ),
              const Divider(
                height: 20.0,
                thickness: 2,
                color: Colors.black,
              ),
              SizedBox(
                height: 400,
                child: GridView.count(
                  crossAxisCount: 2,
                  childAspectRatio: 3.5,
                  children: [
                    const Padding(
                      padding:
                          EdgeInsets.only(top: 10.0, left: 45.0, bottom: 10),
                      child: Text("X Inicial", style: TextStyle(fontSize: 15)),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 20.0, bottom: 10),
                      child: CalculatorField(
                        inputController: _xInicialController,
                        enabled: true,
                      ),
                    ),
                    const Padding(
                      padding:
                          EdgeInsets.only(top: 10.0, left: 45.0, bottom: 10),
                      child: Text("Y Inicial", style: TextStyle(fontSize: 15)),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 20.0, bottom: 10),
                      child: CalculatorField(
                        inputController: _yInicialController,
                        enabled: true,
                      ),
                    ),
                    const Padding(
                      padding:
                          EdgeInsets.only(top: 10.0, left: 45.0, bottom: 10),
                      child: Text("X Final", style: TextStyle(fontSize: 15)),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 20.0, bottom: 10),
                      child: CalculatorField(
                        inputController: _xFinalController,
                        enabled: true,
                      ),
                    ),
                    const Padding(
                      padding:
                          EdgeInsets.only(top: 10.0, left: 45.0, bottom: 10),
                      child: Text("Y Final", style: TextStyle(fontSize: 15)),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 20.0, bottom: 10),
                      child: CalculatorField(
                        inputController: _yFinalController,
                        enabled: true,
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(top: 30.0, left: 35.0),
                      child: Text("Pendiente", style: TextStyle(fontSize: 15)),
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
                    double xInicial = double.parse(_xInicialController.text);
                    double yInicial = double.parse(_yInicialController.text);
                    double xFinal = double.parse(_xFinalController.text);
                    double yFinal = double.parse(_yFinalController.text);
                    double deltaX = xFinal - xInicial;
                    double deltaY = yFinal - yInicial;

                    _totalController.text =
                        (deltaY / deltaX).toStringAsFixed(2);
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
