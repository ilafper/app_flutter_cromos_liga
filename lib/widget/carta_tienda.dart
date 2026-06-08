import 'package:flutter/material.dart';
import '../usuarioData/usuarioDatos.dart';
import 'package:app_flutter_cromos_liga/apiService/apiConect.dart';

import 'package:app_flutter_cromos_liga/widget/cromo_tuyo_intercambiar.dart';
class CartasTienda extends StatelessWidget {
  final dynamic cromo_tienda;
  final dynamic cromos_user;
  

  const CartasTienda({super.key, required this.cromo_tienda, required this.cromos_user});

  @override
  Widget build(BuildContext context) {
    
    
    bool cargando=true;
    final dynamic cromo_tienda_escogido= {
      "nombre":cromo_tienda["nombre"],
      "imagen_seleccion":cromo_tienda["imagen_seleccion"],
      "imagenUrl":cromo_tienda["imagenUrl"],
      "apellidos":cromo_tienda["apellidos"],

    };
    

    return Container(
      width: 160,
      height: 230,
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 26, 29, 42),
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: const Color.fromARGB(93, 255, 255, 255), width: 1),
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
            "assets/jugadores/${cromo_tienda["imagenUrl"]}",
            width: 90,
            height: 100,
            fit: BoxFit.contain,
            errorBuilder: (context, error, stackTrace) => 
              const Icon(Icons.person, size: 80, color: Colors.grey),
          ),

          const SizedBox(height: 8),

          // Nombre del jugador

          Text(
            cromo_tienda["nombre"],
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
              onPressed: () {
                print("intercambiar");
                print("cogiste");
                //print(cromo_tienda["nombre"]);
                print(cromo_tienda_escogido);
                showModalBottomSheet(
                context: context, 
                builder: (BuildContext context){
                  return Container(
                    color: const Color.fromARGB(255, 26, 29, 42),
                    width: 400,
                    height: 500,
                    child: Column(
                      children: [
                        const SizedBox(height: 10,),
                        Text("Escoge la carta a intercambiar", style: TextStyle(
                          color: Colors.white
                        ),),

                        const SizedBox(height: 5,),
                        Expanded(
                          child: SingleChildScrollView(
                          
                          child: Wrap(
                            spacing: 20,
                            runSpacing: 20,
                            alignment: WrapAlignment.center,
                            children: List.generate(cromos_user.length, (index) {
                              final lista_cromos = cromos_user[index];
                             
                              return CartasUserIntercambio(
                                lista_cromos_usuario_intercambio: lista_cromos, carta_seleccionada:cromo_tienda_escogido
                                
                                );
                            }),
                          ),
                        )
                        )

                        
                      ],
                    ),
                  );
                },
                );
              },
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