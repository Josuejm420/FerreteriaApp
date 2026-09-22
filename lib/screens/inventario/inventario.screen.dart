import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xFF0D253F),
          leading: const Icon(Icons.menu, color: Colors.white),
          title: const Text('Inventario', style: TextStyle(color: Colors.white)),
          actions: const [Icon(Icons.search, color: Colors.white), SizedBox(width: 15)],
        ),
        body: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            children: [
              // Buscador
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Row(
                  children: [
                    Icon(Icons.search, color: Colors.grey),
                    SizedBox(width: 10),
                    Text('Buscar producto', style: TextStyle(color: Colors.grey)),
                  ],
                ),
              ),

              const SizedBox(height: 15),

              // Botones de filtro
              const Row(
                children: [
                  Chip(label: Text('Todo', style: TextStyle(color: Colors.white)), backgroundColor: Color(0xFF0D253F)),
                  SizedBox(width: 5),
                  Chip(label: Text('Stock Bajo')),
                  SizedBox(width: 5),
                  Chip(label: Text('Próximo Vencimiento')),
                ],
              ),

              const SizedBox(height: 15),

            // Lista de Productos
              Expanded(
                child: ListView(
                  children: const [
                    // Producto 1
                    ListTile(
                      leading: Icon(Icons.build, size: 40),
                      title: Text('Martillo Neumático', style: TextStyle(fontWeight: FontWeight.bold)),
                      subtitle: Text('Stock: 25'),
                      trailing: Text('C\$ 150.00'),
                    ),
                    Divider(),

                    // Producto 2
                    ListTile(
                      leading: Icon(Icons.cable, size: 40),
                      title: Text('Cable Eléctrico Pro', style: TextStyle(fontWeight: FontWeight.bold)),
                      subtitle: Text('Stock: 26'),
                      trailing: Text('C\$ 150.00'),
                    ),
                    Divider(),

                    // Producto 3
                    ListTile(
                      leading: Icon(Icons.inventory_2, size: 40),
                      title: Text('Cemento 42.5kg', style: TextStyle(fontWeight: FontWeight.bold)),
                      subtitle: Text('Stock: 10'),
                      trailing: Text('C\$ 150.00'),
                    ),
                    Divider(),

                    // Producto 4
                    ListTile(
                      leading: Icon(Icons.hardware, size: 40),
                      title: Text('Tornillo madera 3"', style: TextStyle(fontWeight: FontWeight.bold)),
                      subtitle: Text('Stock: 12'),
                      trailing: Text('C\$ 210.00'),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        // Botón Flotante
      // Botón Flotante
        floatingActionButton: FloatingActionButton.extended(
          onPressed: () {},
          backgroundColor: const Color(0xFF0D253F),
          icon: const Icon(Icons.add, color: Colors.white),
          label: const Text('Añadir Item', style: TextStyle(color: Colors.white)),
        ),
      ),
    );
  }
}