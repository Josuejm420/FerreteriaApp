import 'package:flutter/material.dart';
import 'agregar_cliente.screen.dart';
import 'app.colors.dart';
import 'cliente_card.dart';

class ClientesScreen extends StatefulWidget {
  const ClientesScreen({super.key});

  @override
  State<ClientesScreen> createState() => _ClientesScreenState();
}

class _ClientesScreenState extends State<ClientesScreen> {
  List<Map<String, String>> listaClientes = [
    {
      'nombre': 'Juan Pérez',
      'telefono': '+505 8888 7777',
      'email': 'juan@email.com',
      'estado': 'Activo'
    },
    {
      'nombre': 'Constructora Rivera',
      'telefono': '+505 8855 3322',
      'email': 'constructora@email.com',
      'estado': 'Activo'
    },
    {
      'nombre': 'María González',
      'telefono': '+505 8877 6655',
      'email': 'maria@email.com',
      'estado': 'Activo'
    },
    {
      'nombre': 'Ferretería El Progreso',
      'telefono': '+505 8866 4433',
      'email': 'progreso@email.com',
      'estado': 'Inactivo'
    },
    {
      'nombre': 'Carlos López',
      'telefono': '+505 8899 2211',
      'email': 'carlos@email.com',
      'estado': 'Activo'
    },
  ];

  String filtro = 'Todos';

  @override
  Widget build(BuildContext context) {
    List<Map<String, String>> clientesMostrar = [];
    for (var cliente in listaClientes) {
      if (filtro == 'Todos') {
        clientesMostrar.add(cliente);
      } else if (filtro == 'Activos' && cliente['estado'] == 'Activo') {
        clientesMostrar.add(cliente);
      } else if (filtro == 'Inactivos' && cliente['estado'] == 'Inactivo') {
        clientesMostrar.add(cliente);
      }
    }

    return Scaffold(
      backgroundColor: AppColors.fondo,
      appBar: AppBar(
        backgroundColor: AppColors.principal,
        title:
            const Text('Clientes', style: TextStyle(color: AppColors.blanco)),
      ),
      body: Column(
        children: [
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: filtro == 'Todos'
                      ? AppColors.principal
                      : Colors.grey[300],
                ),
                onPressed: () => setState(() => filtro = 'Todos'),
                child: const Text('Todos'),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: filtro == 'Activos'
                      ? AppColors.principal
                      : Colors.grey[300],
                ),
                onPressed: () => setState(() => filtro = 'Activos'),
                child: const Text('Activos'),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: filtro == 'Inactivos'
                      ? AppColors.principal
                      : Colors.grey[300],
                ),
                onPressed: () => setState(() => filtro = 'Inactivos'),
                child: const Text('Inactivos'),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Expanded(
            child: ListView.builder(
              itemCount: clientesMostrar.length,
              itemBuilder: (context, index) {
                var c = clientesMostrar[index];
                return ClienteCard(
                  nombre: c['nombre']!,
                  telefono: c['telefono']!,
                  email: c['email']!,
                  estado: c['estado']!,
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColors.principal,
        child: const Icon(Icons.add, color: AppColors.blanco),
        onPressed: () async {
          var nuevo = await Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => const AgregarClienteScreen()),
          );

          if (nuevo != null) {
            setState(() {
              listaClientes.add(nuevo);
            });
          }
        },
      ),
    );
  }
}
