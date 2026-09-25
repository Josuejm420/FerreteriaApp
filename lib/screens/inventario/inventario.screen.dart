import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: InventarioScreen(),
    );
  }
}

// producto
class Producto {
  final String nombre;
  final String subtitulo;
  final int cantidad;
  final double precio;
  final String estado; // 'Crítico' o 'Suficiente'
  final bool proximoVencer;
  final IconData icono;

  const Producto({
    required this.nombre,
    required this.subtitulo,
    required this.cantidad,
    required this.precio,
    required this.estado,
    required this.icono,
    this.proximoVencer = false,
  });
}

// filtros
class InventarioScreen extends StatefulWidget {
  const InventarioScreen({super.key});

  @override
  State<InventarioScreen> createState() => _InventarioScreenState();
}

class _InventarioScreenState extends State<InventarioScreen> {
  // 1. Variable para la barra inferior (1 = Inventario)
  int _indicePestana = 1;

  // 2. Variable para el filtro de categorías
  String _filtroSeleccionado = 'Todo';

  // 3. Variable y controlador para el buscador de texto
  String _textoBusqueda = '';
  final TextEditingController _controladorBusqueda = TextEditingController();

  // Lista 
  final List<Producto> _listaProductos = const [
    Producto(
      nombre: 'Martillo Neumático',
      subtitulo: 'Stock: 25',
      cantidad: 12,
      precio: 150.00,
      estado: 'Crítico',
      proximoVencer: false,
      icono: Icons.construction,
    ),
    Producto(
      nombre: 'Cable Eléctrico Pro',
      subtitulo: 'Stock: 26',
      cantidad: 20,
      precio: 150.00,
      estado: 'Suficiente',
      proximoVencer: false,
      icono: Icons.cable,
    ),
    Producto(
      nombre: 'Cemento 42.5kg',
      subtitulo: 'Stock: 10',
      cantidad: 25,
      precio: 150.00,
      estado: 'Suficiente',
      proximoVencer: true, 
      icono: Icons.inventory_2,
    ),
    Producto(
      nombre: 'Tornillo madera 3"',
      subtitulo: 'Stock: 12',
      cantidad: 13,
      precio: 210.00,
      estado: 'Suficiente',
      proximoVencer: false,
      icono: Icons.hardware,
    ),
    Producto(
      nombre: 'Pintura Látex Pro',
      subtitulo: 'Stock: 15',
      cantidad: 1,
      precio: 150.00,
      estado: 'Crítico',
      proximoVencer: true, 
      icono: Icons.format_paint,
    ),
  ];
  List<Producto> get _productosFiltrados {
    return _listaProductos.where((producto) {
      // Filtro por texto en el buscador
      final coincideNombre = producto.nombre
          .toLowerCase()
          .contains(_textoBusqueda.toLowerCase());
      if (!coincideNombre) return false;
      // Filtro por botón seleccionado
      if (_filtroSeleccionado == 'Stock Bajo') {
        return producto.estado == 'Crítico';
      } else if (_filtroSeleccionado == 'Próximo Vencimiento') {
        return producto.proximoVencer;
      }
      return true; 
    }).toList();
  }

    @override
  Widget build(BuildContext context) {
    // Títulos según la pestaña seleccionada abajo
    final titulos = ['Inicio', 'Inventario', 'Facturación', 'Reportes', 'Más'];
    return Scaffold(
      //AppBar
      appBar: AppBar(
        backgroundColor: const Color(0xFF0D253F),
        leading: const Icon(Icons.menu, color: Colors.white),
        title: Text(titulos[_indicePestana], style: const TextStyle(color: Colors.white)),
        actions: const [
          Icon(Icons.search, color: Colors.white),
          SizedBox(width: 15),
        ],
      ),