import 'package:app_flutter_cromos_liga/login.dart';
import 'package:flutter/material.dart';
import '../usuarioData/usuarioDatos.dart';
class PerfilView extends StatefulWidget {
  const PerfilView({super.key});

  @override
  State<PerfilView> createState() => _PerfilView();
}

class _PerfilView extends State<PerfilView> {
  
  
  
  

  @override
  Widget build(BuildContext context) {
    // 3. Estructura visual de la vista
    print(" ${UserSession.nombre}");
    
    return Scaffold(
      backgroundColor: Color.fromARGB(255,22, 24, 35),
      appBar: AppBar(
        title: const Text("PERFIL", style: TextStyle(
          color: Colors.white,
        ),),
        backgroundColor: Color.fromARGB(255,22, 24, 35),
        bottom: PreferredSize(
    preferredSize: const Size.fromHeight(1),
    child: Container(
      height: 0.5,
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.15),
        boxShadow: [
          BoxShadow(
            color: Colors.white.withOpacity(0.08),
            blurRadius: 1,
            spreadRadius: 0.2,
          ),
        ],
      ),
    ),
  ),
      ),

      body: Center(
        
        child: Column(
          
          children: [
            const SizedBox(height: 30,),
            Column(
              
              children: [
                //imagen perfil
                Container(
                  width: 100,
                  height: 100,
                 
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255 ,38, 41, 50),
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      image: AssetImage('assets/images/logo_perfil.png'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                // nombre
                Text(
                "Hola, ${UserSession.nombre}", style: TextStyle(
                  color: Colors.white
                ),
              ),
              
                //texto extra

              ],
            ),  

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
