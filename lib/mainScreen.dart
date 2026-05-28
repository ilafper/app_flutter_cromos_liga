import 'package:app_flutter_cromos_liga/home.dart';
import 'package:app_flutter_cromos_liga/perfil.dart';
import 'package:app_flutter_cromos_liga/shop.dart';
import 'package:flutter/material.dart';
import 'coleccion.dart';
import 'shop.dart';
import 'repetidos.dart';
import 'perfil.dart';
import 'component/bottonNavigattor.dart';

class Mainscreen extends StatefulWidget {
  @override
  State<Mainscreen> createState() => _MainScreenState();

}


class _MainScreenState extends State<Mainscreen> {
  
  int vistaActual = 0;

  final lista_paginas=[
    Home(),
    ColecctionView(),
    ShopView(),
    RepetidosViews(),
    PerfilView()
  ];
  

  @override
  Widget build(BuildContext context){
    return Scaffold(

      body: lista_paginas[vistaActual],
      
      bottomNavigationBar: CustomNavigator(
        
        currentIndex:vistaActual,
        
        onTap:(index){
          setState(() {
            vistaActual= index;
          });
        },
      ),
    );
  }
}