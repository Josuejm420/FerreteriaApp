import 'package:flutter/material.dart';
import 'screens/reportes/reportes.screen.dart';
import 'screens/historial_screen.dart';
import 'package:ferreteria_app/screens/proveedor/widget/proveedores.screen.dart';
import 'screens/home/home.screen.dart';
import 'screens/home/widget/placehoder.sreen.dart';
import 'screens/home/widget/app.colors.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ferretería Don Toño - Admin',
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
        colorSchemeSeed: AppColors.azul,
        useMaterial3: true,
        appBarTheme: const AppBarTheme(
          backgroundColor: AppColors.azul,
          foregroundColor: Colors.white,
        ),
      ),
      // Ruta con la que arranca la app.
      initialRoute: '/',
      // Rutas nombradas: cada string se asocia a una pantalla.
      // Para navegar se usa Navigator.pushNamed(context, '/nombre'), etc.
      routes: {
        '/': (context) => const HomeScreen(),
        '/dashboard': (context) =>
            const PlaceholderScreen(titulo: 'Dashboard'),
        '/cliente': (context) =>
            const PlaceholderScreen(titulo: 'Clientes'),
        '/inventario': (context) =>
            const PlaceholderScreen(titulo: 'Inventario', currentIndex: 1),
        '/facturacion': (context) =>
            const PlaceholderScreen(titulo: 'Facturación'),
        '/reportes': (context) => const PlaceholderScreen(titulo: 'Reportes', currentIndex: 3),
        '/mantenimiento': (context) =>
            const PlaceholderScreen(titulo: 'Mantenimiento'),
        '/proveedores': (context) => const ProveedoresScreen(),
        '/usuarios': (context) =>
            const PlaceholderScreen(titulo: 'Gestión de Usuarios'),
        '/configuracion': (context) =>
            const PlaceholderScreen(titulo: 'Configuración del Sistema'),
        '/auditoria': (context) =>
            const PlaceholderScreen(titulo: 'Auditoría Interna'),
      },
    );
  }
}