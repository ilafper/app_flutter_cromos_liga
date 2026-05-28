import 'package:app_flutter_cromos_liga/mainScreen.dart';
import 'package:flutter/material.dart';
import 'apiService/apiConect.dart';
import 'home.dart';
import 'mainScreen.dart';
import 'login.dart';
class RegistroPage extends StatelessWidget {
  RegistroPage({super.key});

  final TextEditingController nombre_usuario = TextEditingController();
   final TextEditingController correo = TextEditingController();
  final TextEditingController password1 = TextEditingController();
  final TextEditingController password2 = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  bool loading = false;

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
                TextField(
                  controller: nombre_usuario,
                  decoration: const InputDecoration(
                    labelText: "Nombre de usuario",
                    border: OutlineInputBorder(),
                  ),
                ),

                const SizedBox(height: 10),   

                TextField(
                  controller: correo,
                  decoration: const InputDecoration(
                    labelText: "Correo",
                    border: OutlineInputBorder(),
                  ),
                ),

                const SizedBox(height: 10),

                TextField(
                  controller: password1,
                  obscureText: true,
                  decoration: const InputDecoration(
                    labelText: "Contraseña",
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 10),
                TextField(
                  controller: password2,
                  obscureText: true,
                  decoration: const InputDecoration(
                    labelText: "Repetir contraseña",
                    border: OutlineInputBorder(),
                  ),
                ),

                const SizedBox(height: 10),

                Row(
                  children: [
                    Text("¿Ya tienes cuenta?"),
                    
                    const SizedBox(width: 5),
                    
                    TextButton(
                      style:  TextButton.styleFrom(
                        padding: EdgeInsets.zero, // Elimina el padding por defecto si lo deseas
                        minimumSize: Size.zero,
                        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      ),
                    onPressed: () {
                      
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => loginPage(),
                        ),
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
                               
                                // final res = await ApiConect.loginApp(
                                  
                                //   correo: correo.text,
                                //   password: password.text
                                // );

                                

                                // if (res != null) {
                                //   //print(res["message"]);

                                //   if (res["success"] == true) {
                                //     print(res["message"]);
                                //   Navigator.pushReplacement(
                                //   context,

                                //   MaterialPageRoute(
                                //     builder: (context) => Mainscreen(),
                                //   ),
                                // );
                                //   } else {

                                //     print("NOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOO");
                                //   }
                                // }
                              }
                            },

                      child: loading
                          ? SizedBox(
                              height: 10,
                              width: 10,
                              child: CircularProgressIndicator(
                                strokeWidth: 2,
                                color: const Color.fromARGB(255, 17, 8, 8),
                              ),

                            )
                          : Text("Iniciar Sesion"),
                          
                    ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}