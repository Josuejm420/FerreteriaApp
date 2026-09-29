import 'package:flutter/material.dart';
import 'app.colors.dart';

class AppDrawer extends StatelessWidget{
    const AppDrawer({super.key});

    @override
  Widget build(BuildContext context) {
    return Drawer(
        backgroundColor: AppColors.azul,
        child: SafeArea(
            child: Column(
                children: [
                    //Encabezado en el logo/ ferreteria don toño
                    const DrawerHeader(
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                                Icon(Icons.home_repair_service, color: Colors.white, size: 40),
                                SizedBox(height: 8),
                                Text(
                                    'Ferreteria\nDon Toño',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                    ),
                                ),
                            ],
                        ),
                    ),

                    _DrawerItem(
                        icono: Icons.dashboard,
                        titulo: 'Inicio (Dashboard)',
                        onTap: () {
                            Navigator.pop(context); // cierra el drawer primero
                            Navigator.pushNamed(context, '/dashboard');
                        },
                    ),
                    _DrawerItem(
                        icono: Icons.inventory_2,
                        titulo: 'Inventario',
                        onTap: () {
                            Navigator.pop(context);
                            Navigator.pushNamed(context, '/inventario');
                        },
                    ),
                    _DrawerItem(
                        icono: Icons.build_circle,
                        titulo: 'Mantenimiento (Logistica)',
                        onTap: () {
                            Navigator.pop(context);
                            Navigator.pushNamed(context, '/mantenimiento');
                        },
                    ),
                    _DrawerItem(
                        icono: Icons.local_shipping,
                        titulo: 'Proveedores',
                        onTap: () {
                            Navigator.pop(context);
                            Navigator.pushNamed(context, '/proveedores');
                        },
                    ),
                    _DrawerItem(
                        icono: Icons.insert_chart,
                        titulo: 'Reportes',
                        onTap: () {
                            Navigator.pop(context);
                            Navigator.pushNamed(context, '/reportes');
                        },
                    ), 
                    _DrawerItem(
                        icono: Icons.people_alt,
                        titulo: 'Gestión de Usuarios',
                        onTap: () {
                            Navigator.pop(context);
                            Navigator.pushNamed(context, '/usuarios');
                        },
                    ),
                    _DrawerItem(
                        icono: Icons.settings,
                        titulo: 'Configuración del Sistema',
                        onTap: () {
                            Navigator.pop(context);
                            Navigator.pushNamed(context, '/configuracion');
                        },
                    ),
                    _DrawerItem(
                        icono: Icons.fact_check,
                        titulo: 'Auditoría Interna',
                        onTap: () {
                            Navigator.pop(context);
                            Navigator.pushNamed(context, '/auditoria');
                        },
                    ),

                    const Spacer(), // empuja el buton de cerrar sesion 

                    Padding(
                        padding: const EdgeInsets.all(16),
                        child: SizedBox(
                            width: double.infinity,
                            child: OutlinedButton(
                                style: OutlinedButton.styleFrom(
                                   foregroundColor: Colors.white,
                                   side: const BorderSide(color: Colors.white),
                                ),
                                onPressed: () {
                                    Navigator.pop(context);
                                    // conectando al layoud real, ejemplo volver al login
                                    ScaffoldMessenger.of(context).showSnackBar(const 
                                    SnackBar(content: Text('Cerrando Sesion..')),
                                    );
                                },
                                child: const Text('Cerrar Sesion'),
                            ),
                        ),
                    ),
                ],
            ),
        ),
    ); 
  }
}

class _DrawerItem extends StatelessWidget{
    final IconData icono;
    final String titulo;
    final VoidCallback onTap;

    const _DrawerItem({
         required this.icono,
         required this.titulo,
         required this.onTap,
    });

    @override
    Widget build(BuildContext context){
        return ListTile(
            leading: Icon(icono, color: Colors.white70),
            title: Text(titulo, style: const TextStyle(color: Colors.white)),
            onTap: onTap,
        );
    }
}
