import 'package:flutter/material.dart';

class ContadorPage extends StatefulWidget {
  const ContadorPage({super.key});

  @override
  State<ContadorPage> createState() => _ContadorPageState();
}

class _ContadorPageState extends State<ContadorPage> {
  int _counter = 0;
  final List<int> numeros = [];

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  void decrementar() {
    setState(() {
      _counter--;
    });
  }

  void setear() {
    setState(() {
      _counter = 0;
    });
  }

  void multiplicar() {
    setState(() {
      _counter = _counter * 2;
    });
  }

  void guardarResultado() {
    setState(() {
      numeros.add(_counter);
    });
  }

  void vaciarResultados() {
    setState(() {
      numeros.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Contador App'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Apretaste el boton demasiadas veces:'),
            Text("Lo guardado es: $numeros"),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const SizedBox(height: 20),
            FloatingActionButton.extended(
              heroTag: 'btn_multiplicar', // 👈 HeroTag único
              icon: const Icon(Icons.calculate),
              onPressed: multiplicar,
              hoverColor: const Color.fromARGB(255, 255, 255, 255),
              label: const Text("Multiplicar"),
            ),
            const SizedBox(height: 10),
            FloatingActionButton.extended(
              heroTag: 'btn_guardar', // 👈 HeroTag único
              icon: const Icon(Icons.save_as_rounded),
              onPressed: guardarResultado,
              hoverColor: const Color.fromARGB(255, 246, 0, 189),
              label: const Text("Guardar numero en la lista"),
            ),
            const SizedBox(height: 10),
            FloatingActionButton.extended(
              heroTag: 'btn_vaciar', // 👈 HeroTag único
              icon: const Icon(Icons.clear_all),
              onPressed: vaciarResultados,
              hoverColor: const Color.fromARGB(255, 0, 238, 246),
              label: const Text("Vaciar Resultados"),
            ),
          ],
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            heroTag: 'btn_incrementar', // 👈 HeroTag único
            onPressed: _incrementCounter,
            tooltip: 'Increment',
            child: const Icon(Icons.add),
          ),
          const SizedBox(height: 10),
          FloatingActionButton(
            heroTag: 'btn_decrementar', // 👈 HeroTag único
            onPressed: decrementar,
            tooltip: 'decrementar',
            child: const Icon(Icons.remove),
          ),
          const SizedBox(height: 10),
          FloatingActionButton(
            heroTag: 'btn_setear', // 👈 HeroTag único
            onPressed: setear,
            tooltip: 'setearlo',
            child: const Icon(Icons.reset_tv),
          ),
        ],
      ),
    );
  }
}
