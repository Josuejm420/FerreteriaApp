import 'package:flutter/material.dart';
import 'widget/app.colors.dart';
import 'widget/menu.item.card.dart';
import 'widget/search_form_widget.com.dart';
import 'widget/app_drawer.dart';

// Pantalla principal del home 
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.fondo,
      drawer: const AppDrawer(), // menu lateral izquierdo
      appBar: AppBar(
        backgroundColor: AppColors.azul,
        elevation: 0,
        title: const Text(
          'Ferreteria Don Toño',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
          
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications_none),
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('No tienes notificaciones nuevas'),                  
                ),
              );
            }
          ),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Hola, Bienvenido de Nueva',
                 style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: AppColors.texto,
                 ),
              ),
              const SizedBox(height: 4),
              const Text(
               'Aqui puedes administrar tu Ferreteria',
               style: TextStyle(color: AppColors.gris),
              ),
              const SizedBox(height: 16),
              // Formulario de busqueda con su propia gestion de eventos 
              const SearchFormWidget(),
              const SizedBox(height: 24),
              const Text(
               'Panel de Administracion',
               style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: AppColors.texto,                                                         
               ),
              ),
              const SizedBox(height: 12),

              //grid donde vamos ubicar las 6 opciones administrativa
              // cada tarjeta nueva se rejidira a una ruta nombrada 
              Expanded(
                child: GridView.count(
                  crossAxisCount: 2,
                  mainAxisSpacing: 14,
                  crossAxisSpacing: 14,
                  children: [
                    MenuItemCard(
                      icono: Icons.dashboard,
                      titulo: 'Dashboard',
                      onTap: () => Navigator.pushNamed(context, '/dashboard'),
                    ),
                    MenuItemCard(
                      icono: Icons.people_alt,
                      titulo: 'Clientes',
                      onTap: () => Navigator.pushNamed(context, '/cliente'),
                    ),
                    MenuItemCard(
                      icono: Icons.inventory_2, 
                      titulo: 'Inventario', 
                      onTap: () => Navigator.pushNamed(context, '/inventario')
                    ),
                    /*MenuItemCard(
                      icono: Icons.receipt_long,
                      titulo: 'Facturacion',
                      onTap: () => Navigator.pushNamed(context, '/facturacion'), 
                    ),*/
                    MenuItemCard(
                      icono: Icons.insert_chart, 
                      titulo: 'Reportes', 
                      onTap: () => Navigator.pushNamed(context, '/reportes'),
                    ),
                    MenuItemCard(
                      icono: Icons.local_shipping, 
                      titulo: 'Proveedores', 
                      onTap: () => Navigator.pushNamed(context, '/proveedores'),
                    )
                  ],

                ),
              ),
            ],
          ),
        )
      ),
    );
  }
}