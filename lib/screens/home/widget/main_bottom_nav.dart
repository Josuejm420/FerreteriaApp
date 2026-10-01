import 'package:flutter/material.dart';
import 'app.colors.dart';


// Barra de navegación inferior, la misma para Inicio, Inventario,

class MainBottomNav extends StatelessWidget {
  final int currentIndex;

  const MainBottomNav({super.key, required this.currentIndex});

 
  static const _rutas = ['/', '/inventario', '/proveedores', '/reportes'];

  void _irA(BuildContext context, int index) {
    if (index == currentIndex) return; // ya estás en esa pantalla
    Navigator.pushReplacementNamed(context, _rutas[index]);
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: currentIndex,
      selectedItemColor: AppColors.azul,
      unselectedItemColor: AppColors.gris,
      onTap: (index) => _irA(context, index),
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Inicio'),
        BottomNavigationBarItem(icon: Icon(Icons.inventory_2), label: 'Inventario'),
        BottomNavigationBarItem(icon: Icon(Icons.local_shipping), label: 'Proveedores'),
        BottomNavigationBarItem(icon: Icon(Icons.insert_chart), label: 'Reportes'),
      ],
    );
  }
}