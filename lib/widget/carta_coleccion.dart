import 'package:flutter/material.dart';

//
class CromoColeccion extends StatelessWidget {
  final dynamic cromo_coleccion;
  
  const CromoColeccion({super.key, required this.cromo_coleccion});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 250,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/targeta_futbol.png"),
          fit: BoxFit.cover,
        ),
      ),
      // child: Stack(
      //   children: [
      //     Positioned(
      //       top: 12,
      //       right: 21,
      //       child: Image.network(
      //         cromo["logo_seleccion"],
      //         width: 60,
      //         height: 40,
      //       ),
      //     ),

      //     Center(
      //       child: Column(
      //         mainAxisAlignment: MainAxisAlignment.center,
      //         children: [
      //           const SizedBox(height: 15),
                
      //           Container(
      //             //color: Colors.red,

      //             child: Image.network(
      //             cromo["imagen_player"],
      //             width: 200,
      //             height: 275,
      //           ),
      //           ),
      //           Text(
      //             cromo["jugador"],
      //             textAlign: TextAlign.center,
      //             style: const TextStyle(
      //               fontSize: 20,
      //               color: Colors.white,
      //               fontWeight: FontWeight.bold,
      //             ),
      //           ),
      //         ],
      //       ),
      //     ),
      //   ],
      // ),
    );
  }
}
