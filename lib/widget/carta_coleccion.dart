import 'package:flutter/material.dart';

class CromoColeccion extends StatelessWidget {
  final dynamic cromo_coleccion;
   final bool desbloqueado;
  
  const CromoColeccion({
    super.key, 
    required this.cromo_coleccion, 
    required this.desbloqueado
    });
 
  @override
  Widget build(BuildContext context) {
    if (!desbloqueado) {
      return Container(
        width: 150,
        height: 200,
        decoration: BoxDecoration(
          color: Colors.grey[800],
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: Colors.white24, width: 2),
        ),
        child: const Center(
          child: Icon(Icons.lock, color: Colors.white54, size: 40),
        ),
      );
    }
    
    //carta dusbloqueda;
    return Container(
      width: 150,  
      height: 200,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/targeta_futbol_scale.png"), 
          fit: BoxFit.contain,
        ),
      ),
      child: Stack(
        children: [
          // Logo de la selección (esquina superior derecha)
          Positioned(
            top: 4,
            right: 7,
            child: Image.network(
              cromo_coleccion["imagen_seleccion"],
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
                    "assets/jugadores/${cromo_coleccion["imagenUrl"]}",  
                    width: 100,
                    height: 112,  
                    fit: BoxFit.contain,
                  ),
                ),
                
                const SizedBox(height: 10), // Espacio entre imagen y nombre
                
                // Nombre del jugador
                Text(
                  cromo_coleccion["nombre"],
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 14, 
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                  maxLines: 2, 
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}