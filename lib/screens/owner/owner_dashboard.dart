import 'package:flutter/material.dart';
import '../../core/app_theme.dart';
import 'time_management.dart'; // Asegúrate de que este archivo exista

class OwnerDashboard extends StatefulWidget {
  const OwnerDashboard({super.key});

  @override
  State<OwnerDashboard> createState() => _OwnerDashboardState();
}

class _OwnerDashboardState extends State<OwnerDashboard> {
  int _selectedIndex = 0;

  // Aquí es donde estaban los errores. Ahora las clases existen abajo.
  final List<Widget> _screens = [
    const OwnerHomeScreen(),      
    const TimeManagementScreen(),  // Esta clase debe estar en time_management.dart
    const OwnerProfileScreen(),    // Esta clase la definimos abajo
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        backgroundColor: AppTheme.surface,
        selectedItemColor: AppTheme.accentGradientStart,
        unselectedItemColor: Colors.white24,
        onTap: (index) => setState(() => _selectedIndex = index),
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.analytics), label: 'Resumen'),
          BottomNavigationBarItem(icon: Icon(Icons.history_toggle_off), label: 'Horarios'),
          BottomNavigationBarItem(icon: Icon(Icons.storefront), label: 'Mi Perfil'),
        ],
      ),
    );
  }
}

// --- PANTALLA 1: RESUMEN ---
class OwnerHomeScreen extends StatelessWidget {
  const OwnerHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: Text("Panel de Resumen e Ingresos")),
    );
  }
}

// --- PANTALLA 3: MI PERFIL (La que faltaba) ---
class OwnerProfileScreen extends StatelessWidget {
  const OwnerProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Mi Perfil de Negocio"), backgroundColor: Colors.transparent),
      body: const Center(
        child: Text("Aquí el dueño editará sus precios o fotos"),
      ),
    );
  }
}