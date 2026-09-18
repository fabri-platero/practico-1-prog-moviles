import 'package:flutter/material.dart';

class MovingShapePage extends StatefulWidget {
  const MovingShapePage({super.key});

  @override
  State<MovingShapePage> createState() => _MovingShapePageState();
}

class _MovingShapePageState extends State<MovingShapePage> {
  Alignment _alineacion = Alignment.topLeft;
  Color _color = Colors.blue;
  double _ancho = 60.0;
  double _alto = 60.0;
  BorderRadiusGeometry _borderRadius = BorderRadius.circular(8.0);
  int _paso = 0;

  void _mover() {
    setState(() {
      _paso++;
      if (_paso > 2) _paso = 0;

      if (_paso == 1) {
        _alineacion = Alignment.topCenter;
        _color = Colors.purple;
        _ancho = 60.0;
        _alto = 150.0;
        _borderRadius = BorderRadius.circular(30.0);
      } else if (_paso == 2) {
        _alineacion = Alignment.topRight;
        _color = Colors.pinkAccent;
        _ancho = 60.0;
        _alto = 60.0;
        _borderRadius = BorderRadius.circular(30.0);
      } else {
        _alineacion = Alignment.topLeft;
        _color = Colors.blue;
        _ancho = 60.0;
        _alto = 60.0;
        _borderRadius = BorderRadius.circular(8.0);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Práctica5'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Stack(
          children: [
            AnimatedAlign(
              alignment: _alineacion,
              duration: const Duration(milliseconds: 500),
              curve: Curves.easeInOut,
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 500),
                curve: Curves.easeInOut,
                width: _ancho,
                height: _alto,
                decoration: BoxDecoration(
                  color: _color,
                  borderRadius: _borderRadius,
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.purple.shade100,
                  foregroundColor: Colors.purple.shade900,
                  elevation: 0,
                ),
                onPressed: _mover,
                child: const Text('Mover'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
