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
  List todos_player = [];
  List<String> cromosUsuario = [];
  bool cargando = true;
  
  @override
  void initState() {
    super.initState();
    print("cargar players vsista");
    cargar_todos_jugadores();
  }

  cargar_todos_jugadores() async {
    todos_player = await ApiConect.todosJugadores();
    print(todos_player);
    cargando = false;
    setState(() {});
  }

  bool estaDesbloqueado(dynamic todos_player) {
      // comprobar si la lista esta vacia o no hay lista
      if (UserSession.lista_cromos != null || UserSession.lista_cromos!.isEmpty) {
        return false;
      }
      // recorrerla lista y comparar
      for (var cada_cromo_usuario in UserSession.lista_cromos!) {
        if (cada_cromo_usuario["nombre"] == todos_player["nombre"]) {
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
        title: const Text('vista de todos los cromos'),
        backgroundColor: Colors.blueAccent,
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
