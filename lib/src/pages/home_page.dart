
import 'package:flutter/material.dart';
import '../provider/menu_provider.dart';
import '../utils/icon_string_util.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Widget> _listaItem(List<dynamic> data, BuildContext context) {
    return data.map((el) {
      return Column(
        
        children: [
          ListTile(
            title: Text(el['texto'] ?? ''),
            leading: getIcon(el['icon']),
            trailing: const Icon(Icons.arrow_drop_down),
            onTap: (){
              Navigator.pushNamed(context,
              el['ruta']);
            },
            
          ),
          const Divider(),
      
        ],
      );
    }).toList();
  }

  Widget _lista(BuildContext context) {
    return FutureBuilder(
      future: menuProvider.cargarDatos(),
      builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
        // 1. Manejo del estado de carga inicial
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }

        // 2. Manejo de errores o datos ausentes (Evita el TypeError)
        if (snapshot.hasError || !snapshot.hasData || snapshot.data == null) {
          return const Center(
            child: Text('Error al cargar la información o lista vacía'),
          );
        }

        // 3. Renderizado seguro una vez obtenidos los datos
        return ListView(
          children: _listaItem(snapshot.data as List<dynamic>, context),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 183, 48, 48),
        title: Text(widget.title),
      ),
      body: _lista(context),
    );
  }
}
