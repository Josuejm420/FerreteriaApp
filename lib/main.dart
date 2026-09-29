import 'package:ferreteria_app/screens/proveedor/widget/proveedores.screen.dart';
import 'package:flutter/material.dart';
import 'screens/home/home.screen.dart';
import 'screens/home/widget/placehoder.sreen.dart';
import 'screens/home/widget/app.colors.dart';
import 'routes/app_routes.dart';
import 'screens/login/login.screen.dart';
import 'screens/reportes/reportes.screen.dart';

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
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; Flutter preserves
        // the application state during hot reload.
        //
        // This works for code too, not just values.
        colorScheme: .fromSeed(seedColor: Colors.deepPurple),
      ),

      // Aquí cambiamos la pantalla inicial por Reportes.
      home: const Reportesscreen(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: .center,
          children: [
            const Text('You have pushed the button this many times:'),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
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
        '/proveedores':(context) => const PlacehoderScreen(titulo: 'Proveedores'),

      }, 
    );
  }
}