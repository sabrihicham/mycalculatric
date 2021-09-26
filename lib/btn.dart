import 'package:flutter/material.dart';

class BtnStyle extends StatelessWidget {
  final String btnTxt;
  final Color btnClr, txtClr;

  const BtnStyle({
    Key? key,
    required this.btnTxt,
    required this.btnClr,
    required this.txtClr,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        print(btnTxt);
      },
      child: Text(
        btnTxt,
        style: TextStyle(color: txtClr, fontSize: 30),
      ),
      backgroundColor: btnClr,
    );
  }
}
