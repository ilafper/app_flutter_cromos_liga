import 'package:app_flutter_cromos_liga/home.dart';
import 'package:app_flutter_cromos_liga/perfil.dart';
import 'package:app_flutter_cromos_liga/shop.dart';
import 'package:flutter/material.dart';
import 'coleccion.dart';
import 'repetidos.dart';
import 'component/bottonNavigattor.dart';

class Mainscreen extends StatefulWidget {
  @override
  State<Mainscreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<Mainscreen> {
  int vistaActual = 0;
  //lista de las paginas que hay en el proyecto
  final lista_paginas = [
    Home(),
    ColecctionView(),
    ShopView(),
    RepetidosViews(),
    PerfilView()
  ];
  // lista de los nombre
  final List<String> nombresPaginas = [
    "Inicio",
    "Colección", 
    "Tienda",
    "Repetidos",
    "Perfil"
  ];
  
  final List<IconData> iconosPaginas = [
    Icons.home,
    Icons.collections,
    Icons.store,
    Icons.repeat,
    Icons.person
  ];

  @override
  Widget build(BuildContext context) {
    // Detectar si es escritorio (ancho > 800px)
    final bool isDesktop = MediaQuery.of(context).size.width > 800;
    
    return Scaffold(
      
      // Menú lateral SOLO en escritorio
      drawer: isDesktop ? null : null, // No usamos drawer tradicional
      
      // Usamos diferente layout según plataforma
      body: isDesktop ? _buildDesktopLayout() : _buildMobileLayout(),
    );
  }
  
  //vista de escritorio
  Widget _buildDesktopLayout() {
    return Row(
      children: [
        // Menú lateral izquierdo
        Container(
          width: 280,
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 26, 29, 42),
            border: Border(
              right: BorderSide(
                color: Colors.white.withOpacity(0.1),
                width: 1,
              ),
            ),
          ),
          child: Column(
            children: [
              
              const SizedBox(height: 20,),
              Container(
                width: 100,
                height: 100,
                 decoration: BoxDecoration(
                          color: Color.fromARGB(255, 80, 97, 147),
                          shape: BoxShape.circle,
                          image: DecorationImage(
                            image: AssetImage('assets/images/logo_perfil.png'),
                            fit: BoxFit.cover,
                          ),
                        ),
                
              ),
              
              //opciones menu
              ...List.generate(lista_paginas.length, (index) {
                final isSelected = vistaActual == index;
                return ListTile(

                  leading: Icon(
                    iconosPaginas[index],
                    color: isSelected ? Colors.white : Colors.white60,
                  ),
                  title: Text(
                    nombresPaginas[index],
                    style: TextStyle(
                      color: isSelected ? Colors.white : const Color.fromARGB(179, 255, 255, 255),
                      fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                    ),
                  ),
                  tileColor: isSelected 
                      ? const Color.fromARGB(255, 125, 103, 146).withOpacity(0.3)
                      : null,
                  onTap: () {
                    setState(() {
                      vistaActual = index;
                    });
                  },
                );
              }),

             
            ],
          ),
        ),
        
        // Contenido principal
        Expanded(
          child: lista_paginas[vistaActual],
        ),
      ],
    );
  }
  
  
  Widget _buildMobileLayout() {
    return Scaffold(
      body: lista_paginas[vistaActual],
      bottomNavigationBar: CustomNavigator(
        currentIndex: vistaActual,
        onTap: (index) {
          setState(() {
            vistaActual = index;
          });
        },
      ),
    );
  }
}