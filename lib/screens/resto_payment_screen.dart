import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart'; // Nécessaire pour charger les SVG
import '../app/app_routes.dart';

class RestoPaymentScreen extends StatefulWidget {
  final String clientName;

  const RestoPaymentScreen({Key? key, required this.clientName})
      : super(key: key);

  @override
  _RestoPaymentScreenState createState() => _RestoPaymentScreenState();
}

class _RestoPaymentScreenState extends State<RestoPaymentScreen> {
  // Liste des services avec leurs prix et quantités
  final List<Map<String, dynamic>> _services = [
    {'name': 'Chawarma', 'price': 2000, 'quantity': 2, 'selected': true},
    {'name': 'Tacos', 'price': 2000, 'quantity': 2, 'selected': true},
    {'name': 'Riz au curry', 'price': 2000, 'quantity': 2, 'selected': true},
    {'name': 'Poulet rôti', 'price': 2000, 'quantity': 2, 'selected': true},
    {
      'name': 'Nuggets de poulet',
      'price': 2000,
      'quantity': 2,
      'selected': true
    },
  ];

  // Calcul du total
  int get totalPrice {
    return _services.fold(
        0,
        (sum, item) =>
            sum + ((item['price'] as int) * (item['quantity'] as int)));
  }

  // Supprimer ou désélectionner un plat
  void _toggleSelection(int index) {
    setState(() {
      _services[index]['selected'] = !_services[index]['selected'];
    });
  }

  // Augmenter la quantité
  void _incrementQuantity(int index) {
    setState(() {
      _services[index]['quantity']++;
    });
  }

  // Diminuer la quantité
  void _decrementQuantity(int index) {
    setState(() {
      if (_services[index]['quantity'] > 1) {
        _services[index]['quantity']--;
      }
    });
  }

  // Effectuer le paiement
  void _pay() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        title: const Text(
          "Paiement effectué",
          style: TextStyle(
            fontFamily: 'Orbitron',
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        content: const Text(
          "Votre paiement a été enregistré avec succès.",
          style: TextStyle(
            fontFamily: 'Orbitron',
            fontSize: 14,
          ),
        ),
        actions: [
          Center(
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor:
                    const Color(0xFF191A2D), // Fond de couleur 191A2D
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10), // Arrondis des bords
                ),
                padding: const EdgeInsets.symmetric(
                  vertical: 10,
                  horizontal: 20,
                ),
              ),
              onPressed: () {
                Navigator.pushNamed(context, AppRoutes.caissiereHome);
              },
              child: const Text(
                "OK",
                style: TextStyle(
                  fontFamily: 'Orbitron',
                  fontSize: 14,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          // Liste des plats et prix
          Expanded(
            child: Container(
              margin: const EdgeInsets.only(
                top: 40,
                bottom: 50,
                left: 10,
                right: 10,
              ),
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: const Color(0xFF9295B3),
                borderRadius: BorderRadius.circular(20),
              ),
              child: ListView.builder(
                itemCount: _services.length,
                itemBuilder: (context, index) {
                  final service = _services[index];
                  return service['selected']
                      ? Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8),
                          child: Row(
                            children: [
                              // Icône de désélection
                              GestureDetector(
                                onTap: () => _toggleSelection(index),
                                child: SvgPicture.asset(
                                  'assets/icons/select_icon.svg',
                                  color: Color(0xFF191A2D),
                                  height: 24,
                                  width: 24,
                                ),
                              ),
                              const SizedBox(width: 10),

                              // Nom du plat
                              Expanded(
                                child: Text(
                                  service['name'],
                                  style: const TextStyle(
                                    fontSize: 16,
                                    fontFamily: 'Orbitron',
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),

                              // Quantité
                              Row(
                                children: [
                                  IconButton(
                                    icon: const Icon(Icons.remove,
                                        color: Colors.white),
                                    onPressed: () => _decrementQuantity(index),
                                  ),
                                  Text(
                                    '(${service['quantity']})',
                                    style: const TextStyle(
                                        fontFamily: 'Permanent Marker',
                                        color: Colors.white),
                                  ),
                                  IconButton(
                                    icon: const Icon(Icons.add,
                                        color: Colors.white),
                                    onPressed: () => _incrementQuantity(index),
                                  ),
                                ],
                              ),

                              // Prix
                              Text(
                                '${service['price']} FCFA',
                                style: const TextStyle(
                                  fontSize: 14,
                                  fontFamily: 'Permanent Marker',
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                        )
                      : const SizedBox
                          .shrink(); // Ne rien afficher si non sélectionné
                },
              ),
            ),
          ),

          // Total
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Total :',
                  style: TextStyle(
                    fontFamily: 'Permanent Marker',
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  '$totalPrice FCFA',
                  style: const TextStyle(
                    fontSize: 24,
                    fontFamily: 'Permanent Marker',
                    color: Colors.green,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),

          // Champ pseudo-nom
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: const Color(0xFF9295B3),
                borderRadius: BorderRadius.circular(15),
              ),
              child: Text(
                'M. / Mme :    ${widget.clientName}',
                style: const TextStyle(
                  fontSize: 16,
                  fontFamily: 'Orbitron',
                  color: Color(0xFF191A2D),
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),

          // Bouton "A Payer"
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
            decoration: const BoxDecoration(
              color: Color(0xFF9295B3),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
            ),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFF191A2D),
                padding: const EdgeInsets.symmetric(vertical: 15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              onPressed: _pay,
              child: const Text(
                'A payer',
                style: TextStyle(
                  fontFamily: 'Orbitron',
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
