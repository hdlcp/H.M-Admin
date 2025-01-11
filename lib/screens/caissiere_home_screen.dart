import 'package:flutter/material.dart';

class CaissiereHomeScreen extends StatelessWidget {
  const CaissiereHomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Gestion des Clients et Paiements"),
        backgroundColor: const Color(0xFF191A2D),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Bienvenue dans la Gestion des Clients et Paiements",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context); // Retour à l'écran précédent
              },
              child: const Text("Retour"),
            ),
          ],
        ),
      ),
    );
  }
}
