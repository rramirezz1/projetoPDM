// lib/screens/add_car_screen.dart

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import '../helpers/database_helper.dart';
import 'dart:io';

class AddCarScreen extends StatefulWidget {
  final bool isAdmin;

  // Construtor que recebe a permissão de administrador
  const AddCarScreen({super.key, required this.isAdmin});

  @override
  // ignore: library_private_types_in_public_api
  _AddCarScreenState createState() => _AddCarScreenState();
}

class _AddCarScreenState extends State<AddCarScreen> {
  // Controladores para os campos de entrada do formulário
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _modelController = TextEditingController();
  final TextEditingController _yearController = TextEditingController();
  final TextEditingController _priceController = TextEditingController();

  // Instância do DatabaseHelper para interagir com a base de dados
  final DatabaseHelper _dbHelper = DatabaseHelper();

  // Lista para armazenar as imagens selecionadas
  List<File> _selectedImages = [];

  // Função para selecionar múltiplas imagens usando a biblioteca image_picker
  Future<void> _pickImage() async {
    final picker = ImagePicker();
    final pickedFiles = await picker.pickMultiImage();

    if (pickedFiles.isNotEmpty) {
      // Atualiza a lista de imagens com as selecionadas
      setState(() {
        _selectedImages = pickedFiles.map((pickedFile) => File(pickedFile.path)).toList();
      });
    }
  }

  // Função para adicionar um novo carro à base de dados
  void _addCar() async {
    String name = _nameController.text;
    String model = _modelController.text;
    int year = int.tryParse(_yearController.text) ?? 0;
    double price = double.tryParse(_priceController.text) ?? 0.0;

    // Verifica se todos os campos estão preenchidos corretamente
    if (name.isNotEmpty && model.isNotEmpty && year > 0 && price > 0) {
      await _dbHelper.addCar(name, model, year, price);
      // ignore: use_build_context_synchronously
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Carro adicionado com sucesso!')),
      );
      // ignore: use_build_context_synchronously
      Navigator.pop(context); // Volta para a página anterior após adicionar
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Preencha todos os campos corretamente.')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    // Verificação de permissão: apenas administradores podem adicionar carros
    if (!widget.isAdmin) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Acesso Negado'),
          backgroundColor: Colors.blueGrey,
        ),
        body: const Center(
          child: Text(
            'Você não tem permissão para acessar esta tela.',
            style: TextStyle(fontSize: 18, color: Colors.redAccent),
            textAlign: TextAlign.center,
          ),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Adicionar Carro'),
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
            children: [
              // Campo de entrada para o nome do carro
              TextField(
                controller: _nameController,
                decoration: InputDecoration(
                  labelText: 'Nome do carro',
                  labelStyle: const TextStyle(color: Colors.white70),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  filled: true,
                  fillColor: Colors.white.withOpacity(0.1),
                ),
              ),
              const SizedBox(height: 10),

              // Campo de entrada para o modelo do carro
              TextField(
                controller: _modelController,
                decoration: InputDecoration(
                  labelText: 'Modelo',
                  labelStyle: const TextStyle(color: Colors.white70),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  filled: true,
                  fillColor: Colors.white.withOpacity(0.1),
                ),
              ),
              const SizedBox(height: 10),

              // Campo de entrada para o ano do carro
              TextField(
                controller: _yearController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: 'Ano',
                  labelStyle: const TextStyle(color: Colors.white70),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  filled: true,
                  fillColor: Colors.white.withOpacity(0.1),
                ),
              ),
              const SizedBox(height: 10),

              // Campo de entrada para o preço do carro por dia
              TextField(
                controller: _priceController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: 'Preço por dia (€)',
                  labelStyle: const TextStyle(color: Colors.white70),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  filled: true,
                  fillColor: Colors.white.withOpacity(0.1),
                ),
              ),
              const SizedBox(height: 20),

              // Botão para selecionar imagens do carro
              ElevatedButton(
                onPressed: _pickImage,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.teal.shade700,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                ),
                child: const Text('Adicionar Imagem(s)'),
              ),
              const SizedBox(height: 10),

              // Visualização das imagens selecionadas
              Wrap(
                spacing: 10,
                runSpacing: 10,
                children: _selectedImages
                    .map((image) => ClipRRect(
                          borderRadius: BorderRadius.circular(8.0),
                          child: Image.file(
                            image,
                            width: 100,
                            height: 100,
                            fit: BoxFit.cover,
                          ),
                        ))
                    .toList(),
              ),
              const SizedBox(height: 20),

              // Botão para confirmar e adicionar o carro à base de dados
              ElevatedButton(
                onPressed: _addCar,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.tealAccent.shade700,
                  padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                ),
                child: const Text('Adicionar Carro', style: TextStyle(fontSize: 16)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
