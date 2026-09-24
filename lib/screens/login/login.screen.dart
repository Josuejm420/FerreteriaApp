import 'package:flutter/material.dart';
import '../../routes/app_routes.dart';
import 'widget/login.headers.widget.dart';
import 'widget/login.form.widget.dart';
import '../home/widget/app.colors.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  Future<void> _login(BuildContext context, String email, String password) async {
    await Future.delayed(const Duration(seconds: 1));
    debugPrint('Intento de login -> $email');

    if (!context.mounted) return;

    Navigator.of(context).pushReplacementNamed(AppRoutes.dashboard);
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.sizeOf(context);

    return Scaffold(
      backgroundColor: AppColors.azul,
      resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
        child: ConstrainedBox(
          constraints: BoxConstraints(
            minHeight: screenSize.height,
          ),
          child: IntrinsicHeight(
            child: Column(
              children: [
                // Encabezado corregido
                const LoginHeader(),
                
                // Formulario estirado hasta el fondo blanco
                Expanded(
                  child: LoginForm(
                    onLogin: (email, password) => _login(context, email, password),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}