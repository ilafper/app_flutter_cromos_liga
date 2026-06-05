import 'package:app_flutter_cromos_liga/login.dart';
import 'package:flutter/material.dart';
import '../usuarioData/usuarioDatos.dart';
import 'package:google_fonts/google_fonts.dart';

class PerfilView extends StatefulWidget {
  const PerfilView({super.key});

  @override
  State<PerfilView> createState() => _PerfilView();
}

class _PerfilView extends State<PerfilView> {
  @override
  Widget build(BuildContext context) {
    // 3. Estructura visual de la vista
    print("PAPAAPAPAPAPAPAAPAPAPAPAPASDASD ${UserSession.nombre}");
    print("PAPAAPAPAPAPAPAAPAPAPAPAPASDASD ${UserSession.lista_cromos}");

    return Scaffold(
      backgroundColor: Color.fromARGB(255, 22, 24, 35),
      appBar: AppBar(
        title: const Text("PERFIL", style: TextStyle(color: Colors.white)),
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

      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Center(
          child: Column(
            children: [
              const SizedBox(height: 10),

              Column(
                children: [
                  //imagen perfil + nombre + correo
                  Column(
                    children: [
                      Container(
                        width: 100,
                        height: 100,

                        decoration: BoxDecoration(
                          color: Color.fromARGB(255, 80, 97, 147),
                          shape: BoxShape.circle,
                          image: DecorationImage(
                            image: AssetImage('assets/images/logo_perfil.png'),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),

                      //datos
                      Text(
                        "${UserSession.nombre}",
                        style: GoogleFonts.inter(
                          color: const Color.fromARGB(255, 184, 192, 203),
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      Text(
                        "CHUPI MEGA COLLECTOR • 2026",
                        style: GoogleFonts.inter(
                          color: const Color.fromARGB(255, 184, 192, 203),
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        "${UserSession.correo}",
                        style: GoogleFonts.inter(
                          color: const Color.fromARGB(255, 117, 117, 125),
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 20),

                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 14,
                    ),
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
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // TEXTO IZQUIERDA
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text(
                              "SOBRES ABIERTOS",
                              style: TextStyle(
                                color: Colors.white70,
                                fontSize: 12,
                                letterSpacing: 1,
                              ),
                            ),
                            SizedBox(height: 6),
                            Text(
                              "123,123",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),

                        // ICONO DERECHA
                        Container(
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: const Color.fromARGB(
                              255,
                              235,
                              142,
                              249,
                            ).withOpacity(0.1),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: const Icon(
                            Icons.inbox,
                            color: Color.fromARGB(255, 206, 171, 238),
                            size: 28,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 10,),
                  // cartas obtenidas y repetidas
                  
                  Row(
                    children: [
                      //cosa1 

                      Container(
                    width: 170,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 11,
                      vertical: 14,
                    ),
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
                    child: Row(
                      
                      children: [
                       
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            //icono
                            Container(
                              padding: const EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                color: const Color.fromARGB(255, 240, 132, 9).withOpacity(0.1),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: const Icon(
                                Icons.grid_view,
                                color: Color.fromARGB(255, 240, 132, 9),
                                size: 28,
                              ),
                            ),

                            Text(
                              "Cartas obtenidas",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                                letterSpacing: 1,
                              ),
                            ),
                            SizedBox(height: 6),
                            Text(
                              "1111",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),

                    //contenedor 2
                    const SizedBox(width: 10,),
                    Container(
                    width: 170,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 11,
                      vertical: 14,
                    ),
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
                    child: Row(
                      
                      children: [
                       
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            //icono
                            Container(
                              padding: const EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                color: const Color.fromARGB(255, 228, 110, 110).withOpacity(0.1),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: const Icon(
                                Icons.repeat,
                                color: Color.fromARGB(255, 225, 101, 101),
                                size: 28,
                              ),
                            ),

                            Text(
                              "Cartas repetidas",
                              style: TextStyle(
                                color: Colors.white70,
                                fontSize: 12,
                                letterSpacing: 1,
                              ),
                            ),
                            SizedBox(height: 6),
                            Text(
                              "0",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                    ],
                  ),
                  
                ],
              ),

              // total sobre
              const SizedBox(height: 10,),
              
              SizedBox(
                width: 350,
                child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 125, 103, 146),
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
            
                    side: BorderSide(
                      color: Colors.white.withOpacity(0.2),
                    ),
                  ),
                  elevation: 5,
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => loginPage()),
                  );
                },
                child: Text("Cerrar Sesion"),
              ),
              )
              
            ],
          ),
        ),
      ),
    );
  }
}
