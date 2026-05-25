import 'package:flutter/material.dart';
import 'apiService/apiConect.dart';
import 'home.dart';

class loginPage extends StatelessWidget {
  loginPage({super.key});

  final TextEditingController correo = TextEditingController();
  final TextEditingController password = TextEditingController();

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
                  controller: correo,
                  decoration: const InputDecoration(
                    labelText: "Correo",
                    border: OutlineInputBorder(),
                  ),
                ),

                const SizedBox(height: 10),

                TextField(
                  controller: password,
                  obscureText: true,
                  decoration: const InputDecoration(
                    labelText: "Contraseña",
                    border: OutlineInputBorder(),
                  ),
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
                               
                                final res = await ApiConect.loginApp(
                                  
                                  correo: correo.text,
                                  password: password.text
                                );

                                

                                if (res != null) {
                                  //print(res["message"]);

                                  if (res["success"] == true) {
                                    print(res["message"]);
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(builder: (context) => const Home()),
                                    );
                                  } else {

                                    print("NOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOO");
                                  }
                                }
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