// lib/screens/motoristas_screen.dart

import 'package:flutter/material.dart';
import 'detalhes_motorista_screen.dart';

class MotoristasScreen extends StatelessWidget {
  const MotoristasScreen({super.key});

  // Função que abre a tela de detalhes do motorista com as informações fornecidas
  void _openDriverDetails(BuildContext context, String driverName, String contact, String experience) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => DetalhesMotoristaScreen(
          driverName: driverName,
          contact: contact,
          experience: experience,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Motoristas Disponíveis',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.blueGrey.shade800, // Define a cor de fundo do AppBar
        elevation: 0,
      ),
      body: Container(
        // Define um fundo com um gradiente
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.blueGrey.shade700, Colors.blueGrey.shade300],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: ListView(
          padding: const EdgeInsets.all(16.0), // Espaçamento interno para a lista de motoristas
          children: [
            // Cartão de apresentação do primeiro motorista
            Card(
              margin: const EdgeInsets.symmetric(vertical: 10.0),
              elevation: 6,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
              color: Colors.white.withOpacity(0.9),
              child: ListTile(
                leading: const CircleAvatar(
                  radius: 30,
                  backgroundImage: AssetImage('assets/driver1.jpg'), // Imagem do motorista
                ),
                title: const Text(
                  'João Deusdado',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                subtitle: const Text(
                  '5 anos de experiência • Avaliação: 4.8',
                  style: TextStyle(color: Colors.grey),
                ),
                trailing: Icon(Icons.arrow_forward_ios, color: Colors.blueGrey.shade600), // Ícone de seta à direita
                onTap: () => _openDriverDetails(context, 'João Deusdado', '+351 912 456 789', '5 anos de experiência'), // Abre a tela de detalhes
              ),
            ),
            // Cartão de apresentação do segundo motorista
            Card(
              margin: const EdgeInsets.symmetric(vertical: 10.0),
              elevation: 6,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
              color: Colors.white.withOpacity(0.9),
              child: ListTile(
                leading: const CircleAvatar(
                  radius: 30,
                  backgroundImage: AssetImage('assets/driver2.jpg'), // Imagem do motorista
                ),
                title: const Text(
                  'Joana Cuca',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                subtitle: const Text(
                  '3 anos de experiência • Avaliação: 4.6',
                  style: TextStyle(color: Colors.grey),
                ),
                trailing: Icon(Icons.arrow_forward_ios, color: Colors.blueGrey.shade600), // Ícone de seta à direita
                onTap: () => _openDriverDetails(context, 'Joana Cuca', '+351 927 654 321', '3 anos de experiência'), // Abre a tela de detalhes
              ),
            ),
          ],
        ),
      ),
    );
  }
}
