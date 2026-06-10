  import 'package:flutter/material.dart';
  import 'package:flutter/services.dart';
  import '../apiService/apiConect.dart';
  import '../usuarioData/usuarioDatos.dart';
  class CartasUserIntercambio extends StatelessWidget {
    final dynamic lista_cromos_usuario_intercambio;
    final dynamic carta_seleccionada;

    const CartasUserIntercambio({
      super.key,
      required this.lista_cromos_usuario_intercambio,

      required this.carta_seleccionada,
    });

    @override
    Widget build(BuildContext context) {
      String code_user = UserSession.code_user ?? "";

      final dynamic segundoEscogido={
        "nombre_jugador":lista_cromos_usuario_intercambio["nombre_jugador"],
        "imagen_player":lista_cromos_usuario_intercambio["imagen_player"],
        "logo_seleccion":lista_cromos_usuario_intercambio["logo_seleccion"],
      };

      //carta dusbloqueda;
      return Container(
        width: 160,
        height: 240,
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
        child: Stack(
          children: [
            // Logo de la selección (esquina superior derecha)
            Positioned(
              top: 4,
              right: 7,
              child: Image.network(
                lista_cromos_usuario_intercambio["logo_seleccion"],
                width: 25,
                height: 25,
                fit: BoxFit.contain,
              ),
            ),

            // Contenido principal (imagen del jugador y nombre)
            Center(
              child: Column(
                children: [
                  const SizedBox(height: 20),

                  // Imagen del jugador
                  Container(
                    child: Image.network(
                      lista_cromos_usuario_intercambio["imagen_player"],
                      width: 100,
                      height: 112,
                      fit: BoxFit.contain,
                    ),
                  ),

                  const SizedBox(height: 10), // Espacio entre imagen y nombre
                  // Nombre del jugador
                  Text(
                    lista_cromos_usuario_intercambio["nombre_jugador"],
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 15,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),

                  const SizedBox(height: 10),
                  
                  const Spacer(),
                  
                  Container(
                    
                    width: 100,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Colors.black,
                    ),
                    
                    child: SizedBox(
                            width: 50,
                            height: 32,
                            child: ElevatedButton(
                              
                              onPressed: () async{



                              showDialog(
                                context: context,
                                builder: (context) {
                                  return AlertDialog(
                                    title: Text("¿Estas seguro de realizar este intercambio?", style: TextStyle(
                                      fontSize: 13,
                                    ),),
                                    actions: [
                                      TextButton(
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                        child: Text("Cancelar"),
                                      ),

                                      const SizedBox(width: 10,),

                                      TextButton(
                                        onPressed: ()async {
                                          print("carta que seleccionaste 1");
                                          print(carta_seleccionada);
                                          print("segunda carta");
                                          print(segundoEscogido);
                                          
                                          print(code_user);

                                          final respuesta = await ApiConect.intercambioCartas(
                                            carta_seleccionada,
                                            segundoEscogido,
                                            code_user
                                          );

                                          if (respuesta["success"] == true) {
                                            print("isissisisiissisisi");
                                            print(respuesta["mensaje"]);
                                            Navigator.pop(context);
                                          }else{
                                            print("error");
                                          }
                                        },
                                        child: Text("Aceptar"),
                                      ),
                                    ],
                                  );
                                },
                              );
                                
                              },

                              style: ElevatedButton.styleFrom(
                                backgroundColor: const Color.fromARGB(
                                  255,
                                  125,
                                  103,
                                  146,
                                ),
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
                              child: const Text("Escoger x1"),
                            ),
                          ),
                  ),
                  const SizedBox(height: 10),
                ],
              ),
            ),
          ],
        ),
      );
    }
  }
