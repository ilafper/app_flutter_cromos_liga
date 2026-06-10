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
  // Variables ESTÁTICAS para mantener los datos entre visitas
  static List _cartasTiendaCacheadas = [];
  static bool _datosCargados = false;
  
  List cartas_tienda = [];
  bool cargando = true;
  bool cargandoRecarga = false;
  List cromos_user = [];
  List cromos_repetidos_mas_0 = [];
  
  @override
  void initState() {
    super.initState();
    cargarCromos();
    
    
    if (!_datosCargados) {
      cargarCromos_Tienda();
    } else {
      // Usar datos cacheados
      setState(() {
        cartas_tienda = List.from(_cartasTiendaCacheadas);
        cargando = false;
      });
    }
  }

 
  recargarTienda() async {
    setState(() {
      cargandoRecarga = true;
    });
    
    final respuesta = await ApiConect.tienda();
    
    if (respuesta['success'] == true) {
      setState(() {
        cartas_tienda = respuesta['cartas_random'];
        cargandoRecarga = false;
      });
      
      
      _cartasTiendaCacheadas = List.from(respuesta['cartas_random']);
      _datosCargados = true;
      
      UserSession.lista_cromos = cartas_tienda;

    } else {
      setState(() {
        cargandoRecarga = false;
      });
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text("Error al recargar la tienda"),
            backgroundColor: Colors.red,
          ),
        );
      }
    }
  }

  cargarCromos_Tienda() async {
    setState(() {
      cargando = true;
    });
    
    final respuesta = await ApiConect.tienda();
    
    if (respuesta['success'] == true) {
      setState(() {
        cartas_tienda = respuesta['cartas_random'];
        cargando = false;
      });
      
      // Guardar en caché
      _cartasTiendaCacheadas = List.from(respuesta['cartas_random']);
      _datosCargados = true;
      
      UserSession.lista_cromos = cartas_tienda;
    } else {
      setState(() {
        cartas_tienda = [];
        cargando = false;
      });
    }
  }
 
  cargarCromos() async {
    final code_user = UserSession.code_user;
    
    if (code_user == null || code_user.isEmpty) {
      cromos_user = [];
      return;
    }
    
    final respuesta = await ApiConect.ObtenerDatosUsuario(code_user);
    
    if (respuesta['success'] == true) {
      cromos_user = respuesta['lista_cromos'];
      cromosBien(cromos_user);
      UserSession.lista_cromos = cromos_user;
    } else {
      cromos_user = [];
    }
    
    if (mounted) {
      setState(() {});
    }
  }
  
  cromosBien(List cromos_user) {
    cromos_repetidos_mas_0.clear();
    
    for (var i = 0; i < cromos_user.length; i++) {
      if (cromos_user[i]["repetidas"] > 0) {
        cromos_repetidos_mas_0.add(cromos_user[i]);
      }
    }
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
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: Container(
                      width: double.infinity,
                      height: 80,
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: ElevatedButton(
                          onPressed: cargandoRecarga ? null : recargarTienda,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color.fromARGB(255, 125, 103, 146),
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
                          child: cargandoRecarga
                              ? const SizedBox(
                                  width: 20,
                                  height: 20,
                                  child: CircularProgressIndicator(
                                    strokeWidth: 2,
                                    color: Colors.white,
                                  ),
                                )
                              : const Icon(
                                  Icons.repeat,
                                  color: Colors.white,
                                  size: 20,
                                ),
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 10),

                  cartas_tienda.isEmpty
                      ? const Padding(
                          padding: EdgeInsets.all(50),
                          child: Center(
                            child: Text(
                              "No hay cartas disponibles\nPresiona el botón de recargar",
                              textAlign: TextAlign.center,
                              style: TextStyle(color: Colors.white54),
                            ),
                          ),
                        )
                      : Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Wrap(
                            spacing: 20,
                            runSpacing: 20,
                            alignment: WrapAlignment.center,
                            children: List.generate(cartas_tienda.length, (index) {
                              final lista_cartas_tiendas = cartas_tienda[index];
                              final lista_cromos_usuario = cromos_repetidos_mas_0;
                              return CartasTienda(
                                cromo_tienda: lista_cartas_tiendas,
                                cromos_user: lista_cromos_usuario,
                              );
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