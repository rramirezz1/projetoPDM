// lib/screens/carros_screen.dart

import 'package:flutter/material.dart';
import '../helpers/database_helper.dart';
import 'detalhes_carro_screen.dart';
import 'add_car_screen.dart';

class CarrosScreen extends StatefulWidget {
  const CarrosScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _CarrosScreenState createState() => _CarrosScreenState();
}

class _CarrosScreenState extends State<CarrosScreen> {
  final DatabaseHelper _dbHelper = DatabaseHelper(); // Instância do helper para interagir com a base de dados
  List<Map<String, dynamic>> _carList = []; // Lista de carros carregada da base de dados

  @override
  void initState() {
    super.initState();
    _loadCars(); // Carrega a lista de carros ao inicializar o estado
  }

  // Função para carregar os carros da base de dados ou preencher com exemplos
  void _loadCars() async {
    List<Map<String, dynamic>> cars = await _dbHelper.getCars();

    // Caso a base de dados esteja vazia, preenche com exemplos
    if (cars.isEmpty) {
      cars = [
        {
          'name': 'VW',
          'model': 'Golf',
          'year': '1979',
          'price_per_day': '100',
          'imagePath': 'assets/vw_golf.webp', // Caminho da imagem do carro
        },
        {
          'name': 'Jaguar',
          'model': 'E-Type',
          'year': '1970',
          'price_per_day': '150',
          'imagePath': 'assets/jaguar_etype.webp',
        },
        {
          'name': 'Peugeot 205',
          'model': '1.3 Rallye',
          'year': '1989',
          'price_per_day': '75',
          'imagePath': 'assets/peugeot_205.webp',
        },
        {
          'name': 'BMW',
          'model': '1600',
          'year': '1971',
          'price_per_day': '120',
          'imagePath': 'assets/bmw_1600.webp',
        },
      ];
    }

    setState(() {
      _carList = cars; // Atualiza o estado com a lista de carros
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Carros Disponíveis',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.blueGrey.shade800,
        elevation: 0,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.blueGrey.shade700, Colors.blueGrey.shade300],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: ListView.builder(
          padding: const EdgeInsets.all(16.0),
          itemCount: _carList.length, // Número total de carros na lista
          itemBuilder: (context, index) {
            final car = _carList[index]; // Dados do carro atual
            return Card(
              color: Colors.white.withOpacity(0.9),
              margin: const EdgeInsets.symmetric(vertical: 10.0),
              elevation: 6,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Imagem do carro com cantos arredondados
                  ClipRRect(
                    borderRadius: const BorderRadius.vertical(top: Radius.circular(15.0)),
                    child: Image.asset(
                      car['imagePath'], // Usa o caminho da imagem para exibir a imagem do carro
                      fit: BoxFit.cover,
                      width: double.infinity,
                      height: 180,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Nome e modelo do carro
                        Text(
                          '${car['name']} - ${car['model']}',
                          style: const TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            color: Colors.black87,
                          ),
                        ),
                        const SizedBox(height: 4),
                        // Ano do carro
                        Text(
                          'Ano: ${car['year']}',
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.grey[700],
                          ),
                        ),
                        const SizedBox(height: 8),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            // Preço por dia
                            Text(
                              '€${car['price_per_day']} por dia',
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                                color: Colors.teal,
                              ),
                            ),
                            // Botão para reservar o carro
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.teal.shade600,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                              ),
                              onPressed: () {
                                // Navega para a página de detalhes do carro ao clicar em "Reservar Agora"
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => DetalhesCarroScreen(
                                      carro: '${car['name']} - ${car['model']}',
                                      imagePath: car['imagePath'], // Passa a imagem para a tela de detalhes
                                    ),
                                  ),
                                );
                              },
                              child: const Text(
                                'Reservar Agora',
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
      // Botão para adicionar um novo carro, disponível apenas para administradores
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const AddCarScreen(isAdmin: true),
            ),
          );
        },
        // ignore: sort_child_properties_last
        child: const Icon(Icons.add),
        backgroundColor: Colors.teal.shade600,
      ),
    );
  }
}
