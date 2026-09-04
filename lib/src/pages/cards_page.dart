import 'dart:convert';
import 'dart:typed_data';
import 'package:flutter/material.dart';

final Uint8List _kTransparentImage = base64Decode(
  'R0lGODlhAQABAIAAAAAAAP///ywAAAAAAQABAAACAUwAOw==',
);

class _Producto {
  final String titulo;
  final String url;

  _Producto(this.titulo, this.url);
}

final List<_Producto> _productos = [
  _Producto('Montaña', 'https://picsum.photos/id/1015/400/250'),
  _Producto('Playa', 'https://picsum.photos/id/1016/400/250'),
  _Producto('Bosque', 'https://picsum.photos/id/1018/400/250'),
];

class CardsPage extends StatelessWidget {
  const CardsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cards - Tarjetas'),
      ),
      body: ListView.builder(
        itemCount: _productos.length,
        itemBuilder: (BuildContext context, int index) {
          final producto = _productos[index];
          return Card(
            margin: const EdgeInsets.all(10),
            clipBehavior: Clip.antiAlias,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                FadeInImage(
                  placeholder: MemoryImage(_kTransparentImage),
                  image: NetworkImage(producto.url),
                  fit: BoxFit.cover,
                  height: 180,
                  width: double.infinity,
                ),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Text(
                    producto.titulo,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.pop(context),
        child: const Icon(Icons.arrow_back),
      ),
    );
  }
}
