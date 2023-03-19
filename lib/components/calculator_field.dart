import 'package:flutter/material.dart';
import 'package:snippet_coder_utils/hex_color.dart';

class CalculatorField extends StatelessWidget {
  final TextEditingController inputController;
  final bool enabled;

  const CalculatorField({Key? key, required this.inputController, required this.enabled})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: inputController,
      keyboardType: TextInputType.number,
      style: const TextStyle(height: 1),
      enabled: enabled,
      decoration: InputDecoration(
          border: const OutlineInputBorder(),
          filled: true,
          fillColor: HexColor("#E8E8E8"),
          labelStyle: const TextStyle(color: Colors.black)),
    );
  }
}
