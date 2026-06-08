import 'dart:convert';
import 'dart:ffi';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import '../home.dart';

import 'package:shared_preferences/shared_preferences.dart';
import '../usuarioData/usuarioDatos.dart';

class ApiConect {

  static const login = "http://100.97.249.120:3000/api/login";

  static const register = "http://100.97.249.120:3000/api/registro";

  static const sobre = "http://100.97.249.120:3000/api/random";

  static const todos_jugadores = "http://100.97.249.120:3000/api/cromos";

  static const mis_cromos = "http://100.97.249.120:3000/api/abrirsobre";

  static const datos_usuario = "http://100.97.249.120:3000/api/datosusuarios";
  static const url_tienda = "http://100.97.249.120:3000/api/tienda";
  //100.97.249.120
  static const intercambio = "http://100.97.249.120:3000/api/intercambio";

  static Future<Map<String, dynamic>?> loginApp({
    required String correo,
    required String password,
  }) async {
    final response = await http.post(
      Uri.parse(login),
      headers: {"Content-Type": "application/json"},

      body: jsonEncode({"correo": correo, "password": password}),
    );

    //print(response.body);

    if (response.statusCode == 200 || response.statusCode == 400) {
      var res = jsonDecode(response.body);
      print('respues respuesta $res');

      // guardar datos usuario

      if (res["success"] == true) {
        final usuario = res["user"];

        UserSession.nombre = usuario["nombre"];
        UserSession.correo = usuario["correo"];
        UserSession.lista_cromos = usuario["lista_cromos"];
        UserSession.code_user = usuario["code_user"];
        UserSession.estadisticas = usuario["estadisticas"];

        final prefs = await SharedPreferences.getInstance();

        await prefs.setString("nombre", usuario["nombre"]);
        await prefs.setString("correo", usuario["correo"]);
        await prefs.setString("code_user", usuario["code_user"]);
        await prefs.setString(
          "lista_cromos",
          json.encode(usuario["lista_cromos"]),
        );
        await prefs.setString(
          "estadisticas",
          json.encode(usuario["estadisticas"]),
        );
      }
      return res;
    }
  }

  //abrir sobres

  static Future<List<dynamic>> abrirSobres(String code_user) async {
    print("abirendo sobre sobres");

    // peticion a la api para cargar random sobres
    final res = await http.post(
      Uri.parse(mis_cromos),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode({"code_user": code_user}),
    );

    print(res);
    print("code_user: $code_user");
    // si fue exitosa manda la lista
    if (res.statusCode == 200) {
      final json = jsonDecode(res.body);
      // guardamos la lista
      List data = json["sobre_cartas"];

      print(" uuuuuuuuuuuuuuuu $data");
      //devolvemos al lista
      return data;
    } else {
      throw Exception("Error al cargar cromos");
    }
  }

  //const { nombre, correo, password1, password2 }
  static Future<Map<String, dynamic>?> registerPost({
    required String nombre,
    required String correo,
    required String password1,
    required String password2,
  }) async {
    print(nombre);
    print(correo);

    final response = await http.post(
      Uri.parse(register),
      headers: {"Content-Type": "application/json"},

      body: jsonEncode({
        "nombre": nombre,
        "correo": correo,
        "password1": password1,
        "password2": password2,
      }),
    );

    //print(response.body);

    var res = jsonDecode(response.body);
    print('respues respuesta $res');
    return res;
  }

  static Future<List<dynamic>> todosJugadores() async {
    print("LLLAMANDO LLAMANDO PROBANDO PROBAND");
    // peticion a la api para cargar random sobres
    final res = await http.get(Uri.parse(todos_jugadores));
    print(res);

    // si fue exitosa manda la lista
    if (res.statusCode == 200) {
      final json = jsonDecode(res.body);

      // guardamos la lista

      List data = json["lista_cromos"];

      //print(" uuuuuuuuuuuuuuuu $data");
      //devolvemos al lista
      return data;
    } else {
      throw Exception("Error al cargar cromos");
    }
  }

  static Future<Map<String, dynamic>> ObtenerDatosUsuario(String code_user,) async {
    try {
      final url = "$datos_usuario/$code_user";

      final res = await http.get(
        Uri.parse(url),
        headers: {"Content-Type": "application/json"},
      );

      if (res.statusCode == 200) {
        final json = jsonDecode(res.body);

        return { 
          'success': true,
          'lista_cromos': json['lista_cromos'] ?? [],
          'estadisticas': json['estadisticas'] ?? [],
        };
      } else {
        return {'success': false, 'mensaje': 'Error ${res.statusCode}'};
      }
    } catch (e) {
      print("Error: $e");
      return {'success': false, 'mensaje': e.toString()};
    }
  }



  static  Future<Map<String, dynamic>> tienda() async {
    print("abirendo sobre sobres");

    // peticion a la api para cargar random sobres
    final res = await http.get(Uri.parse(url_tienda),headers: {"Content-Type": "application/json"});

    print(res);
    // si fue exitosa manda la lista
    if (res.statusCode == 200) {
        final json = jsonDecode(res.body);

        return { 
          'success': true,
          'cartas_random': json['cartas_random'] ?? [],
        };
      } else {
        return {'success': false, 'mensaje': 'Error ${res.statusCode}'};
      }
  }


  //funcion intercambio jugadores 

  static Future<Map<String, dynamic>> intercambioCartas(dynamic seleccionado1 , dynamic seleccionado2, String code_user) async {
    

    // peticion a la api
    final res = await http.post(
      Uri.parse(intercambio),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode({"primerSeleccionado": seleccionado1, "segundoSeleccionado":seleccionado2, "code_user":code_user}),
    );

    print(res);
    
    // si fue exitosa manda la lista
    if (res.statusCode == 200) {
      //
      final json = jsonDecode(res.body);
      // guardamos la lista

    

      print(" $json");
      //devolvemos al lista
      return json;
    } else {
      throw Exception("Error al cargar cromos");
    }
  }
}
