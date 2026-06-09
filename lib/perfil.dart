import 'package:app_flutter_cromos_liga/apiService/apiConect.dart';
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
  String sobres_abiertos = "0";
  String cartas_totales = "0";
  String cartas_repetidas = "0";
  
  @override
  void initState() {
    super.initState();
    cargarEstadisticas();
  }

  cargarEstadisticas() async {
    final code_user = UserSession.code_user;
  
    if (code_user == null || code_user.isEmpty) {
      return;
    }
    
    final respuesta = await ApiConect.ObtenerDatosUsuario(code_user);
    print(respuesta);
    if (respuesta["success"] == true) {
      sobres_abiertos = respuesta["estadisticas"]["sobres_abiertos"].toString();
      cartas_totales = respuesta["estadisticas"]["cartas_totales"].toString();
      cartas_repetidas = respuesta["estadisticas"]["cartas_repetidas"].toString();
      print(sobres_abiertos);
      print(cartas_repetidas);
      print(cartas_totales);
    } else {}

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final bool isDesktop = MediaQuery.of(context).size.width > 800;
    
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 22, 24, 35),
      appBar: AppBar(
        title: const Text("PERFIL", style: TextStyle(color: Colors.white)),
        backgroundColor: const Color.fromARGB(255, 22, 24, 35),
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
      body: isDesktop ? _buildDesktopLayout() : _buildMobileLayout(),
    );
  }

  // 🔹 DISEÑO MÓVIL (EXACTAMENTE IGUAL)
  Widget _buildMobileLayout() {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Center(
        child: Column(
          children: [
            const SizedBox(height: 10),
            Column(
              children: [
                // Imagen perfil + nombre + correo
                Column(
                  children: [
                    Container(
                      width: 100,
                      height: 100,
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 80, 97, 147),
                        shape: BoxShape.circle,
                        image: const DecorationImage(
                          image: AssetImage('assets/images/logo_perfil.png'),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
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
                // Sobres abiertos
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
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
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "SOBRES ABIERTOS",
                            style: TextStyle(
                              color: Colors.white70,
                              fontSize: 12,
                              letterSpacing: 1,
                            ),
                          ),
                          const SizedBox(height: 6),
                          Text(
                            sobres_abiertos,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 235, 142, 249).withOpacity(0.1),
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
                const SizedBox(height: 10),
                // Cartas obtenidas y repetidas
                Row(
                  children: [
                    Container(
                      width: 170,
                      padding: const EdgeInsets.symmetric(horizontal: 11, vertical: 14),
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
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
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
                          const SizedBox(height: 8),
                          Text(
                            "Cartas obtenidas",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                              letterSpacing: 1,
                            ),
                          ),
                          const SizedBox(height: 6),
                          Text(
                            cartas_totales,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 10),
                    Container(
                      width: 170,
                      padding: const EdgeInsets.symmetric(horizontal: 11, vertical: 14),
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
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
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
                          const SizedBox(height: 8),
                          Text(
                            "Cartas repetidas",
                            style: TextStyle(
                              color: Colors.white70,
                              fontSize: 12,
                              letterSpacing: 1,
                            ),
                          ),
                          const SizedBox(height: 6),
                          Text(
                            cartas_repetidas,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 10),
            SizedBox(
              width: 350,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 125, 103, 146),
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                    side: BorderSide(color: Colors.white.withOpacity(0.2)),
                  ),
                  elevation: 5,
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => loginPage()),
                  );
                },
                child: const Text("Cerrar Sesion"),
              ),
            )
          ],
        ),
      ),
    );
  }

   Widget _buildDesktopLayout() {
  return SingleChildScrollView(
    child: Center(
      child: Container(
        width: 1000, 
        height: 500,
        padding: const EdgeInsets.all(30),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // columna izquierda
            Expanded(
              flex: 3,
              child: Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 26, 29, 42),
                  borderRadius: BorderRadius.circular(16),
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
                    // Avatar más pequeño
                    Container(
                      width: 120,
                      height: 120,
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 80, 97, 147),
                        shape: BoxShape.circle,
                        image: const DecorationImage(
                          image: AssetImage('assets/images/logo_perfil.png'),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    Text(
                      "${UserSession.nombre}",
                      style: GoogleFonts.inter(
                        color: const Color.fromARGB(255, 184, 192, 203),
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      "CHUPI MEGA COLLECTOR • 2026",
                      style: GoogleFonts.inter(
                        color: const Color.fromARGB(255, 184, 192, 203),
                        fontSize: 11,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(Icons.email_outlined, size: 14, color: Colors.white54),
                        const SizedBox(width: 6),
                        Flexible(
                          child: Text(
                            "${UserSession.correo}",
                            style: GoogleFonts.inter(
                              color: const Color.fromARGB(255, 117, 117, 125),
                              fontSize: 12,
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    // Botón cerrar sesión
                    SizedBox(
                      width: 160,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color.fromARGB(255, 125, 103, 146),
                          foregroundColor: Colors.white,
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                            side: BorderSide(color: Colors.white.withOpacity(0.2)),
                          ),
                          elevation: 3,
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => loginPage()),
                          );
                        },
                        child: const Text("Cerrar Sesion", style: TextStyle(fontSize: 13)),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            
            const SizedBox(width: 20),
            
            // Columna derecha
            Expanded(
              
              flex: 6,
              child: Column(
                children: [
                  // Grid de estadísticas
                  SizedBox(
                    height: 300,
                    child: GridView.count(
                      crossAxisCount: 2,
                      childAspectRatio: 1.3,
                      crossAxisSpacing: 15,
                      mainAxisSpacing: 15,
                      children: [
                        // Sobres abiertos
                        Container(
                          padding: const EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 26, 29, 42),
                            borderRadius: BorderRadius.circular(16),
                            border: Border.all(color: Colors.white.withOpacity(0.08), width: 1),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.3),
                                blurRadius: 8,
                                offset: const Offset(0, 3),
                              ),
                            ],
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                padding: const EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                  color: const Color.fromARGB(255, 235, 142, 249).withOpacity(0.1),
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: const Icon(
                                  Icons.inbox,
                                  color: Color.fromARGB(255, 206, 171, 238),
                                  size: 35,
                                ),
                              ),
                              const SizedBox(height: 12),
                              Text(
                                sobres_abiertos,
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 32,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 6),
                              Text(
                                "SOBRES ABIERTOS",
                                style: TextStyle(
                                  color: Colors.white70,
                                  fontSize: 10,
                                  letterSpacing: 1,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                        ),
                        
                        // Cartas obtenidas
                        Container(
                          padding: const EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 26, 29, 42),
                            borderRadius: BorderRadius.circular(16),
                            border: Border.all(color: Colors.white.withOpacity(0.08), width: 1),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.3),
                                blurRadius: 8,
                                offset: const Offset(0, 3),
                              ),
                            ],
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                padding: const EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                  color: const Color.fromARGB(255, 240, 132, 9).withOpacity(0.1),
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: const Icon(
                                  Icons.grid_view,
                                  color: Color.fromARGB(255, 240, 132, 9),
                                  size: 35,
                                ),
                              ),
                              const SizedBox(height: 12),
                              Text(
                                cartas_totales,
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 32,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 6),
                              Text(
                                "CARTAS OBTENIDAS",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 10,
                                  letterSpacing: 1,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  
                  const SizedBox(height: 15),
                  
                  // Cartas repetidas
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 26, 29, 42),
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(color: Colors.white.withOpacity(0.08), width: 1),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.3),
                          blurRadius: 8,
                          offset: const Offset(0, 3),
                        ),
                      ],
                    ),

                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "CARTAS REPETIDAS",
                              style: TextStyle(
                                color: Colors.white70,
                                fontSize: 11,
                                letterSpacing: 1,
                              ),
                            ),
                            const SizedBox(height: 6),
                            Text(
                              cartas_repetidas,
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 32,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        Container(
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 228, 110, 110).withOpacity(0.1),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: const Icon(
                            Icons.repeat,
                            color: Color.fromARGB(255, 225, 101, 101),
                            size: 35,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
}