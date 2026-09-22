//import 'package:ferreteria_app/screens/home/widget/app.colors.dart';
import 'package:flutter/material.dart';
import 'app.colors.dart';

class PlacehoderScreen extends StatelessWidget {
 final String titulo;
  
 const PlacehoderScreen({super.key, required this.titulo});

 @override 
 Widget build(BuildContext context) {
  return Scaffold(
    backgroundColor: AppColors.fondo,
    appBar: AppBar(
       backgroundColor: AppColors.azul,
       title: Text(titulo),
    ),
    body: Center(
          child: Column(
           mainAxisAlignment: MainAxisAlignment.center,
           children: [
            const Icon(Icons.construction, size: 60, color: AppColors.gris),
            const SizedBox(height: 12),
            Text(
              '$titulo\n(En Construccion)',
               textAlign: TextAlign.center,
               style: const TextStyle(fontSize: 18, color: AppColors.texto),
            ),
           ],
        ),
    ),
  );
 }
}