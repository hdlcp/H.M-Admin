import 'package:flutter/material.dart';
import '../app/app_routes.dart';

class CaissiereHomeScreen extends StatelessWidget {
  CaissiereHomeScreen({Key? key}) : super(key: key);

  // Liste d'exemple contenant les données des boxes
  final List<Map<String, String>> clients = [
    {
      'name': 'Richard du bond',
      'time': '10:11',
      'date': '10/02/24',
      'post': 'Roméo',
      'description': 'coiffure',
    },
    {
      'name': 'gracias',
      'time': '10:11',
      'date': '10/02/24',
      'post': '',
      'description': 'Restaurant',
    },
    {
      'name': 'isaac',
      'time': '10:11',
      'date': '10/02/24',
      'post': 'Roméo',
      'description': 'coiffure',
    },
    {
      'name': 'belmisline',
      'time': '10:11',
      'date': '10/02/24',
      'post': '',
      'description': 'Restaurant',
    },
    {
      'name': 'joachime',
      'time': '10:11',
      'date': '10/02/24',
      'post': 'Roméo',
      'description': 'coiffure',
    },
    {
      'name': 'elvron',
      'time': '10:11',
      'date': '10/02/24',
      'post': '',
      'description': 'Restaurant',
    },
    {
      'name': 'elvron',
      'time': '10:11',
      'date': '10/02/24',
      'post': '',
      'description': 'Restaurant',
    },
    {
      'name': 'elvron',
      'time': '10:11',
      'date': '10/02/24',
      'post': '',
      'description': 'Restaurant',
    },
    {
      'name': 'elvron',
      'time': '10:11',
      'date': '10/02/24',
      'post': '',
      'description': 'Restaurant',
    },
    {
      'name': 'elvron',
      'time': '10:11',
      'date': '10/02/24',
      'post': '',
      'description': 'Restaurant',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Fermer le clavier si on clique en dehors
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          centerTitle: true,
          automaticallyImplyLeading: false, // Supprime l'icône de retour
          title: const Text(
            'Suivi des Paiements des Clients',
            style: TextStyle(
              color: Color(0xFF191A2D),
              fontSize: 16,
              fontWeight: FontWeight.w700,
              fontFamily: 'Orbitron',
            ),
          ),
        ),
        body: Column(
          children: [
            // Champ de recherche
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              child: TextField(
                cursorColor: Colors.white,
                decoration: InputDecoration(
                  hintText: 'rechercher avec un pseudo nom',
                  hintStyle: const TextStyle(
                    fontFamily: 'Orbitron',
                    fontSize: 14,
                    color: Colors.white,
                  ),
                  prefixIcon: const Icon(Icons.search, color: Colors.white),
                  filled: true,
                  fillColor: const Color(0xFF9295B3),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide.none,
                  ),
                ),
                style: const TextStyle(
                  fontFamily: 'Orbitron',
                  color: Colors.white,
                ),
              ),
            ),
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                itemCount: clients.length,
                itemBuilder: (context, index) {
                  final client = clients[index];
                  return GestureDetector(
                    onTap: () {
                      // Vérifier la valeur de "description" et naviguer vers l'écran approprié
                      if (client['description'] == 'coiffure') {
                        Navigator.pushNamed(
                          context,
                          AppRoutes.ChoicePayment,
                          arguments: {'clientName': client['name']!},
                        );
                      } else if (client['description'] == 'Restaurant') {
                        Navigator.pushNamed(
                          context,
                          AppRoutes.RestoPayment,
                          arguments: {'clientName': client['name']!},
                        );
                      }
                    },
                    child: Container(
                      margin: const EdgeInsets.only(bottom: 15),
                      padding: const EdgeInsets.all(15),
                      decoration: BoxDecoration(
                        color: const Color(0xFF9295B3),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Row(
                        children: [
                          // Point à gauche
                          const Icon(
                            Icons.circle,
                            size: 10,
                            color: Colors.white,
                          ),
                          const SizedBox(width: 10),

                          // Informations principales
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  client['name']!,
                                  style: const TextStyle(
                                    color: Color.fromARGB(255, 44, 45, 68),
                                    fontSize: 16,
                                    fontWeight: FontWeight.w700,
                                    fontFamily: 'Orbitron',
                                  ),
                                ),
                                const SizedBox(height: 10),
                                Row(
                                  children: [
                                    const Text(
                                      'Post : ',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 12,
                                        fontFamily: 'Orbitron',
                                      ),
                                    ),
                                    Text(
                                      client['post']!,
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 12,
                                        fontFamily: 'Orbitron',
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 2),
                                Text(
                                  client['description']!,
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 12,
                                    fontFamily: 'Orbitron',
                                  ),
                                ),
                              ],
                            ),
                          ),

                          // Heure et date
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(
                                client['time']!,
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                  fontFamily: 'Orbitron',
                                ),
                              ),
                              const SizedBox(height: 5),
                              Text(
                                client['date']!,
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 12,
                                  fontFamily: 'Orbitron',
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
