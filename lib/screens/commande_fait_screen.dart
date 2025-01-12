import 'package:flutter/material.dart';

class CommandeFaitScreen extends StatelessWidget {
  final String clientName;

  const CommandeFaitScreen({Key? key, required this.clientName})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Liste des commandes
    final List<Map<String, dynamic>> items = [
      {"dish": "hamburger", "price": 10000, "quantity": 2},
      {"dish": "pizza", "price": 15000, "quantity": 1},
      {"dish": "sandwich", "price": 5000, "quantity": 3},
      {"dish": "frite", "price": 3000, "quantity": 4},
    ];

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0, // Supprime l'ombre de l'AppBar
        title: const Text(
          'Détails de la commande',
          style: TextStyle(
            fontFamily: 'Orbitron',
            fontWeight: FontWeight.w600,
            color: Colors.black,
            fontSize: 18,
          ),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 16.0, right: 16.0, bottom: 50),
        child: Column(
          children: [
            // Section pour afficher le nom du client
            Container(
              margin: const EdgeInsets.only(bottom: 16),
              padding: const EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: const Color(0xFF9295B3),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                children: [
                  const Text(
                    "M./Mme",
                    style: TextStyle(
                      fontFamily: 'Orbitron',
                      fontSize: 14,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    clientName,
                    style: const TextStyle(
                      fontFamily: 'Orbitron',
                      fontSize: 17,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            // Section liste des commandes
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: const Color(0xFF9295B3),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: ListView.separated(
                  padding: const EdgeInsets.all(16.0),
                  itemCount: items.length,
                  separatorBuilder: (context, index) => Divider(
                    color: Colors.white,
                    thickness: 1,
                    indent: 10,
                    endIndent: 10,
                  ),
                  itemBuilder: (context, index) {
                    final item = items[index];
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // Nom du plat
                        Expanded(
                          flex: 4,
                          child: Text(
                            item['dish'],
                            style: const TextStyle(
                              fontFamily: 'Orbitron',
                              fontSize: 14,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        // Prix
                        Expanded(
                          flex: 2,
                          child: Text(
                            "${item['price']} F",
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              fontFamily: 'Permanent Marker',
                              fontSize: 14,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        // Quantité
                        Expanded(
                          flex: 1,
                          child: Text(
                            "${item['quantity']}",
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              fontFamily: 'Orbitron',
                              fontSize: 14,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
