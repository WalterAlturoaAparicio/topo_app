import 'package:flutter/material.dart';
import 'package:flutter_swiper_null_safety/flutter_swiper_null_safety.dart';
import 'package:snippet_coder_utils/hex_color.dart';
import 'package:topo_app/components/main_botton.dart';
import 'package:topo_app/pages/manual.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String mainColor = "#14173b";
  List<String> images = [
    "banner1.png",
    "banner2.png",
    "banner3.png",
    "banner4.png",
    "banner5.png",
    "banner6.png"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Topo App"),
        backgroundColor: HexColor("#0b0d24"),
        leading: Padding(
            padding: const EdgeInsets.all(5.0),
            child: Image.asset(
              "assets/images/logoTopoApp.jpg",
            )),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.info_outline),
            iconSize: 30.0,
            color: Colors.white,
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ManualPage(),
                  ));
            },
          ),
        ],
      ),
      body: Stack(children: <Widget>[
        Positioned.fill(
          child: Image.asset(
            "assets/images/banda_policia.png",
            fit: BoxFit.fitWidth,
            alignment: Alignment.bottomLeft,
          ),
        ),

        // Positioned.fill(
        //   child: Align(
        //     alignment: Alignment.topCenter,
        //     child: Image.asset(
        //       "assets/images/banner1.png",
        //       height: 300,
        //     ),
        //   ),
        // ),
        _swiper(),
        Padding(
          padding: const EdgeInsets.only(top: 310.0, left: 20, right: 20),
          child: GridView.count(
            crossAxisCount: 2,
            childAspectRatio: 5 / 3,
            children: const <Widget>[
              MainButton(
                titulo: 'Crear',
                icono: Icons.edit_rounded,
                direction: "new",
              ),
              MainButton(
                titulo: 'Calculadora',
                icono: Icons.calculate,
                direction: "calculator",
              ),
              MainButton(
                titulo: 'Foto',
                icono: Icons.camera_alt,
                direction: "photo",
              ),
              MainButton(
                titulo: 'Mapa',
                icono: Icons.map,
                direction: "map",
              ),
            ],
          ),
        ),
      ]),
      backgroundColor: HexColor(mainColor),
    );
  }

  Widget _swiper() {
    return SizedBox(
      width: double.infinity,
      height: 300,
      child: Swiper(
          itemBuilder: (BuildContext context, int index) {
            return Image.asset(
              "assets/images/" + images[index],
              fit: BoxFit.fitHeight,
            );
          },
          itemCount: images.length,
          control: const SwiperControl()),
    );
  }
}
