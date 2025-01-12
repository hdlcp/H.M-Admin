import 'package:flutter/material.dart';
import '../screens/loading_screen.dart';
import '../screens/welcome_screen.dart';
import '../screens/connexion_screen.dart'; // Nouveau nom du fichier
import '../screens/admin_home_screen.dart';
import '../screens/caissiere_home_screen.dart';
import '../screens/cuisiniere_home_screen.dart';
import '../screens/choice_payment_screen.dart';
import '../screens/resto_payment_screen.dart';

class AppRoutes {
  // Définition des constantes de routes
  static const String loading = '/';
  static const String welcome = '/welcome';
  static const String adminDashboard = '/admin';
  static const String cashierDashboard = '/cashier';
  static const String cookDashboard = '/cook';
  static const String adminHome = '/admin_home';
  static const String caissiereHome = '/caissiere_home';
  static const String cuisiniereHome = '/cuisiniere_home';
  static const String ChoicePayment = '/choicePayment';
  static const String RestoPayment = '/restoPayment';

  // Gestionnaire des routes
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case loading:
        return MaterialPageRoute(builder: (_) => const LoadingScreen());
      case welcome:
        return MaterialPageRoute(builder: (_) => const WelcomeScreen());
      case adminHome:
        return MaterialPageRoute(builder: (_) => const AdminHomeScreen());
      case caissiereHome:
        return MaterialPageRoute(builder: (_) => CaissiereHomeScreen());
      case cuisiniereHome:
        return MaterialPageRoute(builder: (_) => const CuisiniereHomeScreen());
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
            title: "Gestion des Clients et Paiements",
            imagePath: "assets/images/payment_image.png",
          ),
        );
      case cookDashboard:
        return MaterialPageRoute(
          builder: (_) => const ConnexionScreen(
            title: "Gestion des Commandes",
            imagePath: "assets/images/cook_image.png",
          ),
        );
      case ChoicePayment:
        final args = settings.arguments as Map<String, String>;
        return MaterialPageRoute(
          builder: (_) => ChoicePaymentScreen(clientName: args['clientName']!),
        );
      case RestoPayment:
        final args = settings.arguments as Map<String, String>;
        return MaterialPageRoute(
          builder: (_) => RestoPaymentScreen(clientName: args['clientName']!),
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
