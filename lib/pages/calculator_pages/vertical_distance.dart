import 'package:flutter/material.dart';
import 'package:snippet_coder_utils/hex_color.dart';
import 'package:topo_app/components/calculator_field.dart';

class VDPage extends StatefulWidget {
  const VDPage({Key? key}) : super(key: key);

  @override
  State<VDPage> createState() => _VDPageState();
}

class _VDPageState extends State<VDPage> {
  String mainColor = "#FCFCFC";
  String contrastColor = "#0b0d24";

  final TextEditingController _zeta1Controller = TextEditingController();
  final TextEditingController _zeta2Controller = TextEditingController();
  final TextEditingController _totalController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text("Distancia veritcal"),
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
                "Introduce coordenadas zeta",
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
                      child: Text("Zeta 1", style: TextStyle(fontSize: 15)),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 20.0, bottom: 10),
                      child: CalculatorField(
                        inputController: _zeta1Controller,
                        enabled: true,
                      ),
                    ),
                    const Padding(
                      padding:
                          EdgeInsets.only(top: 10.0, left: 45.0, bottom: 10),
                      child: Text("Zeta 2", style: TextStyle(fontSize: 15)),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 20.0, bottom: 10),
                      child: CalculatorField(
                        inputController: _zeta2Controller,
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
                    double zeta1 = double.parse(_zeta1Controller.text);
                    double zeta2 = double.parse(_zeta2Controller.text);
                    _totalController.text = (zeta1 - zeta2).abs().toStringAsFixed(2);
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
