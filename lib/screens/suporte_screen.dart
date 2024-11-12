// lib/screens/suporte_screen.dart

import 'package:flutter/material.dart';
import 'chat_screen.dart';

class SuporteScreen extends StatelessWidget {
  const SuporteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Suporte ao Cliente',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.blueGrey.shade800, // Cor de fundo do AppBar
        elevation: 0, // Remove a sombra do AppBar
      ),
      body: Container(
        // Fundo gradiente do ecrã
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
              // Título principal do ecrã
              const Text(
                'Estamos aqui para ajudar!',
                style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 20),
              // Texto explicativo
              const Text(
                'Para qualquer dúvida ou problema, entre em contacto connosco:',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.white70,
                ),
              ),
              const SizedBox(height: 20),
              // Contacto por email
              const ListTile(
                leading: Icon(Icons.email, color: Colors.tealAccent, size: 30),
                title: Text(
                  'Email: suporte@rodaantiga.com',
                  style: TextStyle(color: Colors.white70, fontSize: 16),
                ),
              ),
              // Contacto por telefone
              const ListTile(
                leading: Icon(Icons.phone, color: Colors.tealAccent, size: 30),
                title: Text(
                  'Telefone: +351 923 456 789',
                  style: TextStyle(color: Colors.white70, fontSize: 16),
                ),
              ),
              // Informação sobre a disponibilidade do chat
              const ListTile(
                leading: Icon(Icons.chat, color: Colors.tealAccent, size: 30),
                title: Text(
                  'Chat disponível 24h',
                  style: TextStyle(color: Colors.white70, fontSize: 16),
                ),
              ),
              const SizedBox(height: 30),
              // Botão para iniciar o chat 24h
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const ChatScreen()), // Navegação para o ecrã de chat
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.tealAccent.shade700,
                    padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                  ),
                  child: const Text(
                    'Iniciar Chat 24h',
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
