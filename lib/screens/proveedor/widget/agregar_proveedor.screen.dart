import 'package:flutter/material.dart';
import 'app.colors.dart';

class AgregarProveedorScreen extends StatefulWidget {
  const AgregarProveedorScreen({super.key});

  @override
  State<AgregarProveedorScreen> createState() => _AgregarProveedorScreenState();
}

class _AgregarProveedorScreenState extends State<AgregarProveedorScreen> {
  final controllerEmpresa = TextEditingController();
  final controllerContacto = TextEditingController();
  final controllerTelefono = TextEditingController();
  final controllerCategoria = TextEditingController();
  String estadoSeleccionado = 'Activo';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.principal,
        title: const Text('Agregar Proveedor',
            style: TextStyle(color: AppColors.blanco)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: controllerEmpresa,
              decoration:
                  const InputDecoration(labelText: 'Nombre de la Empresa'),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: controllerContacto,
              decoration: const InputDecoration(
                  labelText: 'Persona de Contacto / Encargado'),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: controllerTelefono,
              decoration: const InputDecoration(labelText: 'Teléfono'),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: controllerCategoria,
              decoration: const InputDecoration(
                  labelText: 'Categoría (ej. Herramientas, Cementos)'),
            ),
            const SizedBox(height: 10),
            DropdownButton<String>(
              value: estadoSeleccionado,
              isExpanded: true,
              items: const [
                DropdownMenuItem(value: 'Activo', child: Text('Activo')),
                DropdownMenuItem(value: 'Inactivo', child: Text('Inactivo')),
              ],
              onChanged: (valor) {
                setState(() {
                  estadoSeleccionado = valor!;
                });
              },
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.principal),
              onPressed: () {
                if (controllerEmpresa.text.isEmpty) return;

                Navigator.pop(context, {
                  'empresa': controllerEmpresa.text,
                  'contacto': controllerContacto.text,
                  'telefono': controllerTelefono.text,
                  'categoria': controllerCategoria.text.isEmpty
                      ? 'General'
                      : controllerCategoria.text,
                  'estado': estadoSeleccionado,
                });
              },
              child: const Text('Guardar Proveedor',
                  style: TextStyle(color: AppColors.blanco)),
            ),
          ],
        ),
      ),
    );
  }
}
