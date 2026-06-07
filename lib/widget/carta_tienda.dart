import 'package:flutter/material.dart';

class CartasTienda extends StatelessWidget {
  final dynamic cromo_tienda;

  const CartasTienda({super.key, required this.cromo_tienda});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 160,
      height: 230,
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 26, 29, 42),
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: Colors.white.withOpacity(0.08), width: 1),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.3),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Logo (esquina superior derecha usando Align)
          Align(
            alignment: Alignment.topRight,
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: Image.network(
                cromo_tienda["imagen_seleccion"],
                width: 25,
                height: 25,
                fit: BoxFit.contain,
              ),
            ),
          ),

          // Imagen del jugador
          Image.asset(
            "assets/jugadores/${cromo_tienda["imagenUrl"] ?? ""}",
            width: 90,
            height: 100,
            fit: BoxFit.contain,
            errorBuilder: (context, error, stackTrace) => 
              const Icon(Icons.person, size: 80, color: Colors.grey),
          ),

          const SizedBox(height: 8),

          // Nombre del jugador
          Text(
            cromo_tienda["nombre"] ?? "Desconocido",
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 14,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),

          const SizedBox(height: 12),

          // boton
          SizedBox(
            width: 100,
            height: 32,
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 125, 103, 146),
                foregroundColor: Colors.white,
                padding: EdgeInsets.zero,
                textStyle: const TextStyle(
                  fontSize: 11,
                  fontWeight: FontWeight.bold,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(6),
                ),
              ),
              child: const Text("Intercambiar"),
            ),
          ),

          const SizedBox(height: 15),
        ],
      ),
    );
  }
}