import 'package:flutter/material.dart';
void main() {
  runApp(const AddProductScreen());
}
class AddProductScreen extends StatefulWidget {
  const AddProductScreen({super.key});
  @override
  State<AddProductScreen> createState() => _AddProductScreenState();
}

class _AddProductScreenState extends State<AddProductScreen> {
  // Lista sencilla para el desplegable de categoría
  String categoriaSeleccionada = 'Herramientas manuales';
  final List<String> categorias = [
    'Herramientas manuales',
    'Herramientas electricas',
    'Materiales de construccion',
    'Fontaneria',
    'Electricidad',
    'Pintura y Acabados',
    'Ferreteria General',
  ];

 @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xFF0D253F),
          leading: const Icon(Icons.arrow_back, color: Colors.white),
          title: const Text(
            'Add/Edit producto',
            style: TextStyle(color: Colors.white),
          ),
        ),
        body: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            // Nombre del producto
            const Text(
              'Nombre del producto',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 6),
            const TextField(
              decoration: InputDecoration(
                hintText: 'Nombre del producto',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 15),