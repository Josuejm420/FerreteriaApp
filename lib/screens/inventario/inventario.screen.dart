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
  
   }