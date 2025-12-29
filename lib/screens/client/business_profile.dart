import 'package:flutter/material.dart';
import '../../core/app_theme.dart';

class BusinessProfile extends StatelessWidget {
  final String businessType; // 'Barbero' o 'Tatuador'

  const BusinessProfile({super.key, required this.businessType});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.transparent, elevation: 0),
      body: Column(
        children: [
          // Header del Negocio
          const CircleAvatar(radius: 50, backgroundColor: AppTheme.surface, child: Icon(Icons.person, size: 50, color: Colors.white)),
          const SizedBox(height: 15),
          const Text("Barbería El Yonki", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
          const Text("La Habana, Cuba", style: TextStyle(color: Colors.white54)),
          
          const SizedBox(height: 30),

          // Sección de Portafolio o Precios
          Expanded(
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              decoration: const BoxDecoration(
                color: AppTheme.surface,
                borderRadius: BorderRadius.only(topLeft: Radius.circular(40), topRight: Radius.circular(40)),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    businessType == 'Tatuador' ? "Portafolio" : "Lista de Precios",
                    style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 15),
                  Expanded(
                    child: businessType == 'Tatuador' ? _buildPortfolio() : _buildPriceList(),
                  ),
                  
                  // Botón de Reservar con Degradado
                  GestureDetector(
                    onTap: () => print("Ir a calendario"),
                    child: Container(
                      width: double.infinity,
                      padding: const EdgeInsets.symmetric(vertical: 18),
                      decoration: AppTheme.darkGradient.copyWith(borderRadius: BorderRadius.circular(20)),
                      child: const Center(child: Text("RESERVAR TURNO", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16))),
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildPortfolio() {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, crossAxisSpacing: 10, mainAxisSpacing: 10),
      itemCount: 4,
      itemBuilder: (context, index) => Container(
        decoration: BoxDecoration(color: Colors.white10, borderRadius: BorderRadius.circular(15)),
        child: const Icon(Icons.image, color: Colors.white24),
      ),
    );
  }

  Widget _buildPriceList() {
    final services = [
      {'name': 'Corte Clásico', 'price': '500 CUP'},
      {'name': 'Barba', 'price': '300 CUP'},
      {'name': 'Corte + Barba', 'price': '700 CUP'},
    ];
    return ListView.builder(
      itemCount: services.length,
      itemBuilder: (context, index) => ListTile(
        title: Text(services[index]['name']!),
        trailing: Text(services[index]['price']!, style: const TextStyle(color: AppTheme.accentGradientStart, fontWeight: FontWeight.bold)),
      ),
    );
  }
}