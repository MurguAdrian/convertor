// ignore: avoid_web_libraries_in_flutter
import 'dart:html';

import 'package:flutter/material.dart';

void main() {
  runApp(Convertor());
}

class Convertor extends StatefulWidget {
  @override
  State<Convertor> createState() => _ConvertorState();
}

class _ConvertorState extends State<Convertor> {
  final TextEditingController controller = TextEditingController();

  String? errorText;

  double conversie = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
            title: const Center(
                child: Text("Convertor",
                    style: TextStyle(color: Colors.red, fontSize: 35.5)))),
        body: Column(
          children: <Widget>[
            Image.network(
              "https://image.shutterstock.com/image-photo/euro-money-cash-background-banknotes-600w-768058264.jpg",
            ),

            Container(
              child: TextField(
                controller: controller,
                keyboardType: TextInputType.numberWithOptions(decimal: true),
                decoration: InputDecoration(
                  hintText: "Introduceti Valoarea",
                  errorText: errorText,
                  suffix: IconButton(
                    icon: Icon(Icons.close),
                    onPressed: () {
                      controller.clear();
                    },
                  ),
                ),
              ),
            ),
            IconButton(
              icon: Icon(Icons.euro),
              onPressed: () {
                final String value = controller.text;
                final double? doublevalue = double.tryParse(value);

                setState(() {
                  if (doublevalue == null) {
                    errorText = 'This is not a number';
                    conversie = 0;
                  } else {
                    errorText = '';
                    conversie = doublevalue * 4.948;
                  }
                });
              },
            ),
            conversie == 0 ? Text('') : Text('${conversie.toStringAsFixed(2)} lei'),
          ],
        ),
      ),
    );
  }
}
