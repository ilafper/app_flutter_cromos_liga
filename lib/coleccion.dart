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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Container(
                width: double.infinity,
                height: double.infinity,
                alignment: Alignment.center,
                decoration: const BoxDecoration(
                  color: Color.fromARGB(255, 22, 24, 35),
                ),
                child: cargando
                    ? const Center(child: CircularProgressIndicator())
                    : ListView.builder(
                        itemCount: todos_player.length,
                        itemBuilder: (context, index) {
                          return Text(todos_player[index]["jugador"]);
                        },
                      ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
