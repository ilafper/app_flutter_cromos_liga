import 'package:app_flutter_cromos_liga/login.dart';
import 'package:flutter/material.dart';

class PerfilView extends StatefulWidget {
  const PerfilView({super.key});

  @override
  State<PerfilView> createState() => _PerfilView();
}

class _PerfilView extends State<PerfilView> {
  // 1. Variables de estado (datos que van a cambiar)
  
  // 2. Método para actualizar el estado y redibujar la vista
  

  @override
  Widget build(BuildContext context) {
    // 3. Estructura visual de la vista
    return Scaffold(
      appBar: AppBar(
        title: const Text("perfil"),
        backgroundColor: Colors.blueAccent,
      ),

      body: Center(
        
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => loginPage(),
                  ),
                );
              },
              child: Text("Cerrar Sesion"),
            ),
          ],
        ),
      ),
      
    );
  }
}
