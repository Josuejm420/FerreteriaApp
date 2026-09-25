import 'package:flutter/material.dart';
void main() {
  runApp(const AddProductScreen());
}
class AddProductScreen extends StatefulWidget {
  const AddProductScreen({super.key});
  @override
  State<AddProductScreen> createState() => _AddProductScreenState();
}

class _AddProductScreenState extends State<AddProductScreen> {
  // Lista sencilla para el desplegable de categoría
  String categoriaSeleccionada = 'Herramientas manuales';
  final List<String> categorias = [
    'Herramientas manuales',
    'Herramientas electricas',
    'Materiales de construccion',
    'Fontaneria',
    'Electricidad',
    'Pintura y Acabados',
    'Ferreteria General',
  ];

 @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xFF0D253F),
          leading: const Icon(Icons.arrow_back, color: Colors.white),
          title: const Text(
            'Add/Edit producto',
            style: TextStyle(color: Colors.white),
          ),
        ),
        body: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            // Nombre del producto
            const Text(
              'Nombre del producto',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 6),
            const TextField(
              decoration: InputDecoration(
                hintText: 'Nombre del producto',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 15),

               // Categoria
            const Text(
              'Categoria',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 6),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(4),
              ),
              child: DropdownButtonHideUnderline(
                child: DropdownButton<String>(
                  value: categoriaSeleccionada,
                  isExpanded: true,
                  items: categorias.map((String cat) {
                    return DropdownMenuItem(
                      value: cat,
                      child: Text(cat),
                    );
                  }).toList(),
                  onChanged: (nuevoValor) {
                    setState(() {
                      categoriaSeleccionada = nuevoValor!;
                    });
                  },
                ),
              ),
            ),
            const SizedBox(height: 15),

            const Text(
              'SKU / Código Único',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 6),
            const TextField(
              decoration: InputDecoration(
                hintText: 'SKU / Código Único',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 15),
            // Costo de Compra y Precio 
            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        'Costo de Compra',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 6),
                      TextField(
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          hintText: 'C\$ 12.00',
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 15),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        'Precio Sugerido Venta',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 6),
                      TextField(
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          hintText: 'C\$ 15.00',
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 15),
            // Stock Mínimo Alerta y Stock Actual
            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        'Stock Mínimo Alerta',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 6),
                      TextField(
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          hintText: '10',
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 15),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        'Stock Actual',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 6),
                      TextField(
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          hintText: 'C\$',
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
