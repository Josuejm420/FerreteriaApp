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
  String categoriaSeleccionada = 'Herramientas';
  final List<String> categorias = [
    'Herramientas manuales',
    'Herramientas electricas',
    'Materiales de construccion',
    'Fontaneria',
    'Electricidad',
    'Pintura y Acabados',
    'Ferreteria General',
  ];
