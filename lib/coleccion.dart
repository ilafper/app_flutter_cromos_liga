import 'package:app_flutter_cromos_liga/apiService/apiConect.dart';
import 'package:flutter/material.dart';
import 'widget/carta_coleccion.dart';
import '../usuarioData/usuarioDatos.dart';

class ColecctionView extends StatefulWidget {
  const ColecctionView({super.key});

  @override
  State<ColecctionView> createState() => _ColecctionView();
}

class _ColecctionView extends State<ColecctionView> {
  //lista de todos los jugadores que hay
  List todos_player = [];
  //lista de cromos del usuario
  List cromosUsuario = [];
  bool cargando = true;
  
  @override
  void initState() {
    super.initState();
    cargarDatos();
  }


  Future<void> cargarDatos() async {
    //cargar empezar
    setState(() {
      cargando = true;
    });
    // cargar todos los jugadores y los cromos del usuario
    await cargar_todos_jugadores();
    await cargar_cromos_usuario();

    setState(() {
      cargando = false;
    });
  }
  

  


  cargar_todos_jugadores() async {
    //peticion a la api
    todos_player = await ApiConect.todosJugadores();
    cargando=false;
    //actualizar interfaz con set state
    setState(() {});
  }
  

  cargar_cromos_usuario() async {
    //peticion a la api
    final code_user = UserSession.code_user;
    //comprobar que no sea vacio o null por que si no lo pongo da error con el campo en el userdatos
    if (code_user == null || code_user.isEmpty) {
      
      cromosUsuario = [];
      return;
    }

    //peticion
    final respuesta = await ApiConect.ObtenerDatosUsuario(code_user);
    
    print("lista cromos usuario");
    print("respuesta de cromos usuario: $respuesta");
    
    //si fue existosa se actualiza la lista
    if (respuesta['success'] == true) {
      //actualizar lista global
      cromosUsuario = respuesta['lista_cromos'];
      // Actualizar la sesión local
      UserSession.lista_cromos = cromosUsuario;
    } else {
      cromosUsuario = [];
    }
    cargando = false;
    setState(() {});
  }

  
  bool estaDesbloqueado(dynamic cromoActual) {
    // Si no hay cromos todo bloqueado
    if (cromosUsuario.isEmpty) {
      return false;
    }
    
    // Buscar si el cromo actual esta en la lista del usuario
    for (var cada_cromo_usuario in cromosUsuario) {
      if (cada_cromo_usuario["nombre_jugador"] == cromoActual["nombre_jugador"]) {
        return true;
      }
    }
    
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 22, 24, 35),
      appBar: AppBar(
        title: const Text('Coleccion', style: TextStyle(color: Colors.white),),
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
        child: cargando
            ? const CircularProgressIndicator()
            : SingleChildScrollView(
                child: Wrap(
                  spacing: 10,
                  runSpacing: 10,
                  alignment: WrapAlignment.center,
                  children: List.generate(todos_player.length, (index) {
                    final cromo = todos_player[index];
                    //pasarle todos los cromos de todos_player
                    final desbloqueado = estaDesbloqueado(cromo);
                    return Container(
                      padding: const EdgeInsets.all(10),
                      // todos los players
                      child: CromoColeccion(
                        cromo_coleccion: cromo,
                        desbloqueado: desbloqueado,
                      ),
                    );
                  }),
                ),
              ),
      ),
    );
  }
}
