import 'package:flutter/material.dart';

class RepetidosViews extends StatefulWidget {
  const RepetidosViews({super.key});

  @override
  State<RepetidosViews> createState() => _RepetidosViews();
}

class _RepetidosViews extends State<RepetidosViews> {
  // 1. Variables de estado (datos que van a cambiar)
  
  // 2. Método para actualizar el estado y redibujar la vista
  

  @override
  Widget build(BuildContext context) {
    // 3. Estructura visual de la vista
    return Scaffold(
      appBar: AppBar(
        title: const Text("vista cromos repetidos"),
        backgroundColor: Colors.blueAccent,
      ),

      body: Center(
        
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            const Text(
              "vista repetidos sissi"
            ),
           
          ],
        ),
      ),
      
    );
  }
}
