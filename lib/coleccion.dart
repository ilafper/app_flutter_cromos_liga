import 'package:app_flutter_cromos_liga/apiService/apiConect.dart';
import 'package:flutter/material.dart';
import 'widget/carta_coleccion.dart';

class ColecctionView extends StatefulWidget {
  const ColecctionView({super.key});

  @override
  State<ColecctionView> createState() => _ColecctionView();
}

class _ColecctionView extends State<ColecctionView> {
  List todos_player = [];

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
    cargando= false;
    setState(() {});
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            children: List.generate(
              todos_player.length,
              (index) {
                return Container(
                  padding: const EdgeInsets.all(10),
                  //CartaCromo(cromo: sobres[i])
                  child: CromoColeccion(cromo_coleccion:todos_player[index])
                );
              },
            ),
          ),
        ),
),
    );
  }
}
