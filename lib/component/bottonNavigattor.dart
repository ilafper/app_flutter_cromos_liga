import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CustomNavigator extends StatelessWidget {
  
  final int currentIndex;
  final Function(int) onTap;

  const CustomNavigator ({
    super.key,
    required this.currentIndex,
    required this.onTap
  });

  @override
  Widget build(BuildContext context){
    return BottomNavigationBar(
      // para ponerle color de fondo por que si no no va
      type: BottomNavigationBarType.fixed,
      //estilo 
      selectedItemColor: const Color.fromARGB(255, 125, 103, 146),
      unselectedItemColor: const Color.fromARGB(255, 197, 197, 213),
      backgroundColor: const Color.fromARGB(255, 26, 29, 42),
      
      currentIndex:currentIndex,
      onTap: onTap,

      items: [
        BottomNavigationBarItem(
          
          //icono
          icon: Icon(Icons.home),
          // texto
          label: "Home",
        ),



          BottomNavigationBarItem(
            //icono 
            icon: Icon(Icons.collections),
            // texto
            label: "Coleccion"
          ),


          BottomNavigationBarItem(
            //icono 
            icon: Icon(Icons.store),
            // texto
            label: "Tienda"
          ),

          BottomNavigationBarItem(
            //icono 
            icon: Icon(Icons.repeat),
            // texto
            label: "Repetidos"
          ),

          BottomNavigationBarItem(
            //icono 
            icon: Icon(Icons.person),
            // texto
            label: "Perfil"
          ),
      ],
    );
  }

}