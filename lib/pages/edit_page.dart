import 'dart:typed_data';
import 'package:flutter/services.dart' show rootBundle;
import 'package:flutter/material.dart';
import 'package:snippet_coder_utils/FormHelper.dart';
import 'package:snippet_coder_utils/ProgressHUD.dart';
import 'package:snippet_coder_utils/hex_color.dart';
import 'package:syncfusion_flutter_pdf/pdf.dart';
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
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: FormHelper.inputFieldWidget(
              context,
              "solicitante",
              "Solicitante",
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
    final page = document.pages.add();
    PdfGraphicsState state = page.graphics.save();

    page.graphics.drawImage(
        PdfBitmap(await _readImageData("formato_en_blanco.png")),
        const Rect.fromLTWH(-10, 0, 600, 830));
    page.graphics.rotateTransform(45);
    page.graphics.translateTransform(320, -100);
    page.graphics.drawImage(PdfBitmap(await _readImageData("carro.png")),
        const Rect.fromLTWH(0, 0, 70, 152));

    state = restoreGraphics(state, page);

    page.graphics.rotateTransform(90);
    page.graphics.translateTransform(650, -450);
    page.graphics.drawImage(PdfBitmap(await _readImageData("Brujula.png")),
        const Rect.fromLTWH(0, 0, 100, 100));

    state = restoreGraphics(state, page);

    page.graphics.translateTransform(155, 255);
    page.graphics.drawImage(
        PdfBitmap(await _readImageData("linea_punteada.png")),
        const Rect.fromLTWH(0, 0, 91, 100));

    state = restoreGraphics(state, page);

    page.graphics.translateTransform(235, 255);
    page.graphics.rotateTransform(45);
    page.graphics.drawImage(
        PdfBitmap(await _readImageData("linea_punteada.png")),
        const Rect.fromLTWH(0, 0, 91, 100));

    state = restoreGraphics(state, page);

    page.graphics.translateTransform(150, 350);
    page.graphics.drawImage(PdfBitmap(await _readImageData("chico.png")),
        const Rect.fromLTWH(0, 0, 100, 59));

    state = restoreGraphics(state, page);

    if (departamento != null) {
      drawSomething(page, 90, 180, -472, departamento!);
      state = restoreGraphics(state, page);
      drawSomething(page, 90, 370, -555, "1      1");
    }
    if (municipio != null) {
      state = restoreGraphics(state, page);
      drawSomething(page, 90, 390, -472, municipio!);
      state = restoreGraphics(state, page);
      drawSomething(page, 90, 415, -555, "0     0    1");
    }

    if (entidad != null) {
      state = restoreGraphics(state, page);
      List<String> str = entidad!.split("");
      final buffer = StringBuffer("");
      buffer.writeAll(str, "     ");
      drawSomething(page, 90, 455, -555, buffer.toString());
    }

    if (unidadReceptora != null) {
      state = restoreGraphics(state, page);
      List<String> str = unidadReceptora!.split("");
      final buffer = StringBuffer("");
      buffer.writeAll(str, "    ");
      drawSomething(page, 90, 500, -555, buffer.toString());
    }
    if (anio != null) {
      state = restoreGraphics(state, page);
      List<String> str = anio!.split("");
      final buffer = StringBuffer("");
      buffer.writeAll(str, "   ");
      drawSomething(page, 90, 600, -555, buffer.toString());
    }
    if (consecutivo != null) {
      state = restoreGraphics(state, page);
      List<String> str = consecutivo!.split("");
      final buffer = StringBuffer("");
      buffer.writeAll(str, "    ");
      drawSomething(page, 90, 670, -555, buffer.toString());
    }

    if (fecha != null) {
      state = restoreGraphics(state, page);
      drawSomething(page, 90, 555, -472, fecha!);
    }

    if (hora != null) {
      state = restoreGraphics(state, page);
      List<String> str = hora!.split("");
      final buffer = StringBuffer("");
      buffer.writeAll(str, "      ");
      drawSomething(page, 90, 710, -472, buffer.toString());
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

    List<int> bytes = await document.save();
    document.dispose();

    saveAndLaunchFile(bytes, "Bosquejo ejemplo topo app #0");
  }
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
