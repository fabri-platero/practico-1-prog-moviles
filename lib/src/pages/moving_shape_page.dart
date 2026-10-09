import 'package:flutter/material.dart';

class MovingShapePage extends StatefulWidget {
  const MovingShapePage({super.key});

  @override
  State<MovingShapePage> createState() => _MovingShapePageState();
}

class _MovingShapePageState extends State<MovingShapePage> {
  //Tamaño fijo de la figura que se mueve
  double _ladoFigura = 60.0;

  //Posición actual desde la izquierda (en pixeles)
  double _posicionX = 0.0;

  Color _color = Colors.blue;

  //Pasos de movimiento: 0 = izquierda, 1 = centro, 2 = derecha
  int _paso = 0;

  //Se calcula la posición según el ancho real de la pantalla
  void _mover(double anchoPantalla) {
    setState(() {
      _paso++;
      if (_paso > 2) _paso = 0;

      //anchoPantalla - _ladoFigura => el máximo que puede avanzar
      //sin que la figura se salga por el borde derecho
      final double limiteDerecho = anchoPantalla - _ladoFigura;

      if (_paso == 0) {
        _posicionX = 0.0; //pegado a la izquierda
        _color = Colors.blue;
      } else if (_paso == 1) {
        _posicionX = limiteDerecho / 2; //en el medio de la pantalla
        _color = Colors.purple;
      } else {
        _posicionX = limiteDerecho; //pegado a la derecha, sin pasarse
        _color = Colors.pinkAccent;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    //MediaQuery.of(context).size trae el tamaño (ancho y alto) de la
    //pantalla del dispositivo donde corre la app
    final double anchoPantalla = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Práctica5'),
      ),
      body: Stack(
        children: [
          AnimatedPositioned(
            duration: const Duration(milliseconds: 500),
            curve: Curves.easeInOut,
            top: 20.0,
            //left usa la posición en pixeles ya calculada con el ancho real
            left: _posicionX,
            child: Container(
              width: _ladoFigura,
              height: _ladoFigura,
              decoration: BoxDecoration(
                color: _color,
                borderRadius: BorderRadius.circular(10.0),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: ElevatedButton(
                onPressed: () => _mover(anchoPantalla),
                child: const Text('Mover'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
