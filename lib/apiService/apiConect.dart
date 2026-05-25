import 'dart:convert';
import 'dart:ffi';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

class ApiConect{

  static const login="http://100.97.249.120:3000/api/login";

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
      return res;
    }
  }
  


}
