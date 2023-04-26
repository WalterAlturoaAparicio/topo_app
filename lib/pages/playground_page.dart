import 'package:flutter/material.dart';
import 'package:snippet_coder_utils/hex_color.dart';
import 'package:topo_app/components/overlayed_widget.dart';
import 'package:topo_app/models/data.dart';
import 'package:topo_app/models/vector.dart';
import 'package:topo_app/pages/edit_page.dart';

class PlayGroundPage extends StatefulWidget {
  const PlayGroundPage({Key? key}) : super(key: key);

  @override
  State<PlayGroundPage> createState() => _PlayGroundPageState();
}

class _PlayGroundPageState extends State<PlayGroundPage> {
  String mainColor = "#0b0d24";
  double? height;
  String? filter;

  final List<Widget> _addedWidgets = [];
  // final vectores = [
  //   Vector(1, "chico", "CHICO.png", 100, 59),
  //   Vector(2, "carro", "CARRO.png", 102, 221),

  //   Vector(4, "linea punteada", "linea_punteada.png", 100, 91),
  // ];

  bool _isDeleteButtonActive = false;
  bool _showDeleteButton = false;
  bool _showAppBar = true;

  @override
  Widget build(BuildContext context) {
    return StatefulBuilder(
      builder: (BuildContext context, StateSetter refresh) {
        return Scaffold(
          appBar: _showAppBar
              ? AppBar(
                  leading: Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Image.asset(
                            "assets/images/logoTopoApp.jpg",
                          ))),
                  title: const Text("Nuevo Bosquejo"),
                  backgroundColor: HexColor(mainColor),
                  actions: <Widget>[
                    IconButton(
                      icon: const Icon(Icons.arrow_forward),
                      iconSize: 30.0,
                      color: Colors.white,
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const NewFormPage()));
                      },
                    ),
                  ],
                )
              : null,
          floatingActionButton: FloatingActionButton(
              backgroundColor: HexColor(mainColor),
              onPressed: () {
                height = MediaQuery.of(context).size.height - 100;
                showModalSheet(context, refresh);
              },
              child: const Icon(Icons.add)),
          body: Stack(alignment: Alignment.center, children: [
            SizedBox(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                child: GestureDetector(
                  onDoubleTap: () {
                    refresh(() {
                      _showAppBar = !_showAppBar;
                    });
                  },
                  child: Image.asset(
                    "assets/images/fondo_cuadricula.jpg",
                    fit: BoxFit.cover,
                  ),
                )),
            for (var i = 0; i < _addedWidgets.length; i++) _addedWidgets[i],
            if (_showDeleteButton)
              Align(
                  alignment: Alignment.bottomCenter,
                  child: Padding(
                    padding: const EdgeInsets.all(60.0),
                    child: Icon(
                      Icons.delete,
                      size: _isDeleteButtonActive ? 38 : 28,
                      color: _isDeleteButtonActive
                          ? HexColor("#ff4433")
                          : HexColor(mainColor),
                    ),
                  ))
          ]),
        );
      },
    );
  }

  void showModalSheet(BuildContext context, StateSetter refresh) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext c) {
          return StatefulBuilder(builder: (BuildContext c, StateSetter state) {
            return Card(
                elevation: 6.0,
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(15),
                        topRight: Radius.circular(15))),
                child: Container(
                    padding: const EdgeInsets.only(
                        left: 16.0, top: 5.0, right: 16.0),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          _buildMainDropDown(carpetas, state),
                          const Divider(
                            height: 20.0,
                          ),
                          if (filter != null) ...<Widget>[
                            Align(
                              alignment: Alignment.topLeft,
                              child: Text(
                                filter.toString(),
                                style: const TextStyle(
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            buildVectores(c, state, refresh)
                          ]
                        ])));
          });
        });
  }

  Widget _buildMainDropDown(
      List<Map<String, Object>> carpetas, StateSetter refresh) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: DropdownButtonHideUnderline(
        child: DropdownButton(
          value: filter,
          hint: const Text(
            'Vectores',
            style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
                color: Colors.black),
          ),
          items: carpetas
              .map((json) => DropdownMenuItem(
                  child: Text(json["displayName"].toString()),
                  value: json["type"]))
              .toList(),
          onChanged: (value) {
            refresh(() {
              filter = value as String;
            });
          },
        ),
      ),
    );
  }

  Expanded buildVectores(
      BuildContext c, StateSetter state, StateSetter refresh) {
    List<Vector>? data;
    String? ruta;
    switch (filter) {
      case "Todos":
        data = carpetas[0]["data"] as List<Vector>?;
        ruta = carpetas[0]["route"] as String;
        break;
      case "Baño":
        data = carpetas[1]["data"] as List<Vector>?;
        ruta = carpetas[1]["route"] as String;
        break;
      case "Cocina":
        data = carpetas[2]["data"] as List<Vector>?;
        ruta = carpetas[2]["route"] as String;
        break;
      case "Criminalistica":
        data = carpetas[3]["data"] as List<Vector>?;
        ruta = carpetas[3]["route"] as String;
        break;
      case "Exteriores":
        data = carpetas[4]["data"] as List<Vector>?;
        ruta = carpetas[4]["route"] as String;
        break;
      case "Habitacion":
        data = carpetas[5]["data"] as List<Vector>?;
        ruta = carpetas[5]["route"] as String;
        break;
      case "Personas":
        data = carpetas[6]["data"] as List<Vector>?;
        ruta = carpetas[6]["route"] as String;
        break;
      case "Puertas y ventanas":
        data = carpetas[7]["data"] as List<Vector>?;
        ruta = carpetas[7]["route"] as String;
        break;
      case "Sala":
        data = carpetas[8]["data"] as List<Vector>?;
        ruta = carpetas[8]["route"] as String;
        break;
      case "Vehiculos":
        data = carpetas[9]["data"] as List<Vector>?;
        ruta = carpetas[9]["route"] as String;
        break;
      case "Varios":
        data = carpetas[10]["data"] as List<Vector>?;
        ruta = carpetas[10]["route"] as String;
        break;
      default:
        break;
    }
    return Expanded(
      child: GridView.builder(
        itemCount: data!.length,
        gridDelegate:
            const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
        itemBuilder: (c, index) {
          Vector vector = data![index];
          return GestureDetector(
            onTap: () {
              refresh(() {
                _addedWidgets.add(OverlayedWidget(
                  key: Key(_addedWidgets.length.toString()),
                  child: SizedBox(
                    width: vector.width,
                    height: vector.height,
                    child: Image.asset(
                      'assets/images/BLOQUES/' + ruta! + vector.foto,
                      fit: BoxFit.fill,
                    ),
                  ),
                  onDragStart: () {
                    if (!_showDeleteButton) {
                      refresh(() {
                        _showDeleteButton = true;
                      });
                    }
                  },
                  onDragEnd: (offset, key) {
                    if (_showDeleteButton) {
                      refresh(() {
                        _showDeleteButton = false;
                      });
                    }
                    if (offset.dy > height!) {
                      _addedWidgets
                          .removeWhere((element) => element.key == key);
                    }
                  },
                  onDragUpdate: (offset, key) {
                    if (offset.dy > height!) {
                      if (!_isDeleteButtonActive) {
                        refresh(() {
                          _isDeleteButtonActive = true;
                        });
                      }
                    } else {
                      if (_isDeleteButtonActive) {
                        refresh(() {
                          _isDeleteButtonActive = false;
                        });
                      }
                    }
                  },
                ));
              });
              Navigator.pop(c);
            },
            child: Padding(
              padding: const EdgeInsets.all(5.0),
              child: Column(
                children: [
                  Image.asset(
                    "assets/images/BLOQUES/" + ruta! + vector.foto,
                    height: 80,
                  ),
                  Text(
                    vector.nombre,
                    textAlign: TextAlign.center,
                    // style: const TextStyle(fontSize: 18),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
