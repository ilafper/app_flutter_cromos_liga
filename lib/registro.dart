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
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Center(
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextFormField(
                      controller: nombre_usuario,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "el nombre es obligatorio";
                        }
                        return null;
                      },
                      style: TextStyle(color: Colors.black),
                      decoration: InputDecoration(
                        labelText: "Nombre usuario",
                        labelStyle: TextStyle(
                          color: const Color.fromARGB(255, 8, 8, 8),
                        ),
                        
                        border: OutlineInputBorder(),
                        enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                            color: Color.fromARGB(255, 248, 214, 23),
                          ),
                        ),

                        floatingLabelStyle: TextStyle(
                          color: Color.fromARGB(
                            255,
                            248,
                            214,
                            23,
                          ), // color cuando tiene focus
                        ),

                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color.fromARGB(255, 248, 214, 23),
                          ),
                        ),
                      ),
                    ),

                const SizedBox(height: 10),

                TextFormField(
                      controller: correo,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "el correo es obligatorio";
                        }
                        return null;
                      },
                      style: TextStyle(color: Colors.black),
                      decoration: InputDecoration(
                        labelText: "Correo",
                        labelStyle: TextStyle(
                          color: const Color.fromARGB(255, 0, 0, 0),
                        ),
                        
                        border: OutlineInputBorder(),
                        enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                            color: Color.fromARGB(255, 248, 214, 23),
                          ),
                        ),

                        floatingLabelStyle: TextStyle(
                          color: Color.fromARGB(
                            255,
                            248,
                            214,
                            23,
                          ), // color cuando tiene focus
                        ),

                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color.fromARGB(255, 248, 214, 23),
                          ),
                        ),
                      ),
                    ),

                const SizedBox(height: 10),

                TextFormField(
                      controller: password1,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "la contraseña1 es obligatoria";
                        }
                        return null;
                      },
                      style: TextStyle(color: Colors.black),
                      decoration: InputDecoration(
                        labelText: "contraseña",
                        labelStyle: TextStyle(
                          color: const Color.fromARGB(255, 0, 0, 0),
                        ),
                        
                        border: OutlineInputBorder(),
                        enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                            color: Color.fromARGB(255, 248, 214, 23),
                          ),
                        ),

                        floatingLabelStyle: TextStyle(
                          color: Color.fromARGB(
                            255,
                            248,
                            214,
                            23,
                          ), // color cuando tiene focus
                        ),

                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color.fromARGB(255, 248, 214, 23),
                          ),
                        ),
                      ),
                    ),
                const SizedBox(height: 10),
                TextFormField(
                      controller: password2,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "repetir contraseña";
                        }
                        return null;
                      },
                      style: TextStyle(color: Colors.black),
                      decoration: InputDecoration(
                        labelText: "Repetir contraseña",
                        labelStyle: TextStyle(
                          color: const Color.fromARGB(255, 0, 0, 0),
                        ),
                        
                        border: OutlineInputBorder(),
                        enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                            color: Color.fromARGB(255, 248, 214, 23),
                          ),
                        ),

                        floatingLabelStyle: TextStyle(
                          color: Color.fromARGB(
                            255,
                            248,
                            214,
                            23,
                          ), // color cuando tiene focus
                        ),

                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color.fromARGB(255, 248, 214, 23),
                          ),
                        ),
                      ),
                    ),

                const SizedBox(height: 10),

                Row(
                  children: [
                    Text("¿Ya tienes cuenta?"),

                    const SizedBox(width: 5),

                    TextButton(
                      style: TextButton.styleFrom(
                        padding: EdgeInsets
                            .zero, // Elimina el padding por defecto si lo deseas
                        minimumSize: Size.zero,
                        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => loginPage()),
                        );
                      },
                      child: const Text("Inicia Sesión"),
                    ),
                  ],
                ),

                const SizedBox(height: 10),

                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                        iconColor: Colors.black,
                        backgroundColor: Color.fromARGB(255, 212, 182, 13),
                        foregroundColor: const Color.fromARGB(255, 0, 0, 0),
                        
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
                  child: const Text('Registrarse')),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
