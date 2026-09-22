import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xFF0D253F),
          leading: const Icon(Icons.menu, color: Colors.white),
          title: const Text('Inventario', style: TextStyle(color: Colors.white)),
          actions: const [Icon(Icons.search, color: Colors.white), SizedBox(width: 15)],
        ),
        body: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            children: [
              // Buscador
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Row(
                  children: [
                    Icon(Icons.search, color: Colors.grey),
                    SizedBox(width: 10),
                    Text('Buscar producto', style: TextStyle(color: Colors.grey)),
                  ],
                ),
              ),

              const SizedBox(height: 15),

              //
  
   ],
          ),
        ),
      ),
    );
  }
}