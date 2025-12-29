import 'package:flutter/material.dart';
import '../../core/app_theme.dart';

class TimeManagementScreen extends StatefulWidget {
  const TimeManagementScreen({super.key});

  @override
  State<TimeManagementScreen> createState() => _TimeManagementScreenState();
}

class _TimeManagementScreenState extends State<TimeManagementScreen> {
  // Simulación de turnos creados
  List<String> activeSlots = ["09:00 AM", "10:00 AM", "11:30 AM", "02:00 PM"];

  void _addTimeSlot() async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    if (picked != null) {
      setState(() {
        activeSlots.add(picked.format(context));
        activeSlots.sort(); // Mantiene las horas ordenadas
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Gestionar Horarios"), backgroundColor: Colors.transparent),
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppTheme.accentGradientStart,
        onPressed: _addTimeSlot,
        child: const Icon(Icons.add, color: Colors.white),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            const Text("Toca para eliminar un turno o usa el (+) para añadir nuevos bloques disponibles.",
                style: TextStyle(color: Colors.white54)),
            const SizedBox(height: 20),
            Expanded(
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3, 
                  childAspectRatio: 2,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                ),
                itemCount: activeSlots.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onLongPress: () => setState(() => activeSlots.removeAt(index)),
                    child: Container(
                      decoration: BoxDecoration(
                        color: AppTheme.surface,
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: AppTheme.accentGradientStart.withOpacity(0.5)),
                      ),
                      child: Center(
                        child: Text(activeSlots[index], style: const TextStyle(fontWeight: FontWeight.bold)),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}