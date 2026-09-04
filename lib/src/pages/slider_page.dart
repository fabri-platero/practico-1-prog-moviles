import 'package:flutter/material.dart';

class SliderPage extends StatelessWidget {
  const SliderPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Slider'),
      ),
      body: Column(
        children: [Text("Slider")],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.pop(context), 
        child: const Icon(Icons.arrow_back), 
      ),
    );
  }
}