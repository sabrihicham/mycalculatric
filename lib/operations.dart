import "dart:collection" show Queue;

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

  calc = calc.replaceAll("x", "*").replaceAll("÷", "/").replaceAll("%","%100");
  
  if(calc[0] == "-") {str += "-"; calc = calc.replaceRange(0,min(1,calc.length),"");}

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
