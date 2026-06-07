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

  @override
  void initState() {
    super.initState();
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
                  // Botón superior
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: Container(
                      width: double.infinity,
                      height: 80,
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: ElevatedButton(
                          onPressed: () {},
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
                        return CartasTienda(cromo_tienda: lista_cartas_tiendas);
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
