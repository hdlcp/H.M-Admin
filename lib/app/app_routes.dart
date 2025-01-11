import 'package:flutter/material.dart';
import '../screens/loading_screen.dart';
import '../screens/welcome_screen.dart';
import '../screens/connexion_screen.dart'; // Nouveau nom du fichier

class AppRoutes {
  // Définition des constantes de routes
  static const String loading = '/';
  static const String welcome = '/welcome';
  static const String adminDashboard = '/admin';
  static const String cashierDashboard = '/cashier';
  static const String cookDashboard = '/cook';

  // Gestionnaire des routes
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case loading:
        return MaterialPageRoute(builder: (_) => const LoadingScreen());
      case welcome:
        return MaterialPageRoute(builder: (_) => const WelcomeScreen());
      case adminDashboard:
        return MaterialPageRoute(
          builder: (_) => const ConnexionScreen(
            title: "Gestion Administrative",
            imagePath: "assets/images/admin_image.png",
          ),
        );
      case cashierDashboard:
        return MaterialPageRoute(
          builder: (_) => const ConnexionScreen(
            title: "Gestion des clients et paiements",
            imagePath: "assets/images/payment_image.png",
          ),
        );
      case cookDashboard:
        return MaterialPageRoute(
          builder: (_) => const ConnexionScreen(
            title: "Gestion des commandes",
            imagePath: "assets/images/cook_image.png",
          ),
        );
      default:
        return MaterialPageRoute(
          builder: (_) => const Scaffold(
            body: Center(
              child: Text('No route defined'),
            ),
          ),
        );
    }
  }
}
