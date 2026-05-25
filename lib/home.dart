import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});
   
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text("Home", style: TextStyle(
          color: Color.fromARGB(255, 8, 8, 8)
        ),),
        
      ),
      body: Center(
        child: Column(
          
          children: [
            Image.asset("assets/images/sobre.png"),
            ElevatedButton(onPressed: (){} , child: const Text("ABRIR"))
            
          ],
        ),
      ),
    );
  }
}