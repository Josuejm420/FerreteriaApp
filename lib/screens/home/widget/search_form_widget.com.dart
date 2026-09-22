import 'package:flutter/material.dart';
import 'app.colors.dart';

// Formulario de Busqueda
class SearchFormWidget extends StatefulWidget {
  const SearchFormWidget({super.key});

  @override
  State<SearchFormWidget> createState() => _SearchFormWidgetState();
}

class _SearchFormWidgetState extends State<SearchFormWidget> {
  final _formKey = GlobalKey<FormState>();
  final  _controller = TextEditingController();

    @override
    void dispose() {
      _controller.dispose();
      super.dispose();
    }

    void _buscar() {
      if (_formKey.currentState!.validate()){
        final texto = _controller.text.trim();

        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Buscando: $texto'))
        );
      }
    }

    @override
    Widget build(BuildContext context) {
      return Form(
        key: _formKey,
        child: TextFormField(
          controller: _controller,
          textInputAction: TextInputAction.search,
          onFieldSubmitted: (_) => _buscar(),
          validator: (valor) {
             if (valor == null || valor.trim().isEmpty) {
               return 'Escribe algo para buscar';
             }
             return null;
          },
          decoration: InputDecoration(
            hintText: 'Buscar producto, ordenes, proveedores..',
            filled: true,
            fillColor: Colors.white,
            prefixIcon: const Icon(Icons.search, color: AppColors.gris),
            suffixIcon: IconButton(
              icon: const Icon(Icons.tune, color: AppColors.azul,),
              onPressed: _buscar,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide: BorderSide.none,
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide: const BorderSide(color: Colors.redAccent),
            )
          ),
        ), 
      );
    }
}