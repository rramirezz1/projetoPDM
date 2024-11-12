// lib/screens/pontos_extra_screen.dart

import 'package:flutter/material.dart';

class PontosExtraScreen extends StatelessWidget {
  const PontosExtraScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Pontos Extra',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.blueGrey.shade800, // Define a cor de fundo do AppBar
        elevation: 0,
      ),
      body: Container(
        // Define um fundo com gradiente para tornar a interface mais apelativa
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.blueGrey.shade700, Colors.blueGrey.shade300],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: ListView(
          padding: const EdgeInsets.all(16.0), // Define o espaçamento interno da lista
          children: [
            // Cartão para o voucher de lavagem de carro grátis
            Card(
              margin: const EdgeInsets.symmetric(vertical: 10.0),
              elevation: 6,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
              color: Colors.white.withOpacity(0.9),
              child: ListTile(
                leading: const Icon(Icons.star, color: Colors.orange, size: 36), // Ícone de estrela para destaque
                title: const Text(
                  'Voucher de Lavagem de Carro Grátis',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                subtitle: const Text(
                  'Obtenha uma lavagem de carro grátis com a sua próxima reserva',
                  style: TextStyle(color: Colors.grey),
                ),
                trailing: Icon(Icons.arrow_forward_ios, color: Colors.blueGrey.shade600), // Ícone de seta
                onTap: () {
                  // Ação ao clicar no cartão (pode adicionar uma funcionalidade)
                },
              ),
            ),
            // Cartão para o desconto de 10% na próxima reserva
            Card(
              margin: const EdgeInsets.symmetric(vertical: 10.0),
              elevation: 6,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
              color: Colors.white.withOpacity(0.9),
              child: ListTile(
                leading: const Icon(Icons.local_offer, color: Colors.green, size: 36), // Ícone de oferta para desconto
                title: const Text(
                  '10% Desconto na próxima reserva',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                subtitle: const Text(
                  'Aplique esta oferta para 10% de desconto',
                  style: TextStyle(color: Colors.grey),
                ),
                trailing: Icon(Icons.arrow_forward_ios, color: Colors.blueGrey.shade600), // Ícone de seta
                onTap: () {
                  // Ação ao clicar no cartão (pode adicionar uma funcionalidade)
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
