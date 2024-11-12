// lib/widgets/car_card.dart

import 'package:flutter/material.dart';

class CarCard extends StatelessWidget {
  // Declaração dos atributos do cartão de carro, como nome, localização, preço, imagem e classificação
  final String carName;
  final String location;
  final double price;
  final String imageUrl;
  final String rating;

  // Construtor da classe que recebe os atributos obrigatórios
  const CarCard({
    super.key,
    required this.carName,
    required this.location,
    required this.price,
    required this.imageUrl,
    required this.rating,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4, // Elevação do cartão para criar uma sombra
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0), // Bordas arredondadas para o cartão
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Exibição da imagem do carro com bordas arredondadas
          ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(12.0)),
            child: Image.network(
              imageUrl,
              height: 150, // Altura da imagem
              width: double.infinity,
              fit: BoxFit.cover, // Ajuste da imagem para cobrir o espaço disponível
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Nome do carro com estilo de texto em negrito
                Text(
                  carName,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 4.0), // Espaço entre o nome e a localização
                // Localização do carro com um estilo de texto cinzento
                Text(
                  location,
                  style: const TextStyle(
                    color: Colors.grey,
                    fontSize: 14,
                  ),
                ),
                const SizedBox(height: 8.0), // Espaço entre a localização e a próxima linha
                // Linha que mostra o preço e a classificação
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Exibição do preço por dia do carro com estilo azul e em negrito
                    Text(
                      '\$$price/day',
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Colors.blue,
                      ),
                    ),
                    // Exibição da classificação com um ícone de estrela e o valor da classificação
                    Row(
                      children: [
                        const Icon(
                          Icons.star,
                          color: Colors.amber,
                          size: 18,
                        ),
                        Text(
                          rating,
                          style: const TextStyle(
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
