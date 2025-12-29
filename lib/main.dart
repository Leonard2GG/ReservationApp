import 'package:flutter/material.dart';
import 'core/app_theme.dart';
//import 'screens/client/search_screen.dart';
import 'screens/owner/owner_dashboard.dart'; 

void main() {
  runApp(const ReservationApp());
}

class ReservationApp extends StatelessWidget {
  const ReservationApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ReservationApp',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.darkTheme,
      // La pantalla inicial ahora permite navegar
      home: const MainEntryScreen(), 
    );
  }
}

class MainEntryScreen extends StatelessWidget {
  const MainEntryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(color: AppTheme.background),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.calendar_today, size: 80, color: AppTheme.accentGradientStart),
            const SizedBox(height: 20),
            const Text("ReservationApp", 
              style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold, color: Colors.white)),
            const SizedBox(height: 10),
            const Text("Tu turno a un click", style: TextStyle(color: Colors.white54)),
            const SizedBox(height: 50),
            
            // BOTÓN CON FUNCIÓN DE NAVEGACIÓN
            GestureDetector(
              onTap: () {
  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => const OwnerDashboard()), // Cambiado para prueba
  );
},
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                decoration: AppTheme.darkGradient.copyWith(
                  borderRadius: BorderRadius.circular(30),
                  boxShadow: [
                    BoxShadow(
                      color: AppTheme.accentGradientStart.withOpacity(0.3),
                      blurRadius: 10,
                      offset: const Offset(0, 5),
                    )
                  ],
                ),
                child: const Text("ENTRAR A BUSCAR", 
                  style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}