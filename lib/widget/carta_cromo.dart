import 'package:flutter/material.dart';

class CartaCromo extends StatelessWidget {
  final dynamic cromo;
  const CartaCromo({super.key, required this.cromo});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      height: 400,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/targeta_futbol.png"),
          fit: BoxFit.cover,
        ),
      ),
      child: Stack(
        children: [
          Positioned(
            top: 12,
            right: 21,
            child: Image.network(
              cromo["logo_seleccion"],
              width: 60,
              height: 40,
            ),
          ),

          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 15),
                
                Container(
                  //color: Colors.red,

                  child: Image.network(
                  cromo["imagen_player"],
                  width: 200,
                  height: 275,
                ),
                ),
                Text(
                  cromo["jugador"],
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
