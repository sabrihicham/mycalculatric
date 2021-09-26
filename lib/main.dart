import 'package:flutter/material.dart';
import "dart:collection" show Queue;
import 'dart:math';

const Color green = Color.fromARGB(255, 84, 163, 123);
const Color grey = Color.fromARGB(255, 244, 244, 244);
const Color black = Color.fromARGB(255, 46, 46, 46);

String input = "";
String output = "";

void main() => runApp(Calculator());

class Calculator extends StatefulWidget {
  @override
  _CalculatorState createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  int indexer = 0;

  List<Widget> history = []; //History of operations

  List<String> leftSide = [
    "C",
    "7",
    "4",
    "1",
    "+/-",
    "( )",
    "8",
    "5",
    "2",
    "0",
    "%",
    "9",
    "6",
    "3",
    "."
  ];
  List<String> rightSide = ["÷", "x", "-", "+", "="];

  void switcher() => setState(() => indexer = indexer == 0 ? 1 : 0);

  //History Detail Box
  Widget detailBox({input_, output_}) {
    return GestureDetector(
      onTap: () => setState(() => {input = input_, output = output_}),
      child: Container(
        color: Colors.white,
        alignment: Alignment.centerRight,
        child: Column(children: [
          Padding(
              padding: const EdgeInsets.fromLTRB(0, 5, 15, 2),
              child:
                  Align(alignment: Alignment.centerRight, child: Text(input_))),
          Padding(
              padding: const EdgeInsets.fromLTRB(0, 5, 15, 10),
              child: Align(
                  alignment: Alignment.centerRight,
                  child: Text("= " + output_,
                      style: const TextStyle(color: green, fontSize: 18))))
        ]),
      ),
    );
  }

  //Button Widget
  Widget myButton(
      {Color color = grey, //Button Color
      Color textColor = green, //Text Color
      String text = "", //set text to Button
      @required onpressed, //Action
      int fontSize = 37, //Text Size
      int height = 80, //Button Height
      int width = 80 //Button Width
      }) {
    return RawMaterialButton(
      constraints: BoxConstraints(
          minHeight: height.toDouble(), minWidth: width.toDouble()),
      fillColor: color,
      child: Text(
        text,
        style: TextStyle(
            color: textColor,
            fontWeight: FontWeight.w300,
            fontSize: fontSize.toDouble()),
      ),
      onPressed: onpressed,
      shape: const StadiumBorder(),
      visualDensity: VisualDensity.comfortable,
      elevation: 0,
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SafeArea(
        top: false,
        child: Scaffold(
          backgroundColor: Colors.white,
          body: Container(
            margin: const EdgeInsets.all(15),
            child: Column(
              children: [
                Expanded(
                  flex: 2,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      //Input Text
                      Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                        Padding(
                            padding: const EdgeInsets.fromLTRB(0, 80, 20, 60),
                            child: Text(
                              input,
                              style: const TextStyle(
                                  fontSize: 42, fontWeight: FontWeight.w400),
                            ))
                      ]),
                      //Output Text
                      Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                        Padding(
                            padding: const EdgeInsets.fromLTRB(0, 20, 20, 15),
                            child: Text(
                              output,
                              style: const TextStyle(
                                  color: Colors.grey,
                                  fontSize: 30,
                                  fontWeight: FontWeight.w400),
                            ))
                      ]),
                      //Options (Delte & History)
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          TextButton(
                            child: const Icon(
                              Icons.history_outlined,
                              color: Colors.grey,
                              size: 20,
                            ),
                            onPressed: () => switcher(),
                          ),
                          TextButton(
                            child: const Icon(
                              Icons.backspace_outlined,
                              color: green,
                              size: 20,
                            ),
                            onPressed: () => setState(() =>
                                input = input.substring(0, max(input.length - 1, 0))),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
                Expanded(
                  flex: 3,
                  //Container For Calculator's keys
                  child: Container(
                    padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                    margin: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                    alignment: Alignment.topCenter,
                    //Separator
                    decoration: const BoxDecoration(
                        border: Border(
                            top: BorderSide(
                              color: Colors.grey,
                              width: 0.3,
                            ))),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Expanded(
                          //Set left Side of keys and History
                          child: IndexedStack(
                            alignment: Alignment.topCenter,
                            index: indexer,
                            children: [
                              //Keys
                              Row(
                                mainAxisAlignment:
                                MainAxisAlignment.spaceEvenly,
                                children: [
                                  Column(
                                      mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                      children: List.generate(
                                          5,
                                              (index) => myButton(
                                              textColor: index == 0
                                                  ? Colors.red
                                                  : black,
                                              text: leftSide[index],
                                              onpressed: index == 0
                                                  ? () => setState(() =>
                                              {input = "", output = ""})
                                                  : () => setState(() {
                                                input +=
                                                leftSide[index];
                                                output = result(input);
                                              })))),
                                  Column(
                                      mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                      children: List.generate(
                                          5,
                                              (index) => myButton(
                                              textColor:
                                              index == 0 ? green : black,
                                              text: leftSide[5 + index],
                                              onpressed: () => setState(() {
                                                input +=
                                                leftSide[5 + index];
                                                output = result(input);
                                              })))),
                                  Column(
                                      mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                      children: List.generate(
                                          5,
                                              (index) => myButton(
                                              textColor:
                                              index == 0 ? green : black,
                                              text: leftSide[10 + index],
                                              onpressed: () => setState(() {
                                                input +=
                                                leftSide[10 + index];
                                                output = result(input);
                                              }))))
                                ],
                              ),
                              //History
                              Container(
                                  decoration: const BoxDecoration(
                                      border: Border(
                                          right: BorderSide(
                                            color: Colors.grey,
                                            width: 0.3,
                                          ))),
                                  margin:
                                  const EdgeInsets.fromLTRB(0, 0, 15, 10),
                                  alignment: Alignment.center,
                                  child: Column(children: [
                                    Expanded(
                                      child: ListView(
                                        children: history,
                                      ),
                                    ),
                                    myButton(
                                        fontSize: 23,
                                        height: 45,
                                        width: 210,
                                        color: green,
                                        textColor: Colors.white,
                                        text: "Clear history",
                                        onpressed: () =>
                                            setState(() => history.clear()))
                                  ]))
                            ],
                          ),
                        ),
                        //Set right Site of keys
                        Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: List.generate(5, (index) {
                              if (index == 4) {
                                return myButton(
                                    color: green,
                                    textColor: Colors.white,
                                    text: rightSide[index],
                                    onpressed: () => setState(() {
                                      if (output != "") {
                                        history.add(detailBox(
                                            input_: input,
                                            output_: output));
                                        input = output;
                                      }
                                      output = "";
                                    }));
                              }
                              return myButton(
                                  text: rightSide[index],
                                  onpressed: () => setState(
                                          () => input += rightSide[index]));
                            })),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
=======
void main() {
  runApp(const MyApp());
}

  class MyApp extends StatelessWidget {
    const MyApp({Key? key}) : super(key: key);

    @override
    Widget build(BuildContext context) {
      return MaterialApp(
        home: Scaffold(
          body: Column(
            children: [
              Expanded(
                child: Container(
                  color: Colors.pink,
                ),
              ),
              Expanded(
                child: Container(
                  color: Colors.green,
                ),
              )
            ],
          )

        ),
      ),
    );
  }
}

class Stack<T> {
  final _stack = Queue<T>();

  void push(T element) {
    _stack.addLast(element);
  }

  T pop() {
    final T lastElement = _stack.last;
    _stack.removeLast();
    return lastElement;
  }

  void clear() {
    _stack.clear();
  }

  int size() {
    return _stack.length;
  }

  T last() {
    return _stack.last;
  }

  bool get isEmpty => _stack.isEmpty;
}

//Calcule
int priority(String s) {
  if (s == "+" || s == "-") {
    return 1;
  } else if (s == "*" || s == "/") {
    return 2;
  } else {
    return -1;
  }
}

String getinsidparentses(String calc, int index) {
  String tmp = "";
  int paren = 1;
  for (int j = index + 1; j < calc.length; ++j) {
    tmp += calc[j];
    if (calc[j] == "(") paren++;
    if (calc[j] == ")") paren--;
    if (paren == 0 && calc[j] == ")") break;
  }
  return tmp.substring(0, tmp.length - 1);
}

String getPatern(String tmp) {
  String pattern = "\\(";
  for (int j = 0; j < tmp.length; ++j) {
    if (!isNumeric(tmp[j])) {
      if (tmp[j] == "*") {
        pattern += ".";
      } else {
        pattern += "\\";
      }
    }
    pattern += tmp[j];
  }
  return pattern + "\\)";
}

String calculate(double b, double a, String o) {
  switch (o) {
    case "+":
      return (a + b).toString();
    case "-":
      return (a - b).toString();
    case "*":
      return (a * b).toString();
    case "/":
      return (a / b).toString();
    case "%":
      return (a % b).toString();
  }
  throw "Hahaaa";
}

bool isNumeric(String s) {
  return (double.tryParse(s) != null) || s == ".";
}

String result(String calc) {
  Stack<String> num = Stack<String>();
  Stack<String> opr = Stack<String>();
  String str = "";

  calc = calc.replaceAll("x", "*").replaceAll("÷", "/");

  for (int i = 0; i < calc.length; ++i) {
    if (calc[i] == "(") {
      String synth = getinsidparentses(calc, i);
      calc = calc.replaceFirst(RegExp(getPatern(synth)), result(synth));
    }

    if (isNumeric(calc[i])) {
      str += calc[i];
      if (i == calc.length - 1) num.push(str);
    } else {
      num.push(str);
      str = "";

      if (opr.size() >= 1 &&
          (calc[i] == "*" || calc[i] == "/") &&
          priority(calc[i]) > priority(opr.last())) {
        opr.push(calc[i]);
        continue;
      }

      if (num.size() > 1) {
        num.push(calculate(
            double.parse(num.pop()), double.parse(num.pop()), opr.pop()));
      }

      opr.push(calc[i]);
    }
  }

  while (opr.size() > 0) {
    num.push(
        calculate(double.parse(num.pop()), double.parse(num.pop()), opr.pop()));
  }

  return num.pop();
}
