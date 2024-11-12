// lib/screens/detalhes_carro_screen.dart

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DetalhesCarroScreen extends StatelessWidget {
  final String carro; // Nome do carro selecionado
  final String imagePath; // Caminho da imagem do carro

  const DetalhesCarroScreen({super.key, required this.carro, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    // Controladores para o campo de email e data de reserva
    final TextEditingController emailController = TextEditingController();
    final TextEditingController dataController = TextEditingController();

    // Função para selecionar a data de reserva
    Future<void> selectDate(BuildContext context) async {
      DateTime? selectedDate = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2022),
        lastDate: DateTime(2030),
      );
      if (selectedDate != null) {
        dataController.text = DateFormat('dd/MM/yyyy').format(selectedDate);
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('$carro - Detalhes'),
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
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Imagem do carro selecionado
              ClipRRect(
                borderRadius: BorderRadius.circular(15.0),
                child: Image.asset(
                  imagePath,
                  fit: BoxFit.cover,
                  width: double.infinity,
                  height: 220,
                ),
              ),
              const SizedBox(height: 20),
              // Título da página com o nome do carro
              Text(
                'Detalhes da Reserva para $carro',
                style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                  color: Colors.blueGrey.shade800,
                ),
              ),
              Divider(height: 30, thickness: 2, color: Colors.blueGrey.shade300),
              // Campo de entrada para o email do utilizador
              TextField(
                controller: emailController,
                decoration: InputDecoration(
                  labelText: 'Email',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  filled: true,
                  fillColor: Colors.white.withOpacity(0.9),
                ),
              ),
              const SizedBox(height: 16),
              // Campo de entrada para selecionar a data de reserva
              TextField(
                controller: dataController,
                readOnly: true,
                onTap: () => selectDate(context),
                decoration: InputDecoration(
                  labelText: 'Dia(s) de Reserva',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  filled: true,
                  fillColor: Colors.white.withOpacity(0.9),
                  suffixIcon: Icon(Icons.calendar_today, color: Colors.blueGrey.shade600),
                ),
              ),
              const SizedBox(height: 20),
              // Botão para confirmar a reserva
              Center(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                    backgroundColor: Colors.teal.shade700,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                  ),
                  onPressed: () {
                    final String email = emailController.text;
                    final String data = dataController.text;

                    if (email.isNotEmpty && data.isNotEmpty) {
                      // Exibe uma mensagem de sucesso ao confirmar a reserva
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Reserva feita com sucesso para $carro!')),
                      );
                      Navigator.pop(context); // Volta para a página anterior
                    } else {
                      // Exibe uma mensagem de erro caso algum campo esteja vazio
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Por favor, preencha todos os campos.')),
                      );
                    }
                  },
                  child: const Text('Confirmar Reserva', style: TextStyle(fontSize: 16)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
