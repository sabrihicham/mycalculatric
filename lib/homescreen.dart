import 'package:flutter/material.dart';

import 'btn.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.black87,
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                flex: 1,
                child: Container(
                  child: Text(
                    "rslt",
                    style: TextStyle(fontSize: 50, color: Colors.amber),
                  ),
                ),
              ),
              Expanded(
                  flex: 2,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const SizedBox(
                            width: 310,
                          ),
                          FloatingActionButton(
                            child: const Icon(
                              Icons.delete,
                              color: Colors.red,
                            ),
                            onPressed: () {},
                            backgroundColor: Colors.white,
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: const [
                          BtnStyle(
                              btnTxt: "c",
                              btnClr: Colors.white,
                              txtClr: Colors.black),
                          BtnStyle(
                              btnTxt: "()",
                              btnClr: Colors.white,
                              txtClr: Colors.black),
                          BtnStyle(
                              btnTxt: "%",
                              btnClr: Colors.white,
                              txtClr: Colors.black),
                          BtnStyle(
                              btnTxt: "/",
                              btnClr: Colors.white,
                              txtClr: Colors.black),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: const [
                          BtnStyle(
                              btnTxt: "7",
                              btnClr: Colors.white,
                              txtClr: Colors.black),
                          BtnStyle(
                              btnTxt: "8",
                              btnClr: Colors.white,
                              txtClr: Colors.black),
                          BtnStyle(
                              btnTxt: "9",
                              btnClr: Colors.white,
                              txtClr: Colors.black),
                          BtnStyle(
                              btnTxt: "x",
                              btnClr: Colors.white,
                              txtClr: Colors.black),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: const [
                          BtnStyle(
                              btnTxt: "4",
                              btnClr: Colors.white,
                              txtClr: Colors.black),
                          BtnStyle(
                              btnTxt: "5",
                              btnClr: Colors.white,
                              txtClr: Colors.black),
                          BtnStyle(
                              btnTxt: "6",
                              btnClr: Colors.white,
                              txtClr: Colors.black),
                          BtnStyle(
                              btnTxt: "-",
                              btnClr: Colors.white,
                              txtClr: Colors.black),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: const [
                          BtnStyle(
                              btnTxt: "1",
                              btnClr: Colors.white,
                              txtClr: Colors.black),
                          BtnStyle(
                              btnTxt: "2",
                              btnClr: Colors.white,
                              txtClr: Colors.black),
                          BtnStyle(
                              btnTxt: "3",
                              btnClr: Colors.white,
                              txtClr: Colors.black),
                          BtnStyle(
                              btnTxt: "+",
                              btnClr: Colors.white,
                              txtClr: Colors.black),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: const [
                          BtnStyle(
                              btnTxt: "+/-",
                              btnClr: Colors.white,
                              txtClr: Colors.black),
                          BtnStyle(
                              btnTxt: "0",
                              btnClr: Colors.white,
                              txtClr: Colors.black),
                          BtnStyle(
                              btnTxt: ".",
                              btnClr: Colors.white,
                              txtClr: Colors.black),
                          BtnStyle(
                              btnTxt: "=",
                              btnClr: Colors.green,
                              txtClr: Colors.white),
                        ],
                      ),
                    ],
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
