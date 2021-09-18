import 'package:flutter/material.dart';
import 'dart:math';

String result = "";
const Color txtclr = Color.fromARGB(255,84,163,123);
const Color btnclr = Color.fromARGB(255,244,244,244);
const Color black = Color.fromARGB(255,46,46,46);

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  
  Widget btnStyle(String btnTxt,Color btnClr,Color txtClr) {
    return ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Stack(
              children: <Widget>[
                Positioned.fill(
                  child: Container(
                    decoration: BoxDecoration(
                      color: btnClr
                    ),
                  ),
                ),
                TextButton(
                  style: TextButton.styleFrom(
                    padding: const EdgeInsets.fromLTRB(20,10,20,10),
                    primary:  txtClr,
                    textStyle: const TextStyle(fontSize: 28),
                  ),
                  onPressed: () => update(btnTxt),
                  child: Text(btnTxt),
                ),
              ],
            ),
          );
  }
  
  update(String btnTxt){
    setState(() { result += btnTxt; });
  }
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: const Color.fromARGB(255,252,252,252),
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                flex: 1,
                child: Text(
                    result,
                    style: const TextStyle(fontSize: 50, color: Color.fromARGB(255,46,46,46)),
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
                              Icons.backspace_outlined,
                              color: txtclr,
                            ),
                            onPressed: () => {setState(() { result = result.substring(0,max(result.length-1,0)); })
                            },
                            backgroundColor: btnclr,
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          btnStyle(
                              "c",
                              btnclr,
                              const Color.fromARGB(255,228,95,59)),
                          btnStyle(
                              "( )",
                              btnclr,
                              txtclr),
                          btnStyle(
                              "%",
                              btnclr,
                              txtclr),
                          btnStyle(
                              "/",
                              btnclr,
                              txtclr),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          btnStyle(
                              "7",
                              btnclr,
                              black),
                          btnStyle(
                              "8",
                              btnclr,
                              black),
                          btnStyle(
                              "9",
                              btnclr,
                              black),
                          btnStyle(
                              "x",
                              btnclr,
                              txtclr),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          btnStyle(
                              "4",
                              btnclr,
                              black),
                          btnStyle(
                              "5",
                              btnclr,
                              black),
                          btnStyle(
                              "6",
                              btnclr,
                              black),
                          btnStyle(
                              "-",
                              btnclr,
                              txtclr),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          btnStyle(
                              "1",
                              btnclr,
                              txtclr),
                          btnStyle(
                              "2",
                              btnclr,
                              black),
                          btnStyle(
                              "3",
                              btnclr,
                              black),
                          btnStyle(
                              "+",
                              btnclr,
                              txtclr),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          btnStyle(
                              "+/-",
                              btnclr,
                              black),
                          btnStyle(
                              "0",
                              btnclr,
                              black),
                          btnStyle(
                              ".",
                              btnclr,
                              black),
                          btnStyle(
                              "=",
                              txtclr,
                              Colors.white),
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

void main() {
  runApp(const MyApp());
}

  class MyApp extends StatelessWidget {
    const MyApp({Key? key}) : super(key: key);

    @override
    Widget build(BuildContext context) {
      return const MaterialApp(
        home: HomeScreen(),
      );
    }
  }
