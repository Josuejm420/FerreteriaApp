import 'package:flutter/material.dart';

/// Encabezado del login: marca integrada, icono naranja y fondo adaptado.
class LoginHeader extends StatelessWidget {
  const LoginHeader({super.key});

  @override
  Widget build(BuildContext context) {
    // SafeArea evita que la barra del teléfono (batería/hora) tape el texto
    return SafeArea(
      bottom: false,
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
        child: Stack(
          alignment: Alignment.center,
          children: [
            // Icono grande de fondo (construcción semitransparente)
            const Positioned(
              bottom: -10,
              child: Icon(
                Icons.construction_rounded,
                size: 150,
                color: Color(0x0FFFFFFF), // Blanco al 6% de opacidad
              ),
            ),
            // Logo + Textos alineados y centrados verticalmente
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Icono naranja de la herramienta con sombra
                Container(
                  padding: const EdgeInsets.all(14),
                  decoration: BoxDecoration(
                    color: const Color(0xFFF2A93B),
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: [
                      BoxShadow(
                        color: const Color(0xFFF2A93B),
                        blurRadius: 15,
                        offset: const Offset(0, 6),
                      ),
                    ],
                  ),
                  child: const Icon(
                    Icons.build_rounded,
                    color: Colors.white,
                    size: 34,
                  ),
                ),
                const SizedBox(height: 12),
                // Textos del título bien espaciados
                const Text(
                  'MINI FERRETERÍA',
                  style: TextStyle(
                    color: Colors.white60,
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    letterSpacing: 2.0,
                  ),
                ),
                const SizedBox(height: 2),
                const Text(
                  'DON TOÑO',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 50,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.0,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}