import 'dart:math';
import 'package:flutter/material.dart';

class Calc extends StatefulWidget {
  const Calc({super.key});

  @override
  State<Calc> createState() => CalcState();
}

class CalcState extends State<Calc> {
  int myVar = 0;
  TextEditingController control1 = TextEditingController();
  TextEditingController control2 = TextEditingController();

  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      Padding(
          padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 30.0),
          child: TextField(
              controller: control1,
              keyboardType: TextInputType.number,
              textAlign: TextAlign.center,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(), hintText: "Primeiro valor"))),
      Padding(
          padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 30.0),
          child: TextField(
              controller: control2,
              keyboardType: TextInputType.number,
              textAlign: TextAlign.center,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(), hintText: "Segundo valor"))),
      Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
        ElevatedButton(
            child: const Text("Somar"),
            onPressed: () {
              int n1 = int.parse(control1.text);
              int n2 = int.parse(control2.text);
              setState(() {
                myVar = n1 + n2;
              });
            }),
        ElevatedButton(
            child: const Text("Subtrair"),
            onPressed: () {
              int n1 = int.parse(control1.text);
              int n2 = int.parse(control2.text);
              setState(() {
                myVar = n1 - n2;
              });
            }),
        ElevatedButton(
            child: const Text("Multiplicar"),
            onPressed: () {
              int n1 = int.parse(control1.text);
              int n2 = int.parse(control2.text);
              setState(() {
                myVar = n1 * n2;
              });
            }),
        ElevatedButton(
            child: const Text("Dividir"),
            onPressed: () {
              int n1 = int.parse(control1.text);
              int n2 = int.parse(control2.text);
              if (n2 != 0) {
                setState(() {
                  myVar = n1 ~/ n2;
                });
              } else {
                showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: const Text("Erro"),
                      content: const Text("Não é possível dividir por zero."),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: const Text("OK"),
                        ),
                      ],
                    );
                  },
                );
              }
            }),
        ElevatedButton(
            child: const Text("Exponenciar"),
            onPressed: () {
              int n1 = int.parse(control1.text);
              int n2 = int.parse(control2.text);
              setState(() {
                myVar = pow(n1.toDouble(), n2.toDouble()).toInt();
              });
            }),
      ]),
      Padding(
          padding: const EdgeInsets.only(top: 30.0),
          child: Text("$myVar",
              style: const TextStyle(
                  color: Colors.blueAccent,
                  fontSize: 45.0,
                  fontWeight: FontWeight.bold)))
    ]));
  }
}
