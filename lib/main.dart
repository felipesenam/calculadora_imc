import 'package:flutter/material.dart';
import 'package:calculadora_imc/ui/home.dart';

void main() {
  runApp(
    MaterialApp(
      title: "Calculadora IMC",
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: Home(),
    ),
  );
}
