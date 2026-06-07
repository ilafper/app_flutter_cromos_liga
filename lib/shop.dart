import 'package:flutter/material.dart';

class ShopView extends StatefulWidget {
  const ShopView({super.key});

  @override
  State<ShopView> createState() => _ShopView();
}

class _ShopView extends State<ShopView> {
 
  

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 22, 24, 35),
      appBar: AppBar(
        title: const Text("Tienda", style: TextStyle(color: Colors.white)),
        backgroundColor: Color.fromARGB(255, 22, 24, 35),
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

      body: Center(
        
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            const Text(
              "vista tienda sissi"
            ),
           
          ],
        ),
      ),
      
    );
  }
}
