// lib/screens/chat_screen.dart

import 'package:flutter/material.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Chat 24h'),
        backgroundColor: Colors.blueGrey,
      ),
      body: Column(
        children: [
          // Expande o ListView para ocupar a maior parte do espaço disponível
          Expanded(
            child: ListView.builder(
              itemCount: 20, // Número simulado de mensagens para o exemplo
              itemBuilder: (context, index) {
                // Define o estilo de mensagem com base no remetente (cliente ou suporte)
                return ListTile(
                  title: Text(
                    index % 2 == 0 ? 'Mensagem do Cliente' : 'Resposta do Suporte',
                    style: TextStyle(
                      color: index % 2 == 0 ? Colors.black : Colors.blueGrey,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  subtitle: Text('Conteúdo da mensagem $index'), // Conteúdo da mensagem simulada
                );
              },
            ),
          ),
          // Campo de entrada de mensagem com botão de enviar
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Escreva sua mensagem...', // Placeholder para o campo de entrada
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      filled: true,
                      fillColor: Colors.blueGrey.shade50,
                    ),
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.send, color: Colors.blueGrey),
                  onPressed: () {
                    // Adicione aqui a lógica para enviar mensagens
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
