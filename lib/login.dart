import 'package:app_flutter_cromos_liga/mainScreen.dart';
import 'package:flutter/material.dart';
import 'apiService/apiConect.dart';
import 'home.dart';
import 'mainScreen.dart';

import 'registro.dart';

class loginPage extends StatelessWidget {
  loginPage({super.key});

  final TextEditingController correo = TextEditingController();
  final TextEditingController password = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  bool loading = false;
  bool ocultar_password= true;
  @override
  Widget build(BuildContext context) {

    // para tamanh de escritorio
    final bool isDesktop = MediaQuery.of(context).size.width > 600;
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 13, 4, 17),
      //contenido centrado
      
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            width: isDesktop ? 450 : double.infinity,
            margin: const EdgeInsets.symmetric(horizontal: 25),
            padding: const EdgeInsets.all(25),
            decoration: BoxDecoration(
              color: const Color.fromRGBO(0, 0, 0, 1),
              borderRadius: BorderRadius.circular(25),

              border: Border.all(color: Colors.white, width: 1),
            ),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    padding: const EdgeInsets.all(18),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: const Color.fromARGB(255, 124, 58, 237).withOpacity(0.15),
                    ),
                    child: const Icon(
                       Icons.person_outline,
                      size: 55,
                      color: Colors.white,
                    ),
                  ),

                  const SizedBox(height: 20),

                  const Text(
                    "Bienvenido",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 5),

                  Text(
                    "Inicia sesión para continuar",
                    style: TextStyle(color: Colors.grey.shade400, fontSize: 14),
                  ),

                  const SizedBox(height: 30),

                  TextFormField(
                    controller: correo,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Introduce tu correo";
                      }
                      return null;
                    },
                    style: const TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      prefixIcon: const Icon(
                        Icons.email_outlined,
                        color: Color.fromARGB(185, 255, 255, 255),
                      ),
                      labelText: "Correo",
                      labelStyle: const TextStyle(color: Color.fromARGB(218, 255, 255, 255)),
                      filled: true,
                      fillColor: Colors.white.withOpacity(0.05),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(18),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(18),
                        borderSide: const BorderSide(color: Color.fromARGB(255, 255, 255, 255)),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(18),
                        borderSide: const BorderSide(
                          color: Color.fromARGB(255, 124, 58, 237 ),
                          width: 2,
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 15),

                  TextFormField(
                    controller: password,
                    //ocultar_password:true,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Introduce tu contraseña";
                      }
                      return null;
                    },
                    style: const TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      prefixIcon: const Icon(
                        Icons.lock_outline,
                        color: Color.fromARGB(255, 255, 255, 255),
                      ),
                      labelText: "Contraseña",
                      labelStyle: const TextStyle(color: Colors.white70),
                      filled: true,
                      fillColor: Colors.white.withOpacity(0.05),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(18),
                      ),
                      
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(18),
                        borderSide: const BorderSide(color: Color.fromARGB(255, 255, 255, 255)),
                      ),
                      
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(18),
                        borderSide: const BorderSide(
                          color: Color.fromARGB(255, 124, 58, 237 ),
                          width: 2,
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 15),

                  Row(
                    //centrar horizontalmente
                    mainAxisAlignment: MainAxisAlignment.center,
                    //contenido dentro del
                    children: [
                      const Text(
                        "¿No tienes cuenta?",
                        style: TextStyle(color: Colors.white70),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (_) => RegistroPage()),
                          );
                        },
                        child: const Text(
                          "Regístrate",
                          style: TextStyle(
                            color: Color.fromARGB(255, 124, 58, 237),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 10),

                  SizedBox(
                    width: double.infinity,
                    height: 55,
                    
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color.fromARGB(255, 124, 58, 237),
                        foregroundColor: Colors.white,
                        elevation: 8,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18),
                        ),
                      ),
                      onPressed: loading
                          ? null
                          : () async {
                              if (_formKey.currentState!.validate()) {
                               
                                final res = await ApiConect.loginApp(
                                  
                                  correo: correo.text,
                                  password: password.text
                                );

                                if (res != null) {
                                  //print(res["message"]);

                                  if (res["success"] == true) {
                                    print(res["message"]);
                                    
                                  Navigator.pushReplacement(
                                  context,

                                  MaterialPageRoute(
                                    builder: (context) => Mainscreen(),
                                  ),
                                );
                                  } else {

                                    print("NOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOO");
                                  }
                                }
                              }
                            },

                      child: const Text(
                        "Iniciar Sesión",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
