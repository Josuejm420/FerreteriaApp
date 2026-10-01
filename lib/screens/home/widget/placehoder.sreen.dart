import 'package:flutter/material.dart';
import 'app.colors.dart';
import 'main_scaffold.dart';

class PlaceholderScreen extends StatelessWidget {
  final String titulo;
  final int? currentIndex;

  const PlaceholderScreen({
    super.key,
    required this.titulo,
    this.currentIndex,
  });

  @override
  Widget build(BuildContext context) {
    return MainScaffold(
      titulo: titulo,
      currentIndex: currentIndex,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.construction, size: 60, color: AppColors.gris),
            const SizedBox(height: 12),
            Text(
              '$titulo\n(En Construcción)',
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 18, color: AppColors.texto),
            ),
          ],
        ),
      ),
    );
  }
}