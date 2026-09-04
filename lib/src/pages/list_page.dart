import 'package:flutter/material.dart';

class ListPage extends StatelessWidget {
  const ListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('List'),
      ),
      body: Column(
        children: [Text("List")],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.pop(context), 
        child: const Icon(Icons.arrow_back), 
      ),
    );
  }
}