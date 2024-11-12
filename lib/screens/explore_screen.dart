// lib/screens/explore_screen.dart

import 'package:flutter/material.dart';
import 'carros_screen.dart';
import 'motoristas_screen.dart';
import 'pontos_extra_screen.dart';
import 'suporte_screen.dart';
import 'add_car_screen.dart';
import 'user_profile_screen.dart'; // Importa a tela de perfil do utilizador

class ExploreScreen extends StatefulWidget {
  final bool isAdmin; // Define se o utilizador tem permissões de administrador

  const ExploreScreen({super.key, required this.isAdmin});

  @override
  // ignore: library_private_types_in_public_api
  _ExploreScreenState createState() => _ExploreScreenState();
}

class _ExploreScreenState extends State<ExploreScreen> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    // Inicializa o controlador de abas com quatro seções
    _tabController = TabController(length: 4, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose(); // Liberta o controlador quando não é mais necessário
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Roda Antiga', // Título principal da aplicação
          style: TextStyle(
            fontFamily: 'Roboto',
            fontWeight: FontWeight.bold,
            fontSize: 24,
          ),
        ),
        backgroundColor: Colors.blueGrey.shade800,
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(Icons.account_circle, color: Colors.white), // Ícone de perfil do utilizador
            onPressed: () {
              // Navega para a tela de perfil do utilizador
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const UserProfileScreen()),
              );
            },
          ),
        ],
        // Abas inferiores na AppBar para navegação
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(50.0),
          child: Container(
            color: Colors.blueGrey.shade100,
            child: TabBar(
              controller: _tabController,
              indicatorColor: Colors.white, // Cor do indicador de aba ativa
              labelColor: Colors.blueGrey.shade900, // Cor do texto da aba ativa
              unselectedLabelColor: Colors.blueGrey.shade600, // Cor do texto da aba inativa
              labelStyle: const TextStyle(
                fontFamily: 'Roboto',
                fontWeight: FontWeight.w500,
              ),
              tabs: const [
                Tab(icon: Icon(Icons.directions_car), text: 'Carros'), // Aba Carros
                Tab(icon: Icon(Icons.person), text: 'Motoristas'), // Aba Motoristas
                Tab(icon: Icon(Icons.star), text: 'Pontos Extra'), // Aba Pontos Extra
                Tab(icon: Icon(Icons.support_agent), text: 'Suporte'), // Aba Suporte
              ],
            ),
          ),
        ),
      ),
      // Corpo principal que exibe cada aba com um gradiente de fundo
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.blueGrey.shade800, Colors.blueGrey.shade400],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        // Exibe o conteúdo correspondente a cada aba
        child: TabBarView(
          controller: _tabController,
          children: const [
            CarrosScreen(),
            MotoristasScreen(),
            PontosExtraScreen(),
            SuporteScreen(),
          ],
        ),
      ),
      // Botão flutuante para adicionar um carro, visível apenas para administradores
      floatingActionButton: widget.isAdmin
          ? FloatingActionButton(
              backgroundColor: Colors.teal.shade700,
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => AddCarScreen(isAdmin: true),
                  ),
                );
              },
              child: const Icon(Icons.add), // Ícone para adicionar
            )
          : null, // Botão flutuante não é exibido para utilizadores não administradores
    );
  }
}
