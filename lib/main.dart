import 'package:flutter/material.dart';

void main() {
  runApp(const AppCinepolis());
}

class AppCinepolis extends StatelessWidget {
  const AppCinepolis({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cinepolis Valtierra',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const MembresiaScreen(),
    );
  }
}

class MembresiaScreen extends StatefulWidget {
  const MembresiaScreen({super.key});

  @override
  State<MembresiaScreen> createState() => _MembresiaScreenState();
}

class _MembresiaScreenState extends State<MembresiaScreen> {
  final TextEditingController _nombreController = TextEditingController();
  String? _selectedMembresia;
  
  final List<String> _tiposMembresia = [
    'Fan',
    'Fanático',
    'Superfanático',
    'Tradicional',
    'Permanente',
    'No tengo membresia'
  ];

  @override
  Widget build(BuildContext context) {
    // Determine if the name field should be enabled
    final bool isNombreEnabled = _selectedMembresia != 'No tengo membresia';

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.blue.shade900,
        elevation: 0,
        title: const Text(
          'CINEPOLIS VALTIERRA',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            
            // Título principal
            const Center(
              child: Text(
                '¿Tienes membresía?\n¡Registrala!',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
            ),
            
            const SizedBox(height: 30),
            
            // Campo de nombre titular
            const Text(
              'Nombre titular',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 8),
            TextField(
              controller: _nombreController,
              enabled: isNombreEnabled,
              decoration: InputDecoration(
                hintText: 'Ingrese nombre del titular',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide(color: Colors.grey.shade300),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide(color: Colors.grey.shade300),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide(color: Colors.blue.shade900, width: 2),
                ),
                filled: true,
                fillColor: !isNombreEnabled ? Colors.grey.shade100 : Colors.white,
              ),
            ),
            
            const SizedBox(height: 20),
            
            // Tipos de membresía
            const Text(
              'Tipo de membresía',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 8),
            
            // Lista de membresías con radio buttons
            Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey.shade300),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Column(
                children: _tiposMembresia.map((tipo) {
                  return RadioListTile<String>(
                    title: Text(tipo),
                    value: tipo,
                    groupValue: _selectedMembresia,
                    onChanged: (value) {
                      setState(() {
                        _selectedMembresia = value;
                        if (_selectedMembresia == 'No tengo membresia') {
                          _nombreController.clear();
                        }
                      });
                    },
                    activeColor: Colors.blue.shade900,
                    controlAffinity: ListTileControlAffinity.trailing, // Changed to trailing
                  );
                }).toList(),
              ),
            ),
            
            const SizedBox(height: 30),
            
            // Botón Siguiente
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  // Aquí puedes agregar la lógica para el botón siguiente
                  // Por ahora solo muestra un mensaje
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Funcionalidad en desarrollo'),
                      duration: Duration(seconds: 2),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue.shade900,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: const Text(
                  'Siguiente',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _nombreController.dispose();
    super.dispose();
  }
}
