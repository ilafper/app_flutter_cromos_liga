import 'package:flutter/material.dart';

import 'apiService/apiConect.dart';

// en el caso de trabajar con lista dinamcas se tiene que usar  StatefulWidgeten vez de
class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List sobres = [];
  int index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
      ),
      body: Center(
        child: Column(
          
          children: [
            const SizedBox(height: 50),
            //si no hay cromos
            if (sobres.isNotEmpty)
              Stack(
                alignment: Alignment.center,

                children: [
                  // CARTAS DEBAJO (efecto pila)
                  for (int i = index + 1; i < sobres.length; i++)
                    
                    Positioned(
                      bottom: 10.0 * (i - index),
                      child: Opacity(opacity: 0.5, child: _card(sobres[i])),
                    ),

                 
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        if (index < sobres.length - 1) {
                          index++;
                        }
                      });
                    },
                    child: _card(sobres[index]),
                  ),
                ],
              ),


            const SizedBox(height: 20),
            
            if (sobres.isEmpty)
              Column(
                children: [

                  Image.asset("assets/images/sobre.png"),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () async {
                      final data = await ApiConect.abrirSobres();

                      setState(() {
                        sobres = data;
                        index = 0;
                      });
                    },
                    child: const Text("ABRIR x1"),
                  ),
                ],
              )
              
              
              else if(sobres.isNotEmpty)
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                    // boton salir

                    ElevatedButton(
                  onPressed: () async {
                    

                    setState(() {
                      
                       setState(() {
                        sobres = [];
                        index = 0;
                      });
                    });
                  },

                  child: const Text("Salir"),
                  ),

                  const SizedBox(width: 10),
                  ElevatedButton(
                  onPressed: () async {
                    final data = await ApiConect.abrirSobres();

                    setState(() {
                      sobres = data;
                      index = 0;
                    });
                  },
                  child: const Text("Volver a abrir"),
                  )
                ],
              )
            

          ],
        ),
      ),
    );
  }






  Widget _card(dynamic cromo) {
    return Container(
      width: 200,
      height: 300,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [BoxShadow(blurRadius: 10, color: Colors.black26)],
      ),

      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(cromo["nombre"], style: const TextStyle(fontSize: 18)),

          Text(cromo["equipo"]),
        ],
      ),
    );
  }
}
