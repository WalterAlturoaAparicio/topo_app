import 'package:flutter/material.dart';

class RecentPage extends StatefulWidget {
  const RecentPage({Key? key}) : super(key: key);

  @override
  State<RecentPage> createState() => _RecentPageState();
}

class _RecentPageState extends State<RecentPage> {

  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height / 4,
            decoration: const BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [Colors.white, Colors.white]),
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(100),
                    bottomRight: Radius.circular(100))),
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              Align(
                alignment: Alignment.center,
                child: Image.asset(
                  "assets/images/logoTopoApp.jpg",
                  width: 140,
                  fit: BoxFit.contain,
                ),
              )
            ]),
          ),
          const Padding(
            padding: EdgeInsets.only(top: 20, bottom: 20),
            child: Center(
              child: Text(
                "En desarrollo",
                style: TextStyle(fontSize: 25, color: Colors.white),
              ),
            ),
          ),
          Center(
            child: TextButton(
              style: ButtonStyle(
                foregroundColor: MaterialStateProperty.all<Color>(
                    const Color.fromARGB(255, 59, 59, 59)),
                backgroundColor: MaterialStateProperty.all<Color>(
                    const Color.fromARGB(255, 12, 12, 12)),
              ),
              onPressed: () {
                Navigator.pop(context);
              },
              child: InkWell(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const <Widget>[
                    // icon
                    Text("Back",
                        style:
                            TextStyle(fontSize: 20, color: Colors.white)), // text
                  ],
                ),
              ),
            ),
          )
        ]);
  }
}
