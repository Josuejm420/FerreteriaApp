import 'package:flutter/material.dart';
import 'screens/reportes/reportes.screen.dart';
import 'screens/historial_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ferreteria Don Toño - Admin',
      debugShowCheckedModeBanner: false,

      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.blue,
        ),
        useMaterial3: true,
      ),

      // Pantalla que aparece al iniciar
      home: const Reportesscreen(),

      // Las dos pantallas quedan registradas
      routes: {
        '/reportes': (context) => const Reportesscreen(),
        '/historial': (context) => const HistorialScreen(),
      },
    );
  }
}