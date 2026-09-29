import 'package:flutter/material.dart';
import 'app.colors.dart';

class ClienteCard extends StatelessWidget {
  final String nombre;
  final String telefono;
  final String email;
  final String estado;

  const ClienteCard({
    super.key,
    required this.nombre,
    required this.telefono,
    required this.email,
    required this.estado,
  });

  @override
  Widget build(BuildContext context) {
    bool esActivo = estado == 'Activo';

    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Row(
          children: [
            const CircleAvatar(
              backgroundColor: AppColors.fondo,
              child: Icon(Icons.person, color: AppColors.principal),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    nombre,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 15),
                  ),
                  Row(
                    children: [
                      const Icon(Icons.phone,
                          size: 14, color: AppColors.textoGris),
                      const SizedBox(width: 4),
                      Text(telefono,
                          style: const TextStyle(
                              fontSize: 12, color: AppColors.textoGris)),
                    ],
                  ),
                  Row(
                    children: [
                      const Icon(Icons.email,
                          size: 14, color: AppColors.textoGris),
                      const SizedBox(width: 4),
                      Text(email,
                          style: const TextStyle(
                              fontSize: 12, color: AppColors.textoGris)),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.all(6),
              decoration: BoxDecoration(
                color: esActivo ? Colors.green[100] : Colors.red[100],
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text(
                estado,
                style: TextStyle(
                  color:
                      esActivo ? AppColors.verdeActivo : AppColors.rojoInactivo,
                  fontWeight: FontWeight.bold,
                  fontSize: 11,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
