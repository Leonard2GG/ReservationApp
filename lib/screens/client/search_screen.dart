import 'package:flutter/material.dart';
import '../../core/app_theme.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController _codeController = TextEditingController();

  final List<Map<String, String>> recentBusinesses = [
    {'name': 'Barbería El Yonki', 'code': 'BY01', 'type': 'Barbero'},
    {'name': 'Ink Master Cuba', 'code': 'IM05', 'type': 'Tatuador'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 30),
              const Text("Buscar Negocio", style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold)),
              const SizedBox(height: 20),
              TextField(
                controller: _codeController,
                decoration: InputDecoration(
                  hintText: "Introduce el código",
                  filled: true,
                  fillColor: AppTheme.surface,
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(15), borderSide: BorderSide.none),
                  suffixIcon: IconButton(
                    icon: const Icon(Icons.search, color: AppTheme.accentGradientStart),
                    onPressed: () {},
                  ),
                ),
              ),
              const SizedBox(height: 40),
              const Text("Recientes", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              const SizedBox(height: 15),
              Expanded(
                child: ListView.builder(
                  itemCount: recentBusinesses.length,
                  itemBuilder: (context, index) {
                    final item = recentBusinesses[index];
                    return Card(
                      color: AppTheme.surface,
                      margin: const EdgeInsets.only(bottom: 15),
                      child: ListTile(
                        leading: Icon(item['type'] == 'Barbero' ? Icons.cut : Icons.brush, color: AppTheme.accentGradientStart),
                        title: Text(item['name']!),
                        subtitle: Text("Código: ${item['code']}"),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => BusinessProfile(businessType: item['type']!, name: item['name']!),
                            ),
                          );
                        },
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class BusinessProfile extends StatelessWidget {
  final String businessType;
  final String name;

  const BusinessProfile({super.key, required this.businessType, required this.name});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(name), backgroundColor: Colors.transparent),
      body: Column(
        children: [
          const SizedBox(height: 20),
          const CircleAvatar(radius: 50, backgroundColor: AppTheme.surface, child: Icon(Icons.person, size: 50)),
          const SizedBox(height: 30),
          Expanded(
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              decoration: const BoxDecoration(
                color: AppTheme.surface,
                borderRadius: BorderRadius.only(topLeft: Radius.circular(30), topRight: Radius.circular(30)),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(businessType == 'Tatuador' ? "Portafolio" : "Precios", 
                    style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 15),
                  Expanded(
                    child: businessType == 'Tatuador' ? _buildPortfolio() : _buildPriceList(),
                  ),
                  const SizedBox(height: 10),
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(vertical: 15),
                    decoration: AppTheme.darkGradient.copyWith(borderRadius: BorderRadius.circular(15)),
                    child: const Center(child: Text("RESERVAR TURNO", style: TextStyle(fontWeight: FontWeight.bold))),
                  ),
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
      itemBuilder: (context, index) => Container(color: Colors.white10, child: const Icon(Icons.image)),
    );
  }

  Widget _buildPriceList() {
    final prices = [ {'n': 'Corte', 'p': '500'}, {'n': 'Barba', 'p': '300'} ];
    return ListView.builder(
      itemCount: prices.length,
      itemBuilder: (context, index) => ListTile(
        title: Text(prices[index]['n']!),
        trailing: Text("${prices[index]['p']!} CUP", style: const TextStyle(color: AppTheme.accentGradientStart)),
      ),
    );
  }
}