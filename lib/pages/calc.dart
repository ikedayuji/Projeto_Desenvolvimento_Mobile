import 'package:flutter/material.dart';
import 'dart:math';

class Calc extends StatefulWidget {
  const Calc({Key? key}) : super(key: key);

  @override
  State<Calc> createState() => CalcState();
}

class CalcState extends State<Calc> {
  double result = 0.0;
  TextEditingController control1 = TextEditingController();
  TextEditingController control2 = TextEditingController();

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calculadora'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 20.0,
              horizontal: 30.0,
            ),
            child: TextField(
              controller: control1,
              keyboardType: TextInputType.number,
              textAlign: TextAlign.center,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Primeiro valor",
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 20.0,
              horizontal: 30.0,
            ),
            child: TextField(
              controller: control2,
              keyboardType: TextInputType.number,
              textAlign: TextAlign.center,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Segundo valor",
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ElevatedButton(
                child: const Text("Somar"),
                onPressed: () {
                  double n1 = double.parse(control1.text);
                  double n2 = double.parse(control2.text);
                  setState(() {
                    result = n1 + n2;
                  });
                },
              ),
              ElevatedButton(
                child: const Text("Subtrair"),
                onPressed: () {
                  double n1 = double.parse(control1.text);
                  double n2 = double.parse(control2.text);
                  setState(() {
                    result = n1 - n2;
                  });
                },
              ),
              ElevatedButton(
                child: const Text("Multiplicar"),
                onPressed: () {
                  double n1 = double.parse(control1.text);
                  double n2 = double.parse(control2.text);
                  setState(() {
                    result = n1 * n2;
                  });
                },
              ),
              ElevatedButton(
                child: const Text("Dividir"),
                onPressed: () {
                  double n1 = double.parse(control1.text);
                  double n2 = double.parse(control2.text);
                  if (n2 != 0) {
                    setState(() {
                      result = n1 / n2;
                    });
                  } else {
                    setState(() {
                      result =
                          double.infinity; // Tratamento de divisão por zero
                    });
                  }
                },
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 30.0),
            child: Text(
              "Resultado: $result",
              style: const TextStyle(
                color: Colors.blueAccent,
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: Scaffold(
      body: Calc(),
    ),
  ));
}
