// lib/screens/detalhes_motorista_screen.dart

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DetalhesMotoristaScreen extends StatefulWidget {
  final String driverName; // Nome do motorista selecionado
  final String contact; // Informação de contato do motorista
  final String experience; // Experiência do motorista

  const DetalhesMotoristaScreen({
    super.key,
    required this.driverName,
    required this.contact,
    required this.experience,
  });

  @override
  // ignore: library_private_types_in_public_api
  _DetalhesMotoristaScreenState createState() => _DetalhesMotoristaScreenState();
}

class _DetalhesMotoristaScreenState extends State<DetalhesMotoristaScreen> {
  // Controladores para os campos de data de reserva e informações adicionais
  final TextEditingController _dataController = TextEditingController();
  final TextEditingController _additionalInfoController = TextEditingController();

  // Função para selecionar a data de reserva
  Future<void> _selectDate(BuildContext context) async {
    DateTime? selectedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2030),
    );
    if (selectedDate != null) {
      _dataController.text = DateFormat('dd/MM/yyyy').format(selectedDate);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.driverName), // Exibe o nome do motorista no título
        backgroundColor: Colors.blueGrey.shade800,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.blueGrey.shade700, Colors.blueGrey.shade300],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Exibe o nome do motorista e a sua experiência
              Text(
                widget.driverName,
                style: const TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 8.0),
              Text(
                widget.experience,
                style: const TextStyle(
                  fontSize: 16,
                  color: Colors.white70,
                ),
              ),
              const SizedBox(height: 16.0),
              // Informações de contato do motorista
              ListTile(
                contentPadding: EdgeInsets.zero,
                leading: const Icon(Icons.phone, color: Colors.tealAccent, size: 30),
                title: Text(
                  widget.contact,
                  style: const TextStyle(color: Colors.white70, fontSize: 16),
                ),
                subtitle: const Text('Contacto', style: TextStyle(color: Colors.white54)),
                onTap: () {
                  // Lógica para abrir o contacto, caso necessário
                },
              ),
              const SizedBox(height: 20.0),
              // Campo de seleção da data de reserva
              TextField(
                controller: _dataController,
                readOnly: true,
                onTap: () => _selectDate(context),
                decoration: InputDecoration(
                  labelText: 'Dia de Reserva',
                  labelStyle: const TextStyle(color: Colors.white70),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  filled: true,
                  fillColor: Colors.white.withOpacity(0.1),
                  suffixIcon: const Icon(Icons.calendar_today, color: Colors.tealAccent),
                ),
              ),
              const SizedBox(height: 16.0),
              // Campo para informações adicionais do utilizador
              TextField(
                controller: _additionalInfoController,
                decoration: InputDecoration(
                  labelText: 'Informações Adicionais',
                  labelStyle: const TextStyle(color: Colors.white70),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  filled: true,
                  fillColor: Colors.white.withOpacity(0.1),
                ),
              ),
              const SizedBox(height: 20.0),
              // Botão para confirmar a reserva
              Center(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                    backgroundColor: Colors.tealAccent.shade700,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                  ),
                  onPressed: () {
                    final String data = _dataController.text;
                    // ignore: unused_local_variable
                    final String info = _additionalInfoController.text;

                    if (data.isNotEmpty) {
                      // Exibe uma mensagem de sucesso caso a data esteja preenchida
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Reserva realizada com sucesso!')),
                      );
                      Navigator.pop(context); // Retorna à página anterior
                    } else {
                      // Exibe uma mensagem de erro caso a data não esteja preenchida
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Por favor, selecione uma data.')),
                      );
                    }
                  },
                  child: const Text(
                    'Confirmar Reserva',
                    style: TextStyle(fontSize: 16, color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
