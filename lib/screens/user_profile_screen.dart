// lib/screens/user_profile_screen.dart

import 'package:flutter/material.dart';

class UserProfileScreen extends StatelessWidget {
  const UserProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Perfil do Utilizador'),
        backgroundColor: Colors.blueGrey, // Define a cor do fundo do AppBar
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Foto de perfil do utilizador no centro do ecrã
            const Center(
              child: CircleAvatar(
                radius: 50,
                backgroundImage: AssetImage('assets/user_profile.jpg'), // Caminho para a imagem do utilizador
              ),
            ),
            const SizedBox(height: 20),
            // Nome do utilizador no centro do ecrã
            const Center(
              child: Text(
                'Nome do Utilizador',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 40),
            // Título para a secção das informações do utilizador
            const Text(
              'Informações do Utilizador',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            // Informação de email
            const ListTile(
              leading: Icon(Icons.email, color: Colors.blueGrey),
              title: Text('user@example.com'),
              subtitle: Text('Email'),
            ),
            // Informação de telefone
            const ListTile(
              leading: Icon(Icons.phone, color: Colors.blueGrey),
              title: Text('+351 123 456 789'),
              subtitle: Text('Telefone'),
            ),
            const SizedBox(height: 30),
            // Título para a secção dos carros alugados
            const Text(
              'Carros Alugados',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            // Cartões que representam os carros alugados pelo utilizador
            Card(
              margin: const EdgeInsets.symmetric(vertical: 8.0),
              child: ListTile(
                leading: Image.asset('assets/car1.jpg', width: 50, fit: BoxFit.cover),
                title: const Text('BMW Série 3'),
                subtitle: const Text('Alugado em 10/11/2024'),
              ),
            ),
            Card(
              margin: const EdgeInsets.symmetric(vertical: 8.0),
              child: ListTile(
                leading: Image.asset('assets/car2.jpg', width: 50, fit: BoxFit.cover),
                title: const Text('Mercedes Classe C'),
                subtitle: const Text('Alugado em 15/11/2024'),
              ),
            ),
            const SizedBox(height: 30),
            // Título para a secção dos carros disponibilizados pelo utilizador
            const Text(
              'Carros Disponibilizados para Aluguel',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            // Cartões que representam os carros disponibilizados pelo utilizador para aluguer
            Card(
              margin: const EdgeInsets.symmetric(vertical: 8.0),
              child: ListTile(
                leading: Image.asset('assets/car3.jpg', width: 50, fit: BoxFit.cover),
                title: const Text('Ford Mustang'),
                subtitle: const Text('Disponível para aluguel desde 05/11/2024'),
              ),
            ),
            Card(
              margin: const EdgeInsets.symmetric(vertical: 8.0),
              child: ListTile(
                leading: Image.asset('assets/car4.jpg', width: 50, fit: BoxFit.cover),
                title: const Text('Chevrolet Camaro'),
                subtitle: const Text('Disponível para aluguel desde 12/11/2024'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
