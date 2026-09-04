
import 'package:flutter/material.dart';

class AvatarPage extends StatelessWidget {
  const AvatarPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('avar'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.pop(context), 
        child: const Icon(Icons.arrow_back), 
      ),
    );
  }
}