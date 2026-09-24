import 'package:flutter/material.dart';
import 'agregar_proveedor.screen.dart';
import 'app.colors.dart';
import 'proveedor_card.dart';

class ProveedoresScreen extends StatefulWidget {
  const ProveedoresScreen({super.key});

  @override
  State<ProveedoresScreen> createState() => _ProveedoresScreenState();
}

class _ProveedoresScreenState extends State<ProveedoresScreen> {
  // Lista básica de proveedores de ferretería
  List<Map<String, String>> listaProveedores = [
    {
      'empresa': 'Holcim Nicaragua',
      'contacto': 'Ing. Roberto Silva',
      'telefono': '+505 2255 1100',
      'categoria': 'Cemento y Concreto',
      'estado': 'Activo',
    },
    {
      'empresa': 'Truper Herramientas',
      'contacto': 'Lic. Mario Gómez',
      'telefono': '+505 8899 4422',
      'categoria': 'Herramientas Manuales',
      'estado': 'Activo',
    },
    {
      'empresa': 'Sylvania Iluminación',
      'contacto': 'Ana Martínez',
      'telefono': '+505 8877 1133',
      'categoria': 'Material Eléctrico',
      'estado': 'Activo',
    },
    {
      'empresa': 'Pinturas Modelo',
      'contacto': 'Carlos Blandón',
      'telefono': '+505 8866 5544',
      'categoria': 'Pinturas y Acabados',
      'estado': 'Inactivo',
    },
  ];

  String filtro = 'Todos';
  String textoBusqueda = '';

  @override
  Widget build(BuildContext context) {
    // Filtrar proveedores por estado Y por el texto buscado
    List<Map<String, String>> proveedoresMostrar = [];

    for (var prov in listaProveedores) {
      bool coincideEstado = false;
      if (filtro == 'Todos') {
        coincideEstado = true;
      } else if (filtro == 'Activos' && prov['estado'] == 'Activo') {
        coincideEstado = true;
      } else if (filtro == 'Inactivos' && prov['estado'] == 'Inactivo') {
        coincideEstado = true;
      }

      bool coincideNombre =
          prov['empresa']!.toLowerCase().contains(textoBusqueda.toLowerCase());

      if (coincideEstado && coincideNombre) {
        proveedoresMostrar.add(prov);
      }
    }

    return Scaffold(
      backgroundColor: AppColors.fondo,
      appBar: AppBar(
        backgroundColor: AppColors.principal,
        title: const Text('Proveedores',
            style: TextStyle(color: AppColors.blanco)),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: TextField(
              onChanged: (valor) {
                setState(() {
                  textoBusqueda = valor;
                });
              },
              decoration: InputDecoration(
                hintText: 'Buscar proveedor...',
                prefixIcon:
                    const Icon(Icons.search, color: AppColors.textoGris),
                fillColor: AppColors.blanco,
                filled: true,
                contentPadding: const EdgeInsets.symmetric(vertical: 0),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
          ),
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
              itemCount: proveedoresMostrar.length,
              itemBuilder: (context, index) {
                var p = proveedoresMostrar[index];

                return ProveedorCard(
                  empresa: p['empresa']!,
                  contacto: p['contacto']!,
                  telefono: p['telefono']!,
                  categoria: p['categoria']!,
                  estado: p['estado']!,
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
                builder: (context) => const AgregarProveedorScreen()),
          );

          if (nuevo != null) {
            setState(() {
              listaProveedores.add(nuevo);
            });
          }
        },
      ),
    );
  }
}
