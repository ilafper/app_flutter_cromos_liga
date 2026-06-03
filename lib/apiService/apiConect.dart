import 'dart:convert';
import 'dart:ffi';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import '../home.dart';

import 'package:shared_preferences/shared_preferences.dart';
import '../usuarioData/usuarioDatos.dart';

class ApiConect{

  static const login="http://100.97.249.120:3000/api/login";

  static const register = "http://100.97.249.1204:3000/api/registro";


  static const sobre = "http://100.97.249.120:3000/api/random";


  static Future<Map<String, dynamic>?> loginApp({
    required String correo,
    required String password,
    
  }) async {
    final response = await http.post(
      Uri.parse(login),
      headers: {"Content-Type": "application/json"},

      body: jsonEncode({
        "correo": correo,
        "password":password
      }),
    );



    //print(response.body);

    if (response.statusCode == 200 || response.statusCode == 400) {
      var res = jsonDecode(response.body);
      print('respues respuesta $res');

      // guardar datos usuario

      if (res["success"]== true) {
        final usuario= res["user"];

        UserSession.nombre= usuario["nombre"];
        UserSession.correo= usuario["correo"];



        final prefs = await SharedPreferences.getInstance();

        await prefs.setString("nombre", usuario["nombre"]);
        await prefs.setString("correo", usuario["correo"]);
      }
      return res;
    }
  }

  //abrir sobres

  static Future<List<dynamic>> abrirSobres() async {
    print("LLLAMANDO LLAMANDO PROBANDO PROBAND");
    // peticion a la api para cargar random sobres
    final res = await http.get(Uri.parse(sobre));
    print(res);
    // si fue exitosa manda la lista
    if (res.statusCode == 200) {
      final json = jsonDecode(res.body);
      // guardamos la lista
      List data = json["jugadores_aleatorios"];

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

}
