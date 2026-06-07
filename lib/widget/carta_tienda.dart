import 'package:flutter/material.dart';

class CartasTienda extends StatelessWidget {
  
  final dynamic cromo_tienda;


  const CartasTienda({
    super.key, 
    required this.cromo_tienda, 
    });
 
  @override
  Widget build(BuildContext context) {
    //carta dusbloqueda;
    return Container(
      width: 160,  
      height: 240,
      decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 26, 29, 42),
                      borderRadius: BorderRadius.circular(14),
                      border: Border.all(
                        color: Colors.white.withOpacity(0.08),
                        width: 1,
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.3),
                          blurRadius: 10,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
      child: Stack(
        children: [
          // Logo de la selección (esquina superior derecha)
          Positioned(
            top: 4,
            right: 7,
            child: Image.network(
              cromo_tienda["imagen_seleccion"],
              width: 25,   
              height: 25, 
              fit: BoxFit.contain,
            ),
          ),
          
          
          
          
          // Contenido principal (imagen del jugador y nombre)
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 20),
                
                // Imagen del jugador
                Container(
                  child: Image.asset(
                    "assets/jugadores/${cromo_tienda["imagenUrl"]}",  
                    width: 100,
                    height: 112,  
                    fit: BoxFit.contain,
                  ),
                ),
                
                const SizedBox(height: 10), // Espacio entre imagen y nombre
                
                // Nombre del jugador
                Text(
                  cromo_tienda["nombre"],
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 20, 
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                  maxLines: 2, 
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 10,),
                Container(
                  width: 100,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: const Color.fromARGB(255, 125, 103, 146),
                  ),
                  
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                   
                    child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                        ElevatedButton(onPressed: (){

                        }, child: Text("INTERCAMBIAR"))
                       
                    ],

                  ),
                  ),
                ),
                const SizedBox(height: 10,),
                
              ],
            ),
          ),
        ],
      ),
    );
  }
}