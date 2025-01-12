import 'package:flutter/material.dart';
import '../app/app_routes.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CuisiniereHomeScreen extends StatefulWidget {
  const CuisiniereHomeScreen({Key? key}) : super(key: key);

  @override
  State<CuisiniereHomeScreen> createState() => _CuisiniereHomeScreenState();
}

class _CuisiniereHomeScreenState extends State<CuisiniereHomeScreen> {
  // Données des commandes en attente
  final List<Map<String, String>> commandesEnAttente = [
    {'name': 'Joel AKPO', 'time': '13:30', 'price': '10,000 F'},
    {'name': 'Jean Marc', 'time': '14:00', 'price': '12,000 F'},
    {'name': 'Anna Belle', 'time': '15:45', 'price': '8,500 F'},
  ];

  // Données des commandes finalisées
  final List<Map<String, String>> commandesFinalisees = [
    {'name': 'Pierre KABORE', 'time': '11:20', 'price': '7,500 F'},
    {'name': 'Sophie ADE', 'time': '10:10', 'price': '5,000 F'},
    {'name': 'Lucas ABLO', 'time': '12:30', 'price': '9,000 F'},
  ];

  // Indicateur pour savoir quel écran afficher
  bool isFinalisees = true;

  // Indicateur pour afficher/masquer le menu
  bool isMenuOpen = false;

  // Fonction pour basculer entre les écrans
  void toggleScreen() {
    setState(() {
      isFinalisees = !isFinalisees;
      isMenuOpen = false; // Fermer le menu après navigation
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          // Contenu principal
          Column(
            children: [
              // AppBar avec le bouton menu
              Container(
                decoration: const BoxDecoration(
                  color: Color(0xFF9295B3),
                  borderRadius: BorderRadius.vertical(
                    bottom: Radius.circular(40),
                  ),
                ),
                padding: const EdgeInsets.only(
                  top: 50,
                  left: 15,
                  right: 15,
                  bottom: 25,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          isMenuOpen = true;
                        });
                      },
                      child: SvgPicture.asset(
                        'assets/icons/menu_icon.svg',
                        height: 34,
                        color: Colors.white, // Ajustez la couleur si nécessaire
                      ),
                    ),
                    Text(
                      isFinalisees
                          ? 'Commandes en Attente'
                          : 'Commandes Terminées',
                      style: const TextStyle(
                        fontFamily: 'Orbitron',
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(width: 24), // Espace réservé pour équilibrer
                  ],
                ),
              ),
              const SizedBox(height: 5),
              // Liste des commandes
              Expanded(
                child: ListView.builder(
                  padding: const EdgeInsets.all(10),
                  itemCount: isFinalisees
                      ? commandesEnAttente.length
                      : commandesFinalisees.length,
                  itemBuilder: (context, index) {
                    final commandes =
                        isFinalisees ? commandesEnAttente : commandesFinalisees;
                    final commande = commandes[index];

                    return Container(
                      margin: const EdgeInsets.only(bottom: 15),
                      padding: const EdgeInsets.all(10),
                      decoration: const BoxDecoration(
                        color: Color(0xFF9295B3),
                        borderRadius: BorderRadius.horizontal(
                          right: Radius.circular(30),
                        ),
                      ),
                      child: Row(
                        children: [
                          // Nom du client
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'M./Mme. ${commande['name']}',
                                  style: const TextStyle(
                                    fontFamily: 'Orbitron',
                                    fontSize: 15,
                                    fontWeight: FontWeight.w700,
                                    color: Colors.white,
                                  ),
                                ),
                                const SizedBox(height: 5),
                                Text(
                                  commande['time']!,
                                  style: const TextStyle(
                                    fontFamily: 'Orbitron',
                                    fontSize: 12,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(width: 15),
                          // Prix
                          Text(
                            commande['price']!,
                            style: const TextStyle(
                              fontFamily: 'Permanent Marker',
                              fontSize: 17,
                              color: Colors.white,
                            ),
                          ),
                          const SizedBox(width: 10),
                          // Bouton "voir"
                          ElevatedButton.icon(
                            style: ElevatedButton.styleFrom(
                              backgroundColor:
                                  isFinalisees ? Colors.orange : Colors.green,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                            ),
                            onPressed: () {
                              // Naviguer vers la page appropriée en fonction de isFinalisees
                              Navigator.pushNamed(
                                context,
                                isFinalisees
                                    ? AppRoutes
                                        .detailsCommandeScreen // Route pour "Commandes finalisées"
                                    : AppRoutes
                                        .commandeFaitScreen, // Route pour "Commandes en attente"
                                arguments: {
                                  'clientName': commande['name']!
                                }, // Passer l'argument
                              );
                            },
                            icon: const Icon(Icons.visibility, size: 16),
                            label: const Text(
                              'voir',
                              style: TextStyle(
                                  fontFamily: 'Orbitron',
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
          // Menu latéral
          if (isMenuOpen)
            GestureDetector(
              onTap: () {
                setState(() {
                  isMenuOpen = false;
                });
              },
              child: Container(
                color: Color(0xFF191A2D).withOpacity(0.5),
              ),
            ),
          if (isMenuOpen)
            Align(
              alignment: Alignment.centerLeft,
              child: Container(
                width: MediaQuery.of(context).size.width * 0.7,
                padding: const EdgeInsets.only(
                  top: 70,
                  left: 20,
                  right: 20,
                  bottom: 60,
                ),
                color: Colors.white,
                child: Column(
                  mainAxisAlignment:
                      MainAxisAlignment.center, // Centre verticalement
                  crossAxisAlignment:
                      CrossAxisAlignment.center, // Centre horizontalement
                  children: [
                    // Logo
                    Image.asset(
                      'assets/images/logo_hm.png',
                      height: 130,
                    ),
                    const SizedBox(height: 30),
                    // Boutons de navigation
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.orange,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 15),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      onPressed: () {
                        if (isFinalisees) return;
                        toggleScreen();
                      },
                      child: Text(
                        'Commandes en attente',
                        style: const TextStyle(
                          fontFamily:
                              'Orbitron', // Assurez-vous que cette police est dans pubspec.yaml
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 15),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      onPressed: () {
                        if (!isFinalisees) return;
                        toggleScreen();
                      },
                      child: Text(
                        'Commandes terminées',
                        style: const TextStyle(
                          fontFamily:
                              'Orbitron', // Assurez-vous que cette police est dans pubspec.yaml
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),

                    const Spacer(),
                    // Icône de fermeture
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            isMenuOpen = false;
                          });
                        },
                        child: const Icon(Icons.close,
                            color: Color(0xFF9295B3), size: 50),
                      ),
                    ),
                  ],
                ),
              ),
            ),
        ],
      ),
    );
  }
}
