import 'package:flutter/material.dart';
import 'app.colors.dart';

// Tarjeta que solo MUESTRA una métrica, no navega a ningún lado.
// La navegación ahora vive en la barra inferior y en el drawer.
class MetricCard extends StatelessWidget {
  final IconData icono;
  final String valor;
  final String etiqueta;

  const MetricCard({
    super.key,
    required this.icono,
    required this.valor,
    required this.etiqueta,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      color: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icono, size: 32, color: AppColors.azul),
            const SizedBox(height: 8),
            Text(
              valor,
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: AppColors.texto,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              etiqueta,
              textAlign: TextAlign.center,
              style: const TextStyle(color: AppColors.gris, fontSize: 12),
            ),
          ],
        ),
      ),
    );
  }
}