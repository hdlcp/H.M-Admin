import 'package:flutter/material.dart';
import 'app/app_routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, // Désactive le mot "DEBUG"
      title: 'H & M Coiffure',
      theme: ThemeData(
        primaryColor: Color(0xFF9295B3),
      ),
      initialRoute: AppRoutes.loading,
      onGenerateRoute: AppRoutes.generateRoute,
    );
  }
}
