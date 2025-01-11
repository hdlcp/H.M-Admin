import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/flutter_svg.dart'; // Pour les icônes SVG
import '../app/app_routes.dart';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({Key? key}) : super(key: key);

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  bool isLoading = true; // État pour déterminer l'affichage

  @override
  void initState() {
    super.initState();
    // Basculer vers l'affichage des boutons après 3 secondes
    Timer(const Duration(seconds: 3), () {
      setState(() {
        isLoading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: const Color(0xFF9295B3), // Couleur de fond
        child: Stack(
          children: [
            // Demi-cercle en haut à droite
            Positioned(
              top: -50,
              right: -50,
              child: Image.asset(
                'assets/images/rectangle_haut.png',
                width: 250,
                height: 250,
              ),
            ),
            // Demi-cercle en bas à gauche
            Positioned(
              bottom: -50,
              left: -50,
              child: Image.asset(
                'assets/images/rectangle_bas.png',
                width: 324,
                height: 300,
              ),
            ),
            // Contenu principal
            Center(
              child: isLoading
                  ? _buildLoadingContent() // Contenu pendant le chargement
                  : _buildButtonContent(), // Contenu après chargement
            ),
          ],
        ),
      ),
    );
  }

  // Contenu de l'écran pendant le chargement
  Widget _buildLoadingContent() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // Logo principal
        Image.asset(
          'assets/images/logo_hm.png',
          width: 337,
          height: 218,
        ),
        const SizedBox(height: 20),
        // Animation de chargement
        const SpinKitThreeBounce(
          color: Color(0xFF191A2D),
          size: 25.0,
        ),
      ],
    );
  }

  // Contenu de l'écran après le chargement
  Widget _buildButtonContent() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // Texte au-dessus des boutons
        const Text(
          "Veuillez sélectionner votre rôle\npour continuer",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w700,
            color: Color(0xFF191A2D),
            fontFamily: "Orbitron", // Police Orbitron
            letterSpacing: 0.05,
          ),
        ),
        const SizedBox(height: 30),

        // Boutons
        _buildRoleButton(
          context: context,
          iconPath: 'assets/icons/account_cog_icon.svg',
          label: 'Administrateur',
          onPressed: () {
            Navigator.pushNamed(context, AppRoutes.adminDashboard);
          },
        ),
        const SizedBox(height: 20),
        _buildRoleButton(
          context: context,
          iconPath: 'assets/icons/account_cash_icon.svg',
          label: 'Caissière',
          onPressed: () {
            Navigator.pushNamed(context, AppRoutes.cashierDashboard);
          },
        ),
        const SizedBox(height: 20),
        _buildRoleButton(
          context: context,
          iconPath: 'assets/icons/food_icon.svg',
          label: 'Cuisinière',
          onPressed: () {
            Navigator.pushNamed(context, AppRoutes.cookDashboard);
          },
        ),
      ],
    );
  }

  // Widget pour un bouton de rôle
  Widget _buildRoleButton({
    required BuildContext context,
    required String iconPath,
    required String label,
    required VoidCallback onPressed,
  }) {
    // Dimensions responsives
    final screenWidth = MediaQuery.of(context).size.width;
    final buttonWidth = screenWidth * 0.72; // 80% de la largeur de l'écran
    final buttonHeight = 60.0; // Hauteur fixe pour tous les boutons

    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.white,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        fixedSize: Size(buttonWidth, buttonHeight),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Icône SVG
          SvgPicture.asset(
            iconPath,
            width: 40,
            height: 40,
            color: const Color(0xFF9295B3), // Couleur des icônes
          ),
          const SizedBox(width: 20), // Espacement entre l'icône et le texte
          // Texte du bouton
          Text(
            label,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w700,
              color: Color(0xFF191A2D),
              fontFamily: "Orbitron", // Police Orbitron
              letterSpacing: 0.05,
            ),
          ),
        ],
      ),
    );
  }
}
