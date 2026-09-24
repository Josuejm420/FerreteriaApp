import 'package:flutter/material.dart';
import 'screens/home/home.screen.dart';
import 'screens/home/widget/placehoder.sreen.dart';
import 'screens/home/widget/app.colors.dart';
import 'routes/app_routes.dart';
import 'screens/login/login.screen.dart';

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
        colorSchemeSeed: Colors.blue,
        useMaterial3: true,
        appBarTheme: const AppBarTheme(
          backgroundColor: AppColors.azul,
          foregroundColor: Colors.white,
        ),
      ),

      // Ruta con la quw va comenzar la app
      initialRoute: AppRoutes.login,
      // Rutas nombradas : cada string se va asociar a una pantalla 
      // para navegar de usa Navegator.pushNamed(contex, '/nombre de la pantalla' etc.)
      routes: {
        AppRoutes.login: (context) => const LoginScreen(),
        AppRoutes.dashboard: (context) => const HomeScreen(),
        AppRoutes.cliente: (context) => const PlacehoderScreen(titulo: 'Clientes'),
        AppRoutes.inventario: (context) => const PlacehoderScreen(titulo: 'Inventario'),
        /*AppRoutes.facturacion: (context) => const PlacehoderScreen(titulo: 'Facturacion'),*/
        AppRoutes.reportes: (context) => const PlacehoderScreen(titulo: 'Reportes'),
        AppRoutes.proveedores: (context) => const PlacehoderScreen(titulo: 'Proveedores'),

      }, 
    );
  }
}