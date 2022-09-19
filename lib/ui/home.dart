import 'package:flutter/material.dart';
import 'result.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController pesoController = TextEditingController();
  TextEditingController alturaController = TextEditingController();
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  void _resetCampos() {
    pesoController.clear();
    alturaController.clear();
    _formKey.currentState!.reset();
  }

  void _calcular() {
    String texto;
    String imagem;
    double peso = double.parse(pesoController.text);
    double altura = double.parse(alturaController.text) / 100;
    double imc = peso / (altura * altura);
    if (imc < 18.6) {
      texto = "Abaixo do peso (${imc.toStringAsPrecision(4)})";
      imagem = "images/thin.png";
    } else if (imc >= 18.6 && imc < 24.9) {
      texto = "Peso ideal (${imc.toStringAsPrecision(4)})";
      imagem = "images/shape.png";
    } else if (imc >= 24.9 && imc < 29.9) {
      texto = "Levemente acima do peso (${imc.toStringAsPrecision(4)})";
      imagem = "images/fat.png";
    } else if (imc >= 29.9 && imc < 34.9) {
      texto = "Obesidade Grau I (${imc.toStringAsPrecision(4)})";
      imagem = "images/fat.png";
    } else if (imc >= 34.9 && imc < 39.9) {
      texto = "Obesidade Grau II (${imc.toStringAsPrecision(4)})";
      imagem = "images/fat.png";
    } else {
      texto = "Obesidade Grau III (${imc.toStringAsPrecision(4)})";
      imagem = "images/fat.png";
    }
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => Result(imagem, texto)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Calculadora de IMC"),
        centerTitle: true,
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: _resetCampos,
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              const Icon(Icons.person, size: 120, color: Colors.green),
              TextFormField(
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: "Peso (kg)",
                  labelStyle: TextStyle(color: Colors.green),
                ),
                textAlign: TextAlign.center,
                style: const TextStyle(color: Colors.green, fontSize: 25.0),
                controller: pesoController,
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Insira seu peso!";
                  } else {
                    return null;
                  }
                },
              ),
              TextFormField(
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: "Altura (cm)",
                  labelStyle: TextStyle(color: Colors.green),
                ),
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Colors.green,
                  fontSize: 25.0,
                ),
                controller: alturaController,
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Insira sua altura!";
                  } else {
                    return null;
                  }
                },
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10.0, bottom: 10.0),
                child: ButtonTheme(
                    height: 50.0,
                    highlightColor: Colors.amber,
                    child: ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) _calcular();
                      },
                      child: const Text(
                        "Calcular",
                        style: TextStyle(color: Colors.white, fontSize: 25.0),
                      ),
                    )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
