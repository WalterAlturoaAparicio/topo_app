import 'package:flutter/material.dart';
import 'package:snippet_coder_utils/hex_color.dart';

class MainButton extends StatelessWidget {
  final String titulo;
  final IconData icono;
  final String direction;

  const MainButton({
    Key? key,
    required this.titulo,
    required this.icono,
    required this.direction,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String mainColor = "#0b0d24";
    String contrastColor = "#595959";

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextButton(
        style: ButtonStyle(
          foregroundColor: MaterialStateProperty.all<Color>(HexColor(contrastColor)),
          backgroundColor: MaterialStateProperty.all<Color>(HexColor(mainColor)),
        ),
        onPressed: () {
          Navigator.pushNamed(context, "/" + direction);
        },
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: InkWell(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Icon(icono, color: Colors.white, size: 18), // icon
                Text(titulo,
                    style: const TextStyle(
                        fontSize: 18, color: Colors.white)), // text
              ],
            ),
          ),
        ),
      ),
    );
  }
}
