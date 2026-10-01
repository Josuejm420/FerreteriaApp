import 'package:flutter/material.dart';
import 'app.colors.dart';
import 'app_drawer.dart';
import 'main_bottom_nav.dart';

// Scaffold compartido: así Home, Inventario, Proveedores y Reportes
// no tienen que repetir el AppBar, el Drawer y la barra inferior.
// currentIndex null = esta pantalla NO es una de las 4 principales
// (por ejemplo Mantenimiento o Configuración, que solo viven en el drawer).
class MainScaffold extends StatelessWidget {
  final String titulo;
  final Widget body;
  final int? currentIndex;

  const MainScaffold({
    super.key,
    required this.titulo,
    required this.body,
    this.currentIndex,
  });

  // true solo en Home (currentIndex 0). Ahí no hay flecha, solo el menú.
  bool get _esHome => currentIndex == 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.fondo,
      drawer: const AppDrawer(),
      appBar: AppBar(
        leading: Builder(
          builder: (innerContext) {
            if (_esHome) {
              // En Home no hay a dónde "regresar": se abre el drawer.
              return IconButton(
                icon: const Icon(Icons.menu),
                onPressed: () => Scaffold.of(innerContext).openDrawer(),
              );
            }
            // En cualquier otra pantalla, la flecha regresa directo al Home.
            return IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.pushNamedAndRemoveUntil(
                  context,
                  '/',
                  (route) => false,
                );
              },
            );
          },
        ),
        title: Text(titulo),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications_none),
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('No tienes notificaciones nuevas')),
              );
            },
          ),
        ],
      ),
      body: SafeArea(child: body),
      bottomNavigationBar:
          currentIndex == null ? null : MainBottomNav(currentIndex: currentIndex!),
    );
  }
}