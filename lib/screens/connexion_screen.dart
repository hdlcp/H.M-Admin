import 'package:flutter/material.dart';

class ConnexionScreen extends StatefulWidget {
  final String title;
  final String imagePath;

  const ConnexionScreen({
    Key? key,
    required this.title,
    required this.imagePath,
  }) : super(key: key);

  @override
  State<ConnexionScreen> createState() => _ConnexionScreenState();
}

class _ConnexionScreenState extends State<ConnexionScreen> {
  bool _obscureText = true; // Contrôle de l'affichage du mot de passe

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Container(
          color: const Color(0xFF9295B3), // Couleur de fond violet
          child: Column(
            children: [
              // Logo en haut
              SizedBox(
                height: screenHeight * 0.35,
                child: Center(
                  child: Image.asset(
                    'assets/images/logo_hm.png',
                    width: screenWidth * 0.7,
                    fit: BoxFit.contain,
                  ),
                ),
              ),

              // Boîte blanche
              Expanded(
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(20),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(70),
                      topRight: Radius.circular(70),
                    ),
                  ),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const SizedBox(height: 10),
                        // Texte au-dessus de l'image
                        Text(
                          widget.title,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.w700,
                            fontFamily: 'Orbitron',
                            color: Color(0xFF191A2D),
                          ),
                        ),
                        const SizedBox(height: 15),

                        // Image au-dessus du texte
                        Image.asset(
                          widget.imagePath,
                          width: screenWidth * 0.7,
                          height: screenHeight * 0.2,
                          fit: BoxFit.contain,
                        ),
                        const SizedBox(height: 20),

                        // Champ de saisie pour le nom d'utilisateur
                        _buildTextField(
                          icon: Icons.person,
                          hintText: "Nom d'utilisateur",
                          context: context,
                          obscureText: false,
                          isPassword: false,
                        ),
                        const SizedBox(height: 15),

                        // Champ de saisie pour le mot de passe
                        _buildTextField(
                          icon: Icons.lock,
                          hintText: "Mot de passe",
                          context: context,
                          obscureText: _obscureText,
                          isPassword: true,
                        ),
                        const SizedBox(height: 40),

                        // Bouton Se connecter
                        ElevatedButton(
                          onPressed: () {
                            // Action de connexion
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFF191A2D),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50),
                            ),
                            padding: const EdgeInsets.symmetric(
                              horizontal: 40,
                              vertical: 12,
                            ),
                          ),
                          child: const Text(
                            "Se connecter",
                            style: TextStyle(
                              fontSize: 17,
                              color: Colors.white,
                              fontWeight: FontWeight.w700,
                              fontFamily: 'Orbitron',
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField({
    required IconData icon,
    required String hintText,
    required BuildContext context,
    required bool obscureText,
    bool isPassword = false, // Définit si le champ est un mot de passe
  }) {
    return TextField(
      obscureText: obscureText,
      cursorColor: Colors.white, // Couleur du curseur
      decoration: InputDecoration(
        prefixIcon: Icon(
          icon,
          color: Colors.white,
          size: 27,
        ),
        suffixIcon: isPassword
            ? GestureDetector(
                onTap: () {
                  setState(() {
                    _obscureText =
                        !_obscureText; // Basculer affichage mot de passe
                  });
                },
                child: Icon(
                  _obscureText ? Icons.visibility_off : Icons.visibility,
                  color: Colors.white,
                ),
              )
            : null,
        filled: true,
        fillColor: const Color(0xFF9295B3), // Fond violet
        hintText: hintText,
        hintStyle: const TextStyle(
          color: Colors.white,
          fontFamily: 'Orbitron',
          fontSize: 14,
        ),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 30,
          vertical: 15,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(50),
          borderSide: BorderSide.none,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(50),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(50),
          borderSide: BorderSide.none,
        ),
      ),
      style: const TextStyle(
        color: Colors.white,
        fontFamily: 'Orbitron',
      ),
    );
  }
}
