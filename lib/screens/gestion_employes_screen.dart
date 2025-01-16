import 'package:flutter/material.dart';
import '../screens/custom_tab_bar.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../app/app_routes.dart';

class GestionEmployesScreen extends StatefulWidget {
  const GestionEmployesScreen({Key? key}) : super(key: key);

  @override
  State<GestionEmployesScreen> createState() => _GestionEmployesScreenState();
}

class _GestionEmployesScreenState extends State<GestionEmployesScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(70),
        child: AppBar(
          backgroundColor: const Color(0xFF9295B3),
          elevation: 0,
          automaticallyImplyLeading: false,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              // Bouton Employés
              GestureDetector(
                onTap: () {
                  setState(() {
                    _tabController.index = 0; // Change d'onglet
                  });
                },
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                  decoration: BoxDecoration(
                    color: _tabController.index == 0
                        ? const Color(0xFF191A2D) // Couleur active
                        : Colors.white, // Couleur inactive
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Text(
                    'Employés',
                    style: TextStyle(
                      fontFamily: 'Orbitron',
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: _tabController.index == 0
                          ? Colors.white // Texte blanc si actif
                          : Colors.black, // Texte noir si inactif
                    ),
                  ),
                ),
              ),

              // Bouton Coiffures
              GestureDetector(
                onTap: () {
                  setState(() {
                    _tabController.index = 1; // Change d'onglet
                  });
                },
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                  decoration: BoxDecoration(
                    color: _tabController.index == 1
                        ? const Color(0xFF191A2D) // Couleur active
                        : Colors.white, // Couleur inactive
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Text(
                    'Coiffures',
                    style: TextStyle(
                      fontFamily: 'Orbitron',
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: _tabController.index == 1
                          ? Colors.white // Texte blanc si actif
                          : Colors.black, // Texte noir si inactif
                    ),
                  ),
                ),
              ),

              // Bouton Plats
              GestureDetector(
                onTap: () {
                  setState(() {
                    _tabController.index = 2; // Change d'onglet
                  });
                },
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                  decoration: BoxDecoration(
                    color: _tabController.index == 2
                        ? const Color(0xFF191A2D) // Couleur active
                        : Colors.white, // Couleur inactive
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Text(
                    'Plats',
                    style: TextStyle(
                      fontFamily: 'Orbitron',
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: _tabController.index == 2
                          ? Colors.white // Texte blanc si actif
                          : Colors.black, // Texte noir si inactif
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),

      body: Stack(
        children: [
          TabBarView(
            controller: _tabController,
            children: [
              _buildEmployesTab(),
              _buildCoiffuresTab(),
              _buildPlatsTab(),
            ],
          ),
          Positioned(
            bottom: MediaQuery.of(context).size.height *
                0.03, // Position verticale adaptable
            left: MediaQuery.of(context).size.width *
                0.05, // Position horizontale totalement à gauche
            child: GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, AppRoutes.ajoutGlobale);
              },
              child: Container(
                width: 63, // Diamètre du bouton
                height: 63, // Diamètre du bouton
                decoration: BoxDecoration(
                  color: const Color(0xFF191A2D), // Couleur de fond
                  shape: BoxShape.circle, // Forme circulaire
                ),
                child: Center(
                  child: SvgPicture.asset(
                    'assets/icons/add_icon.svg', // Chemin de l'icône SVG
                    color: Colors.white, // Couleur de l'icône
                    width: 30, // Taille de l'icône
                    height: 30, // Taille de l'icône
                  ),
                ),
              ),
            ),
          )
        ],
      ),
      // Ajout de la CustomTabBar ici
      bottomNavigationBar: const CustomTabBar(
        currentIndex: 0, // L'onglet actif est "Employés"
      ),
    );
  }

  Widget _buildEmployesTab() {
    final List<Map<String, dynamic>> employees = [
      {
        "name": "Roméo",
        "post": "Coiffeur",
        "date": "18 mars 2022",
        "img": "assets/images/food_1.png",
        "status": true
      },
      {
        "name": "Jacques",
        "post": "Coiffeur",
        "date": "20 sept 2022",
        "img": "assets/images/food_1.png",
        "status": true
      },
    ];

    return ListView.builder(
      padding: const EdgeInsets.only(top: 10, bottom: 10, right: 6, left: 6),
      itemCount: employees.length,
      itemBuilder: (context, index) {
        final employee = employees[index];
        return _buildBox(
          image: employee['img']!,
          title: employee['name']!,
          subtitle: employee['post']!, // Correction
          info: employee['date']!, // Correction
          status: employee['status']!,
          onEdit: () => Navigator.pushNamed(context, '/editEmployeePage'),
          onDelete: () => Navigator.pushNamed(context, '/deleteEmployeePage'),
        );
      },
    );
  }

  Widget _buildCoiffuresTab() {
    final List<Map<String, dynamic>> coiffures = [
      {
        "name": "Barbe Ronde",
        "category": "Taille de barbe",
        "price": "2000 CFA",
        "img": "assets/images/food_1.png",
        "status": true
      },
      {
        "name": "Rasta",
        "category": "Coupe de cheveux",
        "price": "2500 CFA",
        "img": "assets/images/food_1.png",
        "status": true
      },
    ];

    return ListView.builder(
      padding: const EdgeInsets.only(top: 10, bottom: 10, right: 6, left: 6),
      itemCount: coiffures.length,
      itemBuilder: (context, index) {
        final coiffure = coiffures[index];
        return _buildBox(
          image: coiffure['img']!,
          title: coiffure['name']!,
          subtitle: coiffure['category']!,
          info: coiffure['price']!,
          status: coiffure['status']!,
          onEdit: () => Navigator.pushNamed(context, '/editCoiffurePage'),
          onDelete: () => Navigator.pushNamed(context, '/deleteCoiffurePage'),
        );
      },
    );
  }

  Widget _buildPlatsTab() {
    final List<Map<String, dynamic>> plats = [
      {
        "name": "Hamburger",
        "price": "2000 CFA",
        "img": "assets/images/food_1.png",
        "status": true
      },
      {
        "name": "Pizza",
        "price": "2000 CFA",
        "img": "assets/images/food_1.png",
        "status": false
      },
    ];

    return ListView.builder(
      padding: const EdgeInsets.only(top: 10, bottom: 10, right: 6, left: 6),
      itemCount: plats.length,
      itemBuilder: (context, index) {
        final plat = plats[index];
        return _buildBox(
          image: plat['img']!,
          title: plat['name']!,
          subtitle: "", // Correction
          info: plat['price']!,
          status: plat['status']!,
          onEdit: () => Navigator.pushNamed(context, '/editPlatPage'),
          onDelete: () => Navigator.pushNamed(context, '/deletePlatPage'),
        );
      },
    );
  }

  Widget _buildBox({
    required String image,
    required String title,
    required String subtitle,
    required String info,
    required bool status,
    required VoidCallback onEdit,
    required VoidCallback onDelete,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
        color: const Color(0xFF9295B3),
        borderRadius: const BorderRadius.only(
          topRight: Radius.circular(12),
          bottomRight: Radius.circular(12),
        ),
      ),
      child: Row(
        children: [
          // Image sur la gauche
          ClipRRect(
            child: Image.asset(
              image,
              height: 120,
              width: 120,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(width: 12),
          // Contenu textuel (Nom, Prix, Statut)
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontFamily: "Orbitron",
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    subtitle,
                    style: const TextStyle(
                      fontSize: 13,
                      fontFamily: "Orbitron",
                      color: Colors.white70,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    info,
                    style: const TextStyle(
                        fontSize: 14,
                        fontFamily: 'Permanent Marker',
                        color: Colors.white),
                  ),
                ],
              ),
            ),
          ),
          // Boutons d'actions (Modifier/Supprimer)
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: onEdit,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                child: const Text(
                  "Modifier",
                  style: TextStyle(
                      color: Colors.white,
                      fontFamily: "Orbitron",
                      fontSize: 12),
                ),
              ),
              const SizedBox(height: 8),
              ElevatedButton(
                onPressed: onDelete,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                child: const Text(
                  "Supprimer",
                  style: TextStyle(
                      color: Colors.white,
                      fontFamily: "Orbitron",
                      fontSize: 12),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
