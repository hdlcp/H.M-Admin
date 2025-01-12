import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../app/app_routes.dart';

class ChoicePaymentScreen extends StatefulWidget {
  final String clientName;

  const ChoicePaymentScreen({Key? key, required this.clientName})
      : super(key: key);

  @override
  State<ChoicePaymentScreen> createState() => _ChoicePaymentScreenState();
}

class _ChoicePaymentScreenState extends State<ChoicePaymentScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  // Sample data for the boxes
  final List<Map<String, dynamic>> hairCuts = [
    {
      'image': 'assets/images/jean.png',
      'name': 'Rasta',
      'price': 2000,
      'isSelected': false
    },
    {
      'image': 'assets/images/jean.png',
      'name': 'Mohawk',
      'price': 2000,
      'isSelected': false
    },
    {
      'image': 'assets/images/jean.png',
      'name': 'Mohawk',
      'price': 2000,
      'isSelected': false
    },
    {
      'image': 'assets/images/jean.png',
      'name': 'Mohawk',
      'price': 2000,
      'isSelected': false
    },
    {
      'image': 'assets/images/jean.png',
      'name': 'Mohawk',
      'price': 2000,
      'isSelected': false
    },
    {
      'image': 'assets/images/jean.png',
      'name': 'Mohawk',
      'price': 2000,
      'isSelected': false
    },
    {
      'image': 'assets/images/jean.png',
      'name': 'Mohawk',
      'price': 2000,
      'isSelected': false
    },
    {
      'image': 'assets/images/jean.png',
      'name': 'Mohawk',
      'price': 2000,
      'isSelected': false
    },
    {
      'image': 'assets/images/jean.png',
      'name': 'Mohawk',
      'price': 2000,
      'isSelected': false
    },
    {
      'image': 'assets/images/jean.png',
      'name': 'Mohawk',
      'price': 2000,
      'isSelected': false
    },
    {
      'image': 'assets/images/jean.png',
      'name': 'Mohawk',
      'price': 2000,
      'isSelected': false
    },
    {
      'image': 'assets/images/jean.png',
      'name': 'Mohawk',
      'price': 2000,
      'isSelected': false
    },
    {
      'image': 'assets/images/jean.png',
      'name': 'Mohawk',
      'price': 2000,
      'isSelected': false
    },
    {
      'image': 'assets/images/jean.png',
      'name': 'Mohawk',
      'price': 2000,
      'isSelected': false
    },
    {
      'image': 'assets/images/jean.png',
      'name': 'Mohawk',
      'price': 2000,
      'isSelected': false
    },
    {
      'image': 'assets/images/jean.png',
      'name': 'Mohawk',
      'price': 2000,
      'isSelected': false
    },
    {
      'image': 'assets/images/jean.png',
      'name': 'Mohawk',
      'price': 2000,
      'isSelected': false
    },
    {
      'image': 'assets/images/jean.png',
      'name': 'Mohawk',
      'price': 2000,
      'isSelected': false
    },
  ];

  final List<Map<String, dynamic>> beards = [
    {
      'image': 'assets/images/romeo.png',
      'name': 'Barbe ronde',
      'price': 2000,
      'isSelected': false
    },
    {
      'image': 'assets/images/romeo.png',
      'name': 'Barbe longue',
      'price': 2000,
      'isSelected': false
    },
  ];

  final List<Map<String, dynamic>> pedicureManicure = [
    {
      'image': 'assets/images/simon.png',
      'name': 'French manicure',
      'price': 2000,
      'isSelected': false
    },
    {
      'image': 'assets/images/simon.png',
      'name': 'résine',
      'price': 2000,
      'isSelected': false
    },
    {
      'image': 'assets/images/simon.png',
      'name': 'Gel',
      'price': 2000,
      'isSelected': false
    },
    {
      'image': 'assets/images/simon.png',
      'name': 'Gel ou résine',
      'price': 2000,
      'isSelected': false
    },
  ];

  List<Map<String, dynamic>> cart = [];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  void _updateCart() {
    setState(() {
      cart = [
        ...hairCuts.where((item) => item['isSelected']),
        ...beards.where((item) => item['isSelected']),
        ...pedicureManicure.where((item) => item['isSelected']),
      ];
    });
  }

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

  Widget _buildBox(Map<String, dynamic> item, Function onTap) {
    return GestureDetector(
      onTap: () => onTap(),
      child: Container(
        margin: const EdgeInsets.symmetric(
            vertical: 6.0, horizontal: 7.0), // Limiter la largeur des boxes
        padding: const EdgeInsets.all(0),
        decoration: BoxDecoration(
          color: const Color(0xFF9295B3),
          borderRadius: const BorderRadius.only(
            topRight: Radius.circular(10.0),
            bottomRight: Radius.circular(10.0),
          ),
        ),
        child: Row(
          children: [
            // Image alignée sur le bord gauche et occupant toute la hauteur
            ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(0),
                bottomLeft: Radius.circular(0),
              ),
              child: Image.asset(
                item['image'],
                height: 70, // La hauteur de la box
                width: 70, // Pour conserver la proportion carré
                fit: BoxFit.cover, // L'image occupe tout l'espace
              ),
            ),
            const SizedBox(width: 10), // Espace entre l'image et le texte
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item['name'],
                    style: const TextStyle(
                      fontFamily: 'Orbitron',
                      fontSize: 16,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    '${item['price']} FCFA',
                    style: const TextStyle(
                      fontFamily: 'Permanent Marker',
                      fontSize: 14,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
            GestureDetector(
              onTap: () => onTap(),
              child: SvgPicture.asset(
                'assets/icons/select_icon.svg',
                color: item['isSelected'] ? Color(0xFF191A2D) : Colors.white,
                height: 40,
              ),
            ),
            const SizedBox(width: 10),
          ],
        ),
      ),
    );
  }

  Widget _buildCartItem(Map<String, dynamic> item, Function onRemove) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Text(
            item['name'],
            style: const TextStyle(
              fontFamily: 'Orbitron',
              fontSize: 16,
              color: Colors.white,
            ),
          ),
        ),
        Text(
          '${item['price']} FCFA',
          style: const TextStyle(
            fontFamily: 'Permanent Marker',
            fontSize: 14,
            color: Colors.white,
          ),
        ),
        GestureDetector(
          onTap: () => onRemove(),
          child: SvgPicture.asset(
            'assets/icons/select_icon.svg',
            color: Color(0xFF191A2D),
            height: 30,
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                // Haircut Tab
                Column(
                  children: [
                    const SizedBox(height: 40),
                    const Text(
                      'Coupe de cheveux',
                      style: TextStyle(
                        fontFamily: 'Orbitron',
                        fontSize: 20,
                      ),
                    ),
                    Expanded(
                      child: ListView.builder(
                        itemCount: hairCuts.length,
                        itemBuilder: (context, index) {
                          return _buildBox(hairCuts[index], () {
                            setState(() {
                              hairCuts[index]['isSelected'] =
                                  !hairCuts[index]['isSelected'];
                              _updateCart();
                            });
                          });
                        },
                      ),
                    ),
                  ],
                ),
                // Beard Tab
                Column(
                  children: [
                    const SizedBox(height: 40),
                    const Text(
                      'Taille de barbe',
                      style: TextStyle(
                        fontFamily: 'Orbitron',
                        fontSize: 20,
                      ),
                    ),
                    Expanded(
                      child: ListView.builder(
                        itemCount: beards.length,
                        itemBuilder: (context, index) {
                          return _buildBox(beards[index], () {
                            setState(() {
                              beards[index]['isSelected'] =
                                  !beards[index]['isSelected'];
                              _updateCart();
                            });
                          });
                        },
                      ),
                    ),
                  ],
                ),
                // Pedicure/Manicure Tab
                Column(
                  children: [
                    const SizedBox(height: 40),
                    const Text(
                      'Pédicure Manucure',
                      style: TextStyle(
                        fontFamily: 'Orbitron',
                        fontSize: 20,
                      ),
                    ),
                    Expanded(
                      child: ListView.builder(
                        itemCount: pedicureManicure.length,
                        itemBuilder: (context, index) {
                          return _buildBox(pedicureManicure[index], () {
                            setState(() {
                              pedicureManicure[index]['isSelected'] =
                                  !pedicureManicure[index]['isSelected'];
                              _updateCart();
                            });
                          });
                        },
                      ),
                    ),
                  ],
                ),
                // Cart Tab
                Column(
                  children: [
                    const SizedBox(height: 40),
                    // Boîte inchangée pour afficher les services et les prix
                    Container(
                      padding: const EdgeInsets.all(10.0),
                      margin: const EdgeInsets.all(8.0),
                      decoration: BoxDecoration(
                        color: const Color(0xFF9295B3),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                        children: cart.map((item) {
                          return _buildCartItem(item, () {
                            setState(() {
                              item['isSelected'] = false;
                              _updateCart();
                            });
                          });
                        }).toList(),
                      ),
                    ),
                    const SizedBox(height: 10),

                    // Affichage du total
                    Text(
                      'Total : ${cart.fold<int>(0, (sum, item) => sum + (item['price'] as int))} FCFA',
                      style: const TextStyle(
                        fontFamily: 'Permanent Marker',
                        fontSize: 26,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(height: 10),

                    // Champ de saisie pour le pseudo-nom
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16.0, vertical: 20.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Champ pour afficher le pseudo-nom
                          TextField(
                            enabled: false, // Le champ est en lecture seule
                            decoration: InputDecoration(
                              hintText: 'M./Mme :     ${widget.clientName}',
                              hintStyle: const TextStyle(
                                fontFamily: 'Orbitron',
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                color: Colors.black,
                              ),
                              filled: true,
                              fillColor: const Color(0xFF9295B3),
                              contentPadding: const EdgeInsets.symmetric(
                                horizontal: 12.0,
                                vertical: 12.0,
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide.none,
                              ),
                            ),
                            style: const TextStyle(
                              fontFamily: 'Orbitron',
                              fontSize: 14,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),

                    // Bouton "A Payer"
                    // Bouton "A Payer"
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xFF191A2D),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25),
                        ),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 40, vertical: 12),
                      ),
                      onPressed: _pay,
                      child: const Text(
                        'A payer',
                        style: TextStyle(
                          fontFamily: 'Orbitron',
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Container(
            decoration: BoxDecoration(
              color: const Color(0xFF9295B3), // Couleur de fond de la TabBar
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(40),
                topRight: Radius.circular(40),
              ),
            ),
            child: TabBar(
              controller: _tabController,
              indicator: BoxDecoration(
                color: Colors.white, // Couleur d'indicateur sélectionné
                borderRadius:
                    BorderRadius.circular(20), // Arrondi de l'indicateur
              ),
              labelColor: Colors.black, // Couleur du texte sélectionné
              unselectedLabelColor:
                  Color(0xFF191A2D), // Couleur du texte non sélectionné
              tabs: [
                Tab(
                  icon: Image.asset(
                    'assets/icons/haircut_icon.png',
                    height: 27,
                  ),
                  child: Text(
                    '    Coupe    ',
                    style: const TextStyle(
                      fontFamily: 'Orbitron',
                      fontSize: 12,
                    ),
                  ),
                ),
                Tab(
                  icon: Image.asset(
                    'assets/icons/beard_icon.png',
                    height: 27,
                  ),
                  child: Text(
                    '    Barbe    ',
                    style: const TextStyle(
                      fontFamily: 'Orbitron',
                      fontSize: 12,
                    ),
                  ),
                ),
                Tab(
                  icon: Image.asset(
                    'assets/icons/manicure_icon.png',
                    height: 27,
                  ),
                  child: Text(
                    ' Pédicure ',
                    style: const TextStyle(
                      fontFamily: 'Orbitron',
                      fontSize: 12,
                    ),
                  ),
                ),
                Tab(
                  icon: SvgPicture.asset(
                    'assets/icons/cart_icon.svg',
                    height: 27,
                  ),
                  child: Text(
                    '   Panier    ',
                    style: const TextStyle(
                      fontFamily: 'Orbitron',
                      fontSize: 12,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
