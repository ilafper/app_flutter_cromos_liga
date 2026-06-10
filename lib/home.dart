import 'package:flutter/material.dart';

import 'apiService/apiConect.dart';
import 'widget/carta_cromo.dart';
import '../usuarioData/usuarioDatos.dart';
// en el caso de trabajar con lista dinamcas se tiene que usar  StatefulWidgeten vez de
class Home extends StatefulWidget {
  const Home({super.key});
  
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List sobres = [];
  int index = 0;
  
  

  @override
  Widget build(BuildContext context) { 

   
    final bool isDesktop = MediaQuery.of(context).size.width > 800;
    
    
    print("ESTA DISTICAS ESTADISTICAS");
    print(UserSession.estadisticas);
    return Scaffold(
      
      backgroundColor: Color.fromARGB(255, 22, 24, 35),
      appBar: AppBar(
        title: const Text("Home", style: TextStyle(color: Colors.white)),
        backgroundColor: Color.fromARGB(255, 22, 24, 35),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(1),
          child: Container(
            height: 0.5,
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.15),
              boxShadow: [
                BoxShadow(
                  color: Colors.white.withOpacity(0.08),
                  blurRadius: 1,
                  spreadRadius: 0.2,
                ),
              ],
            ),
          ),
        ),
      ),
      body: Center(
        child: Container(
          constraints: BoxConstraints(
            maxWidth: isDesktop ? 800 : double.infinity,
          ),
          child: Column(
          
          children: [
            const SizedBox(height: 50),
            //si no hay cromos
            
            if (sobres.isNotEmpty)
              Stack(
                alignment: Alignment.center,

                children: [
                  for (int i = index + 1; i < sobres.length; i++)
                    Positioned(
                      bottom: 100.0 * (i - index),
                      child: Opacity(
                        opacity: 0.5,
                        child: CartaCromo(cromo: sobres[i]),
                      ),
                    ),

                  // detectar el dedo al clikcar y pasar ala siguiente
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        if (index < sobres.length - 1) {
                          index++;
                        }
                      });
                    },
                    child: CartaCromo(cromo: sobres[index]),
                  ),
                ],
              ),

            const SizedBox(height: 20),

            if (sobres.isEmpty)
              Column(
                children: [
                  Image.asset("assets/images/sobre.png"),
                  const SizedBox(height: 20),

                  SizedBox(
                    width: isDesktop ? 300 :200 ,
                    height: isDesktop ? 50: 50,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color.fromARGB(
                          255,
                          125,
                          103,
                          146,
                        ),


                        
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(vertical: 14),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(7),

                          side: BorderSide(color: Colors.white, width: 3),
                        ),
                        elevation: 5,
                      ),

                      onPressed: () async {
                        print("ABRIR SOBRE");
                        print("code_user: ${UserSession.code_user}");
                        final code_user = UserSession.code_user ?? "";

                        final data = await ApiConect.abrirSobres(code_user);
                         setState(() {
                           sobres = data;
                           index = 0;
                         });
                        print("sobres abiertos: $data");
                      },
                      child: const Text("ABRIR x1"),
                    ),
                  ),
                ],
              )
            // en el caso de se carguen los crmos mostrar los botnes de salir y volver abrir

            else if (sobres.isNotEmpty)
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: isDesktop ? 300 :180 ,
                    height: isDesktop ? 50: 50,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color.fromARGB(
                          255,
                          125,
                          103,
                          146,
                        ),
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(vertical: 14),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(7),

                          side: BorderSide(color: Colors.white, width: 3),
                        ),
                        elevation: 5,
                      ),

                      onPressed: () async {
                        setState(() {
                          sobres = [];
                          index = 0;
                        });
                      },

                      child: const Text("Salir"),
                    ),
                  ),

                  // boton salir
                  const SizedBox(width: 10),

                  SizedBox(
                    width: isDesktop ? 300 :180 ,
                    height: isDesktop ? 50: 50,
                    
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color.fromARGB(
                          255,
                          125,
                          103,
                          146,
                        ),
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(vertical: 14),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(7),

                          side: BorderSide(color: Colors.white, width: 3),
                        ),
                        elevation: 5,
                      ),

                      onPressed: () async {
                        final code_user = UserSession.code_user ?? "";
                        final data = await ApiConect.abrirSobres(code_user);

                        setState(() {
                          sobres = data;
                          index = 0;
                        });
                      },
                      child: const Text("Volver a abrir"),
                    ),
                  ),
                ],
              ),
          ],
        ),
        ),
        
      ),
    );
  }
}
