// lib/main.dart

import 'package:flutter/material.dart';
import 'screens/login_screen.dart';
import 'screens/register_screen.dart';

void main() {
  runApp(const MyApp()); // Ponto de entrada principal da aplicação
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Car Rental App', // Título da aplicação
      theme: ThemeData(
        // Define o tema da aplicação
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true, // Ativa o uso do Material 3 para novos estilos
      ),
      initialRoute: '/login', // Rota inicial ao iniciar a aplicação
      routes: {
        // Mapear rotas para navegação
        '/login': (context) => const LoginScreen(), // Tela de login como rota inicial
        '/register': (context) => const RegisterScreen(), // Tela de registo de novos utilizadores

        // Nota: Ao adicionar novas rotas (como a tela de "explorar" com `isAdmin`),
        // será necessário passar o parâmetro `isAdmin` ao definir a navegação para essa rota.
      },
    );
  }
}
