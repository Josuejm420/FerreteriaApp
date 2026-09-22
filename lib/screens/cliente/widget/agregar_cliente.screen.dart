import 'package:flutter/material.dart';
import 'app.colors.dart';

class AgregarClienteScreen extends StatefulWidget {
  const AgregarClienteScreen({super.key});

  @override
  State<AgregarClienteScreen> createState() => _AgregarClienteScreenState();
}

class _AgregarClienteScreenState extends State<AgregarClienteScreen> {
  final controllerNombre = TextEditingController();
  final controllerTelefono = TextEditingController();
  final controllerEmail = TextEditingController();
  String estadoSeleccionado = 'Activo';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.principal,
        title: const Text('Agregar Cliente',
            style: TextStyle(color: AppColors.blanco)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: controllerNombre,
              decoration: const InputDecoration(labelText: 'Nombre'),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: controllerTelefono,
              decoration: const InputDecoration(labelText: 'Teléfono'),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: controllerEmail,
              decoration: const InputDecoration(labelText: 'Email'),
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
                if (controllerNombre.text.isEmpty) return;

                Navigator.pop(context, {
                  'nombre': controllerNombre.text,
                  'telefono': controllerTelefono.text,
                  'email': controllerEmail.text,
                  'estado': estadoSeleccionado,
                });
              },
              child: const Text('Guardar',
                  style: TextStyle(color: AppColors.blanco)),
            ),
          ],
        ),
      ),
    );
  }
}
