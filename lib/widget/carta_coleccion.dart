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
    // Detectar si es escritorio (ancho > 800px)
    final bool isDesktop = MediaQuery.of(context).size.width > 800;
    
    // ver si es escritoprio o movil
    return isDesktop ? cartaEscritorio() : cartaMovil();
  }

  // parte movil
  Widget cartaMovil() {
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
    
    //carta desbloqueda
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
              errorBuilder: (context, error, stackTrace) => 
                const Icon(Icons.error, size: 20, color: Colors.red),
            ),
          ),
          
          // Contenido principal
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 20),
                
                // Imagen del jugador
                Image.asset(
                  "assets/jugadores/${cromo_coleccion["imagenUrl"]}",  
                  width: 100,
                  height: 112,  
                  fit: BoxFit.contain,
                  errorBuilder: (context, error, stackTrace) => 
                    const Icon(Icons.person, size: 60, color: Colors.white54),
                ),
                
                const SizedBox(height: 10),
                
                // Nombre del jugador
                Text(
                  cromo_coleccion["nombre"] ?? "Sin nombre",
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

  //version escritorio
  Widget cartaEscritorio() {
    if (!desbloqueado) {
      return Container(
        width: 250,   
        height: 350, 
        decoration: BoxDecoration(
          color: Colors.grey[800],
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Colors.white24, width: 2),
        ),
        child: const Center(
          child: Icon(Icons.lock, color: Colors.white54, size: 50),
        ),
      );
    }
    
    // Carta desbloqueada escritorio
    return Container(
      width: 250,   
      height: 350,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/targeta_futbol_scale.png"), 
          fit: BoxFit.contain,
        ),
      ),
      child: Stack(
        children: [
          
          Positioned(
            top: 27,
            right: 10,
            child: Image.network(
              cromo_coleccion["imagen_seleccion"],
              width: 60,   
              height: 35, 
              fit: BoxFit.contain,
              errorBuilder: (context, error, stackTrace) => 
                const Icon(Icons.error, size: 25, color: Colors.red),
            ),
          ),
          
          // Contenido principal
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 30),
                
                //imagen jugador
                Image.asset(
                  "assets/jugadores/${cromo_coleccion["imagenUrl"]}",  
                  width: 140,
                  height: 190,  
                  fit: BoxFit.contain,
                  errorBuilder: (context, error, stackTrace) => 
                    const Icon(Icons.person, size: 80, color: Colors.white54),
                ),
                
                const SizedBox(height: 10),
                
                
                Text(
                  cromo_coleccion["nombre"],
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 16,  
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