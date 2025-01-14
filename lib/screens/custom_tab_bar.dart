import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../app/app_routes.dart';

class CustomTabBar extends StatefulWidget {
  final int currentIndex; // L'index de l'écran actuel

  const CustomTabBar({Key? key, required this.currentIndex}) : super(key: key);

  @override
  _CustomTabBarState createState() => _CustomTabBarState();
}

class _CustomTabBarState extends State<CustomTabBar> {
  // Liste des onglets (icônes, titres, et routes)
  final List<Map<String, dynamic>> _tabs = [
    {
      "icon": "assets/icons/employes.svg",
      "label": "Employés",
      "route":
          AppRoutes.gestionEmployesScreen, // Correction pour utiliser AppRoutes
    },
    {
      "icon": "assets/icons/suivi.svg",
      "label": "Suivi",
      "route": AppRoutes.suiviScreen,
    },
    {
      "icon": "assets/icons/revenus.svg",
      "label": "Revenus",
      "route": AppRoutes.revenusScreen,
    },
    {
      "icon": "assets/icons/impayes.svg",
      "label": "Impayés",
      "route": AppRoutes.impayesScreen,
    },
    {
      "icon": "assets/icons/queues.svg",
      "label": "Queues",
      "route": AppRoutes.queuesScreen,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Color(0xFF9295B3), // Couleur de fond du TabBar
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(25), // Arrondi gauche
          topRight: Radius.circular(25), // Arrondi droite
        ),
      ),
      padding: const EdgeInsets.symmetric(vertical: 8), // Espacement vertical
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: List.generate(_tabs.length, (index) {
          final isActive = widget.currentIndex == index; // Vérifie si actif

          return GestureDetector(
            onTap: () {
              if (widget.currentIndex != index) {
                Navigator.pushNamed(context, _tabs[index]['route']);
                // Redirige vers un autre écran uniquement si nécessaire
              }
            },
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  padding:
                      const EdgeInsets.all(8), // Marges internes pour l'icône
                  decoration: BoxDecoration(
                    color: isActive
                        ? Colors.white
                        : Colors.transparent, // Fond blanc si actif
                    borderRadius: BorderRadius.circular(15), // Arrondi actif
                  ),
                  child: SvgPicture.asset(
                    _tabs[index]['icon']!, // Icône SVG
                    color: Colors.black, // Couleur de l'icône
                    height: 24, // Taille de l'icône
                  ),
                ),
                const SizedBox(height: 5), // Espacement entre icône et texte
                Text(
                  _tabs[index]['label']!, // Texte du bouton
                  style: const TextStyle(
                    fontFamily: 'Orbitron', // Police Orbitron
                    fontSize: 12, // Taille du texte
                    color: Colors.black, // Couleur du texte
                  ),
                ),
              ],
            ),
          );
        }),
      ),
    );
  }
}
