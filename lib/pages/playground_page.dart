import 'package:flutter/material.dart';
import 'package:snippet_coder_utils/hex_color.dart';
import 'package:topo_app/components/overlayed_widget.dart';
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

  final List<Widget> _addedWidgets = [];
  final List<Vector> vectores = [
    Vector(1, "chico", "chico.png", 100, 59),
    Vector(2, "carro", "carro.png", 102, 221),
    Vector(3, "brujula", "Brujula.png", 100, 100),
    Vector(4, "linea punteada", "linea_punteada.png", 100, 91),
  ];

  bool _isDeleteButtonActive = false;
  bool _showDeleteButton = false;
  bool _showAppBar = true;

  @override
  Widget build(BuildContext context) {
    return StatefulBuilder(
      builder: (context, refresh) {
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
                showModalBottomSheet(
                    context: context,
                    builder: (BuildContext c) {
                      return Card(
                          elevation: 3.0,
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
                                    const Padding(
                                      padding: EdgeInsets.all(8.0),
                                      child: Text(
                                        'Vectores',
                                        style: TextStyle(
                                            fontSize: 18.0,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                    const Divider(
                                      height: 20.0,
                                    ),
                                    Expanded(
                                      child: GridView.builder(
                                        itemCount: vectores.length,
                                        gridDelegate:
                                            const SliverGridDelegateWithFixedCrossAxisCount(
                                                crossAxisCount: 3),
                                        itemBuilder: (context, index) {
                                          return GestureDetector(
                                            onTap: () {
                                              refresh(() {
                                                _addedWidgets
                                                    .add(OverlayedWidget(
                                                  key: Key(_addedWidgets.length
                                                      .toString()),
                                                  child: SizedBox(
                                                    width:
                                                        vectores[index].width,
                                                    height:
                                                        vectores[index].height,
                                                    child: Image.asset(
                                                      'assets/images/' +
                                                          vectores[index].foto,
                                                      fit: BoxFit.fill,
                                                    ),
                                                  ),
                                                  onDragStart: () {
                                                    if (!_showDeleteButton) {
                                                      refresh(() {
                                                        _showDeleteButton =
                                                            true;
                                                      });
                                                    }
                                                  },
                                                  onDragEnd: (offset, key) {
                                                    if (_showDeleteButton) {
                                                      refresh(() {
                                                        _showDeleteButton =
                                                            false;
                                                      });
                                                    }
                                                    if (offset.dy > height!) {
                                                      _addedWidgets.removeWhere(
                                                          (element) =>
                                                              element.key ==
                                                              key);
                                                    }
                                                  },
                                                  onDragUpdate: (offset, key) {
                                                    if (offset.dy > height!) {
                                                      if (!_isDeleteButtonActive) {
                                                        refresh(() {
                                                          _isDeleteButtonActive =
                                                              true;
                                                        });
                                                      }
                                                    } else {
                                                      if (_isDeleteButtonActive) {
                                                        refresh(() {
                                                          _isDeleteButtonActive =
                                                              false;
                                                        });
                                                      }
                                                    }
                                                  },
                                                ));
                                              });
                                              Navigator.pop(c);
                                            },
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(10.0),
                                              child: Column(
                                                children: [
                                                  Image.asset(
                                                    "assets/images/" +
                                                        vectores[index].foto,
                                                    height: 80,
                                                  ),
                                                  Text(vectores[index].nombre)
                                                ],
                                              ),
                                            ),
                                          );
                                        },
                                      ),
                                    )
                                  ])));
                    });
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

}
