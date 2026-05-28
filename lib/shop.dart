import 'package:flutter/material.dart';

class ShopView extends StatefulWidget {
  const ShopView({super.key});

  @override
  State<ShopView> createState() => _ShopView();
}

class _ShopView extends State<ShopView> {
  // 1. Variables de estado (datos que van a cambiar)
  
  // 2. Método para actualizar el estado y redibujar la vista
  

  @override
  Widget build(BuildContext context) {
    // 3. Estructura visual de la vista
    return Scaffold(
      appBar: AppBar(
        title: const Text('tienda de cromos'),
        backgroundColor: Colors.blueAccent,
      ),

      body: Center(
        
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            const Text(
              "vista tienda sissi"
            ),
           
          ],
        ),
      ),
      
    );
  }
}
