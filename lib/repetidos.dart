import 'package:flutter/material.dart';
import 'package:app_flutter_cromos_liga/apiService/apiConect.dart';
import '../usuarioData/usuarioDatos.dart';
import 'widget/carta_reptidos.dart';

class RepetidosViews extends StatefulWidget {
  const RepetidosViews({super.key});

  @override
  State<RepetidosViews> createState() => _RepetidosViews();
}

class _RepetidosViews extends State<RepetidosViews> {

  List cromos_user =[];

  bool cargando = true;
  
  @override
  void initState() {
    super.initState();
    cargarCromos();
  }
  cargarCromos() async{
    //peticion a la api
    final code_user = UserSession.code_user;
    //comprobar que no sea vacio o null por que si no lo pongo da error con el campo en el userdatos
    if (code_user == null || code_user.isEmpty) {
      
      cromos_user = [];
      return;
    }

    //peticion
    final respuesta = await ApiConect.ObtenerDatosUsuario(code_user);
    
    print("lista cromos usuario");
    print("respuesta de cromos usuario: $respuesta");
    
    //si fue bien se actualiza la lista
    if (respuesta['success'] == true) {
  
      //actualizar lista global
      cromos_user = respuesta['lista_cromos'];
      // Actualizar la sesión local

      UserSession.lista_cromos = cromos_user;
    } else {
      cromos_user = [];
    }
    cargando = false;
    setState(() {});
  }
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 22, 24, 35),
      appBar: AppBar(
        title: const Text("Repetidos", style: TextStyle(color: Colors.white)),
        backgroundColor: Color.fromARGB(255, 22, 24, 35),
        
      ),

      body: Center(
        child: cargando
            ? const CircularProgressIndicator()
            : SingleChildScrollView(
                child: Wrap(
                  spacing: 10,
                  runSpacing: 10,
                  alignment: WrapAlignment.center,
                  children: List.generate(cromos_user.length, (index) {
                    final cromo = cromos_user[index];
                    //pasarle todos los cromos de todos_player
                    return Container(
                      padding: const EdgeInsets.all(10),
                      // todos los players
                      child: CartasRepetidas(
                        cromo_repetidos: cromo,
                      ),
                    );
                  }),
                ),
              ),
      ),
      
    );
  }
}
