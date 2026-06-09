import 'package:flutter/material.dart';
import 'package:app_flutter_cromos_liga/apiService/apiConect.dart';
import '../usuarioData/usuarioDatos.dart';
import 'widget/carta_tienda.dart';

class ShopView extends StatefulWidget {
  const ShopView({super.key});

  @override
  State<ShopView> createState() => _ShopView();
}

class _ShopView extends State<ShopView> {
  List cartas_tienda = [];
  bool cargando = true;
  List cromos_user =[];
  List carta_primera_vez = [];
  bool yacargo= false;
  dynamic seleccionado;
  @override
  void initState() {
    cargarCromos();
    cargarCromos_Tienda();
   
  }

  cargarCromos_Tienda() async {
    final respuesta = await ApiConect.tienda();

    print("lista cromos usuario");
    print("respuesta de cromos usuario: $respuesta");

    if (respuesta['success'] == true) {
      setState(() {
        cartas_tienda = respuesta['cartas_random'];
        cargando = false;
      });


    
      
      UserSession.lista_cromos = cartas_tienda;
    } else {
      setState(() {
        cartas_tienda = [];
        cargando = false;
      });
    }
  }

 
  //cargar los cromos del usuario para luego pasarla a los diferenetes wedgets 
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

      // Actualizar
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
      backgroundColor: const Color.fromARGB(255, 22, 24, 35),
      appBar: AppBar(
        title: const Text("Tienda", style: TextStyle(color: Colors.white)),
        backgroundColor: const Color.fromARGB(255, 22, 24, 35),
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
      body: cargando
          ? const Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
              child: Column(
                children: [
                  // Boton superior
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: Container(
                      width: double.infinity,
                      height: 80,
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: ElevatedButton(
                          onPressed: () {
                              cargarCromos_Tienda();
                          },
                          style:
                              ElevatedButton.styleFrom(
                                backgroundColor: const Color.fromARGB(
                                  255,
                                  125,
                                  103,
                                  146,
                                ),
                                padding: const EdgeInsets.all(10),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                elevation: 2,
                              ).copyWith(
                                overlayColor: MaterialStateProperty.all(
                                  Colors.white.withOpacity(0.2),
                                ),
                              ),
                          child: const Icon(
                            Icons.repeat,
                            color: Colors.white,
                            size: 20,
                          ),
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 10),

                  
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Wrap(
                      spacing: 20,
                      runSpacing: 20,
                      alignment: WrapAlignment.center,
                      children: List.generate(cartas_tienda.length, (index) {
                        final lista_cartas_tiendas = cartas_tienda[index];
                        final lista_cromos_usuario = cromos_user;
                        return CartasTienda(cromo_tienda: lista_cartas_tiendas, cromos_user: lista_cromos_usuario,);
                      }),
                    ),
                  ),

                  const SizedBox(height: 20),
                ],
              ),
            ),
    );
  }
}
