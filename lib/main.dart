import 'package:flutter/material.dart';

void main() {
  runApp(const Calculadora3App());
}

class Calculadora3App extends StatelessWidget {
  const Calculadora3App({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Calculadora(),
    );
  }
}

class Calculadora extends StatefulWidget {
  const Calculadora({super.key});

  @override
  State<Calculadora> createState() => _CalculadoraState();
}

class _CalculadoraState extends State<Calculadora> {
  String pantalla = '';
  double numero1 = 0;
  double numero2 = 0;
  String operador = '';

  void presionar(String valor) {
    setState(() {
      if (valor == 'C') {
        pantalla = '';
        numero1 = 0;
        numero2 = 0;
        operador = '';
      } else if (['+', '-', '*', '/'].contains(valor)) {
        numero1 = double.parse(pantalla);
        operador = valor;
        pantalla = '';
      } else if (valor == '=') {
        numero2 = double.parse(pantalla);
        switch (operador) {
          case '+':
            pantalla = (numero1 + numero2).toString();
            break;
          case '-':
            pantalla = (numero1 - numero2).toString();
            break;
          case '*':
            pantalla = (numero1 * numero2).toString();
            break;
          case '/':
            pantalla = numero2 != 0 ? (numero1 / numero2).toString() : 'Error';
            break;
        }
      } else {
        pantalla += valor;
      }
    });
  }

  Widget boton(String texto) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(6),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color.fromARGB(223, 185, 112, 17), // color del botón
            foregroundColor: Colors.white,   // color del texto
          ),
          onPressed: () => presionar(texto),
          child: Text(texto, style: const TextStyle(fontSize: 22)),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200], // color de fondo
      appBar: AppBar(
        title: const Text(
          'Calculadora',
          style: TextStyle(color: Colors.white), // título blanco
        ),
        backgroundColor: Colors.black,   // color de la barra superior
      ),
      body: Column(
        children: [
          Container(
            alignment: Alignment.centerRight,
            padding: const EdgeInsets.all(20),
            child: Text(
              pantalla.isEmpty ? '0' : pantalla,
              style: const TextStyle(fontSize: 40),
            ),
          ),
          Row(children: [boton('7'), boton('8'), boton('9'), boton('/')]),
          Row(children: [boton('4'), boton('5'), boton('6'), boton('*')]),
          Row(children: [boton('1'), boton('2'), boton('3'), boton('-')]),
          Row(children: [boton('0'), boton('C'), boton('='), boton('+')]),
        ],
      ),
    );
  }
} // <- cierra la clase _CalculadoraState
