import 'dart:async';

import 'package:app_flutter_cromos_liga/mainScreen.dart';
import 'package:flutter/material.dart';
import 'apiService/apiConect.dart';
import 'home.dart';
import 'mainScreen.dart';
import 'login.dart';
import 'apiService/apiConect.dart';

class RegistroPage extends StatefulWidget {
  const RegistroPage({super.key});

  @override
  State<RegistroPage> createState() => _RegistroPage();
}

//class _CrearClienteMongoState extends State<CrearClienteMongo> {

class _RegistroPage extends State<RegistroPage>{

  final TextEditingController nombre_usuario = TextEditingController();
  final TextEditingController correo = TextEditingController();
  final TextEditingController password1 = TextEditingController();
  final TextEditingController password2 = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  
  bool loading = false;
  bool ocultar_password= true;
  bool ocultar_password2= true;
  @override
  void dispose() {
    nombre_usuario.dispose();
    correo.dispose();
    password1.dispose();
    password2.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final bool isDesktop = MediaQuery.of(context).size.width > 600;
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 13, 4, 17),
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            width: isDesktop ? 450 : double.infinity,
            margin: const EdgeInsets.symmetric(horizontal: 25),
            padding: const EdgeInsets.all(25),
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 0, 0, 0),
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
                    "Crea tu cuenta",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 5),

                  

                  const SizedBox(height: 30),

                  TextFormField(
                    controller: nombre_usuario,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "el nombre es obligatorio";
                        }
                        return null;
                      },
                    style: const TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      prefixIcon: const Icon(
                        Icons.person,
                        color: Color.fromARGB(185, 255, 255, 255),
                      ),
                      labelText: "Nombre de usuario",
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
                    controller: correo,
                    obscureText: true,
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
                        color: Color.fromARGB(255, 255, 255, 255),
                      ),
                      labelText: "Correo",
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


                  TextFormField(
                     controller: password1,
                      obscureText: ocultar_password,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "la contraseña es obligatoria";
                        }
                        return null;
                      },
                    style: const TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      suffixIcon: IconButton(
                        onPressed: (){
                          setState(() {
                            ocultar_password = !ocultar_password;
                          });
                        }, 
                        icon: Icon(
                          ocultar_password ? Icons.visibility_off : Icons.visibility,
                          color: Colors.white70,
                        ),
                      ),
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
                  
                  TextFormField(
                     controller: password2,
                      obscureText: ocultar_password2,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "repetir contraseña";
                        }
                        return null;
                      },
                    style: const TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      suffixIcon: IconButton(
                        onPressed: (){
                          setState(() {
                            ocultar_password2 = !ocultar_password2;
                          });
                        }, 
                        icon: Icon(
                          ocultar_password2 ? Icons.visibility_off : Icons.visibility,
                          color: Colors.white70,
                        ),
                      ),
                      prefixIcon: const Icon(
                        Icons.lock_outline,
                        color: Color.fromARGB(255, 255, 255, 255),
                      ),
                      labelText: "Repetir Contraseña",
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
                        "¿Yatienes cuenta?",
                        style: TextStyle(color: Colors.white70),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (_) => loginPage()),
                          );
                        },
                        
                        child: const Text(

                          "Iniciar Sesión",
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
                                

                                final res = await ApiConect.registerPost(
                                  nombre: nombre_usuario.text,
                                  correo: correo.text,
                                  password1:password1.text,
                                  password2:password2.text
                                );
                                print("asdasdasdddddddddddd");
                                print(res);
                               
                                if (res != null) {
                                  //print(res["message"]);

                                  if (res["success"] == true) {
                                    print(res["message"]);
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(builder: (context) => loginPage()),
                                    );
                                  } else {
                                    print(res["message"]);
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
