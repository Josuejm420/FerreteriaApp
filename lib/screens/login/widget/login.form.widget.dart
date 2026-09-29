import 'package:flutter/material.dart';
import 'custom_button.widget.dart';
import 'custom_text_field.widget.dart';

// Tarjeta blanca con el formulario de acceso: correo, contraseña,
// botón "Iniciar sesión" y enlace "Olvidé mi contraseña".
class LoginForm extends StatefulWidget {
  final Future<void> Function(String email, String password) onLogin;

  const LoginForm({super.key, required this.onLogin});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _obscurePassword = true;
  bool _isLoading = false;

  
  final RegExp _emailRegex = RegExp(r'^[\w.-]+@[\w-]+\.[a-zA-Z]{2,4}$');
  // Contraseña: mínimo 6 caracteres.
  final RegExp _passwordRegex = RegExp(r'^.{6,}$');

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  // Validador del correo, se usa en el TextFormField.
  String? _validarCorreo(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Ingresa tu correo';
    }
    if (!_emailRegex.hasMatch(value.trim())) {
      return 'Correo no válido';
    }
    return null;
  }

  // Validador de la contraseña, se usa en el TextFormField.
  String? _validarContrasena(String? value) {
    if (value == null || value.isEmpty) {
      return 'Ingresa tu contraseña';
    }
    if (!_passwordRegex.hasMatch(value)) {
      return 'Debe tener al menos 6 caracteres';
    }
    return null;
  }

  Future<void> _handleLogin() async {
    // Si el formulario no es válido (validator regresa un error),
    // no seguimos y se muestran los mensajes debajo de cada campo.
    final formularioValido = _formKey.currentState?.validate() ?? false;
    if (!formularioValido) {
      return;
    }

    setState(() => _isLoading = true);
    try {
      await widget.onLogin(_emailController.text.trim(), _passwordController.text);
    } finally {
      if (mounted) setState(() => _isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.fromLTRB(24, 28, 24, 24),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(28),
          topRight: Radius.circular(28),
        ),
      ),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              'Accede a tu cuenta de\nFerretería Don Toño',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Color(0xFF222222),
              ),
            ),
            const SizedBox(height: 24),
            CustomTextField(
              controller: _emailController,
              hintText: 'Correo Electrónico',
              prefixIcon: Icons.email_outlined,
              keyboardType: TextInputType.emailAddress,
              validator: _validarCorreo,
            ),
            const SizedBox(height: 16),
            CustomTextField(
              controller: _passwordController,
              hintText: 'Contraseña',
              prefixIcon: Icons.lock_outline,
              obscureText: _obscurePassword,
              validator: _validarContrasena,
              suffixIcon: IconButton(
                icon: Icon(
                  _obscurePassword
                      ? Icons.visibility_off_outlined
                      : Icons.visibility_outlined,
                  color: Colors.grey[600],
                ),
                onPressed: () {
                  setState(() => _obscurePassword = !_obscurePassword);
                },
              ),
            ),
            const SizedBox(height: 24),
            CustomButton(
              text: 'Iniciar sesión',
              isLoading: _isLoading,
              onPressed: _handleLogin,
             backgroundColor: const Color.fromARGB(255, 30, 30, 255), // Azul brillante
            ),
            const SizedBox(height: 16),
            Center(
              child: TextButton(
                onPressed: () {
                },
                child: const Text(
                  'Olvidé mi contraseña',
                  style: TextStyle(color: Color(0xFF888888)),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}