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
    // Detectar si es escritorio (ancho > 800px)
    final bool isDesktop = MediaQuery.of(context).size.width > 800;
    
    // ver si es escritoprio o movil
    return isDesktop ? cartaTiendaEscritorio(context) : cartaTiendaMovil(context);
  }
  

  Widget cartaTiendaMovil(BuildContext context) {
    
    
    bool cargando=true;
    final dynamic cromo_tienda_escogido= {
      "nombre":cromo_tienda["nombre_jugador"],
      "imagen_seleccion":cromo_tienda["logo_seleccion"],
      "imagenUrl":cromo_tienda["imagen_player"],


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
                cromo_tienda["logo_seleccion"],
                width: 25,
                height: 25,
                fit: BoxFit.contain,
              ),
            ),
          ),

          // Imagen del jugador
          Image.network(
            cromo_tienda["imagen_player"],
            width: 90,
            height: 100,
            fit: BoxFit.contain,
            errorBuilder: (context, error, stackTrace) => 
              const Icon(Icons.person, size: 80, color: Colors.grey),
          ),

          const SizedBox(height: 8),

          // Nombre del jugador

          Text(
            cromo_tienda["nombre_jugador"],
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

  //parte escrtorio
  
   Widget cartaTiendaEscritorio(BuildContext context) {
    final dynamic cromo_tienda_escogido = {
      "nombre_jugador": cromo_tienda["nombre_jugador"],
      "logo_seleccion": cromo_tienda["logo_seleccion"],
      "imagen_player": cromo_tienda["imagen_player"],
      
    };

    return Container(
      width: 260,
      height: 380,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            const Color.fromARGB(255, 26, 29, 42),
            const Color.fromARGB(255, 35, 38, 55),
          ],
        ),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: const Color.fromARGB(255, 125, 103, 146).withOpacity(0.5),
          width: 1.5,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.4),
            blurRadius: 15,
            offset: const Offset(0, 8),
          ),
          BoxShadow(
            color: const Color.fromARGB(255, 125, 103, 146).withOpacity(0.2),
            blurRadius: 20,
            offset: const Offset(0, 0),
          ),
        ],
      ),

      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Cabecera con logo
          Padding(
            padding: const EdgeInsets.only(top: 12, right: 12),
            child: Align(
              alignment: Alignment.topRight,
              child: Container(
                
                child: Image.network(
                  cromo_tienda["logo_seleccion"],
                  width: 70,
                  height: 45,
                  fit: BoxFit.contain,
                  errorBuilder: (context, error, stackTrace) =>
                      const Icon(Icons.sports_soccer, size: 35, color: Colors.white70),
                ),
              ),
            ),
          ),

          // Imagen del jugador
          Expanded(
            child: Center(
              child: Container(
                padding: const EdgeInsets.all(12),
                child: Image.network(
                  cromo_tienda_escogido["imagen_player"],
                  width: 140,
                  height: 160,
                  fit: BoxFit.contain,
                  errorBuilder: (context, error, stackTrace) =>
                      const Icon(Icons.person, size: 100, color: Colors.grey),
                ),
              ),
            ),
          ),

          // Nombre del jugador
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Text(
              cromo_tienda["nombre_jugador"],
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 18,
                color: Colors.white,
                fontWeight: FontWeight.bold,
                letterSpacing: 0.5,
              ),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ),

          const SizedBox(height: 8),

          const SizedBox(height: 12),

          // Botón de intercambiar
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
            child: SizedBox(
              width: double.infinity,
              height: 42,
              child: ElevatedButton(
                onPressed: () {

                  modalIntercambioEscritorio(context, cromo_tienda_escogido);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 125, 103, 146),
                  foregroundColor: Colors.white,
                  elevation: 4,
                  shadowColor: const Color.fromARGB(255, 125, 103, 146).withOpacity(0.5),
                  textStyle: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: const Text("Intercambiar"),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void modalIntercambioEscritorio(BuildContext context, dynamic cromoSeleccionado) {
    final bool isDesktop = MediaQuery.of(context).size.width > 800;
    
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (BuildContext context) {
        return Container(
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 26, 29, 42),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(isDesktop ? 25 : 20),
              topRight: Radius.circular(isDesktop ? 25 : 20),
            ),
          ),
          width: isDesktop ? 600 : double.infinity,
          height: isDesktop ? 550 : 500,
          child: Column(
            children: [
              const SizedBox(height: 15),
              // Indicador (solo móvil)
              if (!isDesktop)
                Container(
                  width: 40,
                  height: 4,
                  decoration: BoxDecoration(
                    color: Colors.white30,
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
              const SizedBox(height: 15),
              Text(
                "Escoge la carta a intercambiar",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: isDesktop ? 18 : 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 5),
              Text(
                "Selecciona una de tus cartas repetidas",
                style: TextStyle(
                  color: Colors.white54,
                  fontSize: isDesktop ? 12 : 11,
                ),
              ),
              const SizedBox(height: 15),
              Expanded(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.all(16),
                  child: Wrap(
                    spacing: isDesktop ? 25 : 20,
                    runSpacing: isDesktop ? 25 : 20,
                    alignment: WrapAlignment.center,
                    children: List.generate(cromos_user.length, (index) {
                      final lista_cromos = cromos_user[index];
                      return CartasUserIntercambio(
                        lista_cromos_usuario_intercambio: lista_cromos,
                        carta_seleccionada: cromoSeleccionado,
                      );
                    }),
                  ),
                ),
              ),
              const SizedBox(height: 20),
            ],
          ),
        );
      },
    );
  }

}