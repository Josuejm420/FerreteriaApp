import 'package:flutter/material.dart';
import 'screens/home/home.screen.dart';
import 'screens/home/widget/placehoder.sreen.dart';

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
        colorSchemeSeed: Colors.orange,
        useMaterial3: true,
      ),

      // Ruta con la quw va comenzar la app
      initialRoute: '/',
      // Rutas nombradas : cada string se va asociar a una pantalla 
      // para navegar de usa Navegator.pushNamed(contex, '/nombre de la pantalla' etc.)
      routes: {
        '/':(context) => const HomeScreen(),
        '/dashboard':(context) => const PlacehoderScreen(titulo: 'Dashboard'),
        '/cliente':(context) => const PlacehoderScreen(titulo: 'Clientes'),
        '/inventario':(context) => const PlacehoderScreen(titulo: 'Inventario'),
        /*'/facturacion':(context) => const PlacehoderScreen(titulo: 'Facturacion'),*/
        '/reportes':(context) => const PlacehoderScreen(titulo: 'Reportes'),

      }, 
    );
  }
}