import 'dart:typed_data';
import 'package:flutter/gestures.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:flutter/material.dart';
import 'package:snippet_coder_utils/FormHelper.dart';
import 'package:snippet_coder_utils/ProgressHUD.dart';
import 'package:snippet_coder_utils/hex_color.dart';
import 'package:syncfusion_flutter_pdf/pdf.dart';
import 'package:topo_app/models/convetion.dart';
import 'package:topo_app/pages/mobile.dart';

class NewFormPage extends StatefulWidget {
  const NewFormPage({Key? key}) : super(key: key);

  @override
  State<NewFormPage> createState() => _NewFormPageState();
}

class _NewFormPageState extends State<NewFormPage> {
  bool isAPICallProcess = false;

  GlobalKey<FormState> globalFormKey = GlobalKey<FormState>();

  String? departamento;
  String? municipio;
  String? poliJudicial;
  String? entidad;
  String? consecutivo;
  String? anio;
  String? unidadReceptora;
  String? solicitante;
  String? fecha;
  String? hora;
  String? identificacion;

  //tabla convenciones
  final List<Widget> _addedColumns = [];
  final List<Convention> _addedConventions = [];

  String mainColor = "#14173b";

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: HexColor(mainColor),
        body: ProgressHUD(
          child: Form(
            child: _formUI(context),
            key: globalFormKey,
          ),
          inAsyncCall: isAPICallProcess,
          opacity: 0.3,
          key: UniqueKey(),
        ),
      ),
    );
  }

  Widget _formUI(BuildContext context) {
    return StatefulBuilder(
        builder: (BuildContext context, StateSetter refresh) {
      return SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppBar(
                title: const Text("Formulario FPJ 16"),
                backgroundColor: HexColor("#0b0d24"),
                leading: Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Image.asset(
                          "assets/images/logoTopoApp.jpg",
                        )))),
            const SizedBox(
              height: 20,
            ),
            const Padding(
              padding: EdgeInsets.all(15.0),
              child: Text(
                "Información principal",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: 18),
              ),
            ),
            FormHelper.inputFieldWidget(
                context, "departamento", "Departamento", (onValidateVal) {},
                (onSavedVal) {
              departamento = onSavedVal;
            },
                prefixIcon: const Icon(Icons.map),
                showPrefixIcon: true,
                borderFocusColor: Colors.white,
                prefixIconColor: Colors.white,
                textColor: Colors.white,
                borderColor: Colors.white,
                hintColor: Colors.white.withOpacity(0.7),
                borderRadius: 10),
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: FormHelper.inputFieldWidget(
                context,
                "municipio",
                "Municipio",
                (onValidateVal) {},
                (onSavedVal) {
                  municipio = onSavedVal;
                },
                prefixIcon: const Icon(Icons.maps_home_work),
                showPrefixIcon: true,
                borderFocusColor: Colors.white,
                prefixIconColor: Colors.white,
                textColor: Colors.white,
                borderColor: Colors.white,
                hintColor: Colors.white.withOpacity(0.7),
                borderRadius: 10,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: FormHelper.inputFieldWidget(
                context,
                "entidad",
                "Entidad",
                (onValidateVal) {},
                (onSavedVal) {
                  entidad = onSavedVal;
                },
                prefixIcon: const Icon(Icons.bookmark_border_outlined),
                showPrefixIcon: true,
                borderFocusColor: Colors.white,
                prefixIconColor: Colors.white,
                textColor: Colors.white,
                borderColor: Colors.white,
                hintColor: Colors.white.withOpacity(0.7),
                borderRadius: 10,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: FormHelper.inputFieldWidget(
                context,
                "unidadReceptora",
                "Unidad Receptora",
                (onValidateVal) {},
                (onSavedVal) {
                  unidadReceptora = onSavedVal;
                },
                prefixIcon: const Icon(Icons.bookmark_border_outlined),
                showPrefixIcon: true,
                borderFocusColor: Colors.white,
                prefixIconColor: Colors.white,
                textColor: Colors.white,
                borderColor: Colors.white,
                hintColor: Colors.white.withOpacity(0.7),
                borderRadius: 10,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: FormHelper.inputFieldWidget(
                context,
                "consecutivo",
                "Consecutivo",
                (onValidateVal) {},
                (onSavedVal) {
                  consecutivo = onSavedVal;
                },
                prefixIcon: const Icon(Icons.bookmark_border_outlined),
                showPrefixIcon: true,
                borderFocusColor: Colors.white,
                prefixIconColor: Colors.white,
                textColor: Colors.white,
                borderColor: Colors.white,
                hintColor: Colors.white.withOpacity(0.7),
                borderRadius: 10,
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(15.0),
              child: Text(
                "Fecha",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: 18),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: FormHelper.inputFieldWidget(
                context,
                "fecha",
                "Fecha",
                (onValidateVal) {},
                (onSavedVal) {
                  fecha = onSavedVal;
                },
                prefixIcon: const Icon(Icons.today),
                showPrefixIcon: true,
                borderFocusColor: Colors.white,
                prefixIconColor: Colors.white,
                textColor: Colors.white,
                borderColor: Colors.white,
                hintColor: Colors.white.withOpacity(0.7),
                borderRadius: 10,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: FormHelper.inputFieldWidget(
                context,
                "anio",
                "Año",
                (onValidateVal) {},
                (onSavedVal) {
                  anio = onSavedVal;
                },
                prefixIcon: const Icon(Icons.today),
                showPrefixIcon: true,
                borderFocusColor: Colors.white,
                prefixIconColor: Colors.white,
                textColor: Colors.white,
                borderColor: Colors.white,
                hintColor: Colors.white.withOpacity(0.7),
                borderRadius: 10,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: FormHelper.inputFieldWidget(
                context,
                "hora",
                "Hora",
                (onValidateVal) {},
                (onSavedVal) {
                  hora = onSavedVal;
                },
                prefixIcon: const Icon(Icons.timer_sharp),
                showPrefixIcon: true,
                borderFocusColor: Colors.white,
                prefixIconColor: Colors.white,
                textColor: Colors.white,
                borderColor: Colors.white,
                hintColor: Colors.white.withOpacity(0.7),
                borderRadius: 10,
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(15.0),
              child: Text(
                "Información del que registra",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: 18),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: FormHelper.inputFieldWidget(
                context,
                "solicitante",
                "Servidor que elaboró",
                (onValidateVal) {},
                (onSavedVal) {
                  solicitante = onSavedVal;
                },
                prefixIcon: const Icon(Icons.person),
                showPrefixIcon: true,
                borderFocusColor: Colors.white,
                prefixIconColor: Colors.white,
                textColor: Colors.white,
                borderColor: Colors.white,
                hintColor: Colors.white.withOpacity(0.7),
                borderRadius: 10,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: FormHelper.inputFieldWidget(
                context,
                "identificacion",
                "Identificacion",
                (onValidateVal) {},
                (onSavedVal) {
                  identificacion = onSavedVal;
                },
                prefixIcon: const Icon(Icons.contacts),
                showPrefixIcon: true,
                borderFocusColor: Colors.white,
                prefixIconColor: Colors.white,
                textColor: Colors.white,
                borderColor: Colors.white,
                hintColor: Colors.white.withOpacity(0.7),
                borderRadius: 10,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Text.rich(TextSpan(children: [
                TextSpan(
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        refresh(() {
                          final element = "element" +
                              (_addedColumns.length + 1).toString();

                          final convention = Convention(
                              element, element + "a", element + "b");

                          _addedConventions.add(convention);
                          _addedColumns.add(buildColumnElement(convention));
                        });
                      },
                    text: "Tabla de convenciones  ",
                    style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontSize: 18)),
                const WidgetSpan(
                  alignment: PlaceholderAlignment.middle,
                  child: Icon(
                    Icons.add_box_outlined,
                    color: Colors.white,
                    size: 23.0,
                  ),
                )
              ])),
            ),
            for (var i = 0; i < _addedColumns.length; i++)
              _addedColumns[i],
            const SizedBox(
              height: 20,
            ),
            Center(
              child: FormHelper.submitButton("Continuar", () {
                validateAndSave();
                _createPDF();
              },
                  btnColor: HexColor(mainColor),
                  borderColor: Colors.white,
                  txtColor: Colors.white,
                  borderRadius: 10),
            ),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      );
    });
  }

  bool validateAndSave() {
    final form = globalFormKey.currentState;
    if (form!.validate()) {
      form.save();
      return true;
    }
    return false;
  }

  Future<void> _createPDF() async {
    PdfDocument document = PdfDocument();

    document.pageSettings.margins.all = 0;
    final PdfPage page = document.pages.add();
    PdfGraphicsState state = page.graphics.save();

    page.graphics.drawImage(
        PdfBitmap(await _readImageData("formato_en_blanco.png")),
        const Rect.fromLTWH(-10, 0, 600, 830));

    page.graphics.rotateTransform(90);
    page.graphics.translateTransform(50, -450);
    page.graphics.drawImage(PdfBitmap(await _readImageData("ejemplo.png")),
        const Rect.fromLTWH(0, 0, 500, 330));

    state = restoreGraphics(state, page);
    page.graphics.rotateTransform(90);
    page.graphics.translateTransform(650, -450);
    page.graphics.drawImage(
        PdfBitmap(await _readImageData("BLOQUES/VARIOS/BRUJULA.png")),
        const Rect.fromLTWH(0, 0, 80, 80));

    state = restoreGraphics(state, page);
    if (departamento != null) {
      drawSomething(page, 90, 100, -482, departamento!);
      state = restoreGraphics(state, page);
      // drawSomething(page, 90, 370, -555, "1      1");
    }
    if (municipio != null) {
      state = restoreGraphics(state, page);
      drawSomething(page, 90, 300, -482, municipio!);
      state = restoreGraphics(state, page);
      // drawSomething(page, 90, 415, -555, "0     0    1");
    }

    if (entidad != null) {
      state = restoreGraphics(state, page);
      List<String> str = entidad!.split("");
      final buffer = StringBuffer("");
      buffer.writeAll(str, "     ");
      drawSomething(page, 90, 480, -555, buffer.toString());
    }

    if (unidadReceptora != null) {
      state = restoreGraphics(state, page);
      List<String> str = unidadReceptora!.split("");
      final buffer = StringBuffer("");
      buffer.writeAll(str, "    ");
      drawSomething(page, 90, 524, -555, buffer.toString());
    }
    if (anio != null) {
      state = restoreGraphics(state, page);
      List<String> str = anio!.split("");
      final buffer = StringBuffer("");
      buffer.writeAll(str, "    ");
      drawSomething(page, 90, 630, -555, buffer.toString());
    }
    if (consecutivo != null) {
      state = restoreGraphics(state, page);
      List<String> str = consecutivo!.split("");
      final buffer = StringBuffer("");
      buffer.writeAll(str, "    ");
      drawSomething(page, 90, 715, -555, buffer.toString());
    }

    if (fecha != null) {
      state = restoreGraphics(state, page);
      drawSomething(page, 90, 555, -482, fecha!);
    }

    if (hora != null) {
      state = restoreGraphics(state, page);
      List<String> str = hora!.split("");
      final buffer = StringBuffer("");
      buffer.writeAll(str, "      ");
      drawSomething(page, 90, 710, -482, buffer.toString());
    }
    if (solicitante != null) {
      state = restoreGraphics(state, page);
      drawSomething(page, 90, 330, -85, solicitante!);
    }

    if (identificacion != null) {
      state = restoreGraphics(state, page);
      drawSomething(page, 90, 560, -45, identificacion!);
    }
    page.graphics.restore(state);

    //table
    page.graphics.rotateTransform(90);
    page.graphics.drawString(
        "Convenciones", PdfStandardFont(PdfFontFamily.helvetica, 15),
        bounds: const Rect.fromLTWH(650, -350, 300, 50));

    final PdfGrid grid = PdfGrid();
    grid.columns.add(count: 3);
    final PdfGridRow headerRow = grid.headers.add(1)[0];
    headerRow.cells[0].value = 'Elemento';
    headerRow.cells[1].value = 'A';
    headerRow.cells[2].value = 'B';

    headerRow.style.font =
        PdfStandardFont(PdfFontFamily.helvetica, 12, style: PdfFontStyle.bold);

    for (var i = 0; i < _addedConventions.length; i++) {
      PdfGridRow row = grid.rows.add();
      row.cells[0].value = _addedConventions[i].name;
      row.cells[1].value = _addedConventions[i].a;
      row.cells[2].value = _addedConventions[i].b;
    }

    grid.style.cellPadding = PdfPaddings(left: 5, top: 5);

    grid.draw(
        page: page,
        bounds: Rect.fromLTWH(
            580, -300, 800, (_addedColumns.length + 1) * 100 + 100));
    page.graphics.restore(state);

    List<int> bytes = await document.save();
    document.dispose();

    saveAndLaunchFile(bytes, "Bosquejo ejemplo topo app #1");
  }

  Future<Uint8List> _readImageData(String name) async {
    final data = await rootBundle.load('assets/images/$name');
    return data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);
  }

  PdfGraphicsState restoreGraphics(PdfGraphicsState state, PdfPage page) {
    page.graphics.restore(state);
    return page.graphics.save();
  }

  void drawSomething(
      PdfPage page, double angle, double x, double y, String something) {
    page.graphics.rotateTransform(angle);
    page.graphics.translateTransform(x, y);
    page.graphics
        .drawString(something, PdfStandardFont(PdfFontFamily.helvetica, 12));
  }

  Column buildColumnElement(Convention element) {
    return Column(
      key: Key(_addedColumns.length.toString()),
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 10),
          child: FormHelper.inputFieldWidget(
            context,
            element.name,
            "Elemento " + (_addedColumns.length + 1).toString(),
            (onValidateVal) {},
            (onSavedVal) {
              element.name = onSavedVal;
            },
            prefixIcon: const Icon(Icons.adjust),
            showPrefixIcon: true,
            borderFocusColor: Colors.white,
            prefixIconColor: Colors.white,
            textColor: Colors.white,
            borderColor: Colors.white,
            hintColor: Colors.white.withOpacity(0.7),
            borderRadius: 10,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 10),
          child: FormHelper.inputFieldWidget(
            context,
            element.a,
            "Posicion A elemento " + (_addedColumns.length + 1).toString(),
            (onValidateVal) {},
            (onSavedVal) {
              element.a = onSavedVal;
            },
            prefixIcon: const Icon(Icons.polyline_outlined),
            showPrefixIcon: true,
            borderFocusColor: Colors.white,
            prefixIconColor: Colors.white,
            textColor: Colors.white,
            borderColor: Colors.white,
            hintColor: Colors.white.withOpacity(0.7),
            borderRadius: 10,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 10),
          child: FormHelper.inputFieldWidget(
            context,
            element.b,
            "Posicion B elemento " + (_addedColumns.length + 1).toString(),
            (onValidateVal) {},
            (onSavedVal) {
              element.b = onSavedVal;
            },
            prefixIcon: const Icon(Icons.polyline_outlined),
            showPrefixIcon: true,
            borderFocusColor: Colors.white,
            prefixIconColor: Colors.white,
            textColor: Colors.white,
            borderColor: Colors.white,
            hintColor: Colors.white.withOpacity(0.7),
            borderRadius: 10,
          ),
        ),
        const Padding(
          padding: EdgeInsets.all(10.0),
          child: Divider(
            height: 20.0,
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}
