import 'package:flutter/material.dart';

class ColecctionView extends StatefulWidget {
  const ColecctionView({super.key});

  @override
  State<ColecctionView> createState() => _ColecctionView();
}

class _ColecctionView extends State<ColecctionView> {
  // 1. Variables de estado (datos que van a cambiar)
  
  // 2. Método para actualizar el estado y redibujar la vista
  

  @override
  Widget build(BuildContext context) {
    // 3. Estructura visual de la vista
    
    return Scaffold(
      appBar: AppBar(
        title: const Text('vista de todos los cromos'),
        backgroundColor: Colors.blueAccent,
      ),

      body: Center(
        
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            const Text(
              "vista collecion sissi"
            ),
           
          ],
        ),
      ),
      
    );
  }
}
