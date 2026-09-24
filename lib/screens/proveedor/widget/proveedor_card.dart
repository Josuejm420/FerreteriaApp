import 'package:flutter/material.dart';
import 'app.colors.dart';

class ProveedorCard extends StatelessWidget {
  final String empresa;
  final String contacto;
  final String telefono;
  final String categoria;
  final String estado;

  const ProveedorCard({
    super.key,
    required this.empresa,
    required this.contacto,
    required this.telefono,
    required this.categoria,
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
              child: Icon(Icons.business, color: AppColors.principal),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    empresa,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 15),
                  ),
                  const SizedBox(height: 2),
                  Row(
                    children: [
                      const Icon(Icons.person_outline,
                          size: 14, color: AppColors.textoGris),
                      const SizedBox(width: 4),
                      Text(contacto,
                          style: const TextStyle(
                              fontSize: 12, color: AppColors.textoGris)),
                    ],
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
                      const Icon(Icons.category_outlined,
                          size: 14, color: AppColors.textoGris),
                      const SizedBox(width: 4),
                      Text(categoria,
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
