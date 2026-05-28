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
      //estilo 
       selectedItemColor: const Color.fromARGB(255, 0, 0, 0),
       unselectedItemColor: Colors.grey,
       backgroundColor: Colors.white,

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