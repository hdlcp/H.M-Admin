import 'dart:io'; // Pour gérer les fichiers locaux
//import 'package:file_picker/file_picker.dart'; // Pour sélectionner des fichiers
import 'package:flutter/material.dart';
import '../screens/custom_tab_bar.dart';

class AjoutGlobaleScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          'Plus',
          style: TextStyle(
            color: Colors.black,
            fontFamily: 'Orbitron',
            fontSize: 20,
          ),
        ),
        centerTitle: true,
      ),
      body: Center(
        // Alignement central des boutons
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              _buildButton(
                context,
                label: 'Ajouter un employé',
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AjoutEmployeScreen()),
                ),
              ),
              const SizedBox(height: 20),
              _buildButton(
                context,
                label: 'Ajouter une coiffure',
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => AjoutCoiffureScreen()),
                ),
              ),
              const SizedBox(height: 20),
              _buildButton(
                context,
                label: 'Ajouter un plat',
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AjoutPlatScreen()),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: const CustomTabBar(
        currentIndex: 0, // Onglet actif : Employés
      ),
    );
  }

  Widget _buildButton(BuildContext context,
      {required String label, required VoidCallback onTap}) {
    return ElevatedButton(
      onPressed: onTap,
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0xFF191A2D),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
      ),
      child: Text(
        label,
        style: TextStyle(
          fontFamily: 'Orbitron',
          fontSize: 16,
          color: Colors.white,
        ),
      ),
    );
  }
}

// Écran d'ajout d'employé
class AjoutEmployeScreen extends StatelessWidget {
  File? _employeImage;
  @override
  Widget build(BuildContext context) {
    return _buildFormScreen(
      context,
      title: 'Ajout d\'employé',
      buttonText: 'Ajouter l\'employé',
      formFields: [
        _buildTextField(hintText: 'le nom complet de l\'employé'),
        _buildDropdownField(
          items: ['Coiffeur', 'Cuisinière', 'Caissière'],
          hintText: 'le poste de l\'employé',
        ),
        _buildDropdownField(
          items: ['Activer', 'Désactiver'],
          hintText: 'le statut de l\'employé',
        ),
        _buildTextField(hintText: 'entrer un mot de passe initial'),
        _buildFileUploadField(
          context,
          hintText: 'Ajouter une photo (PNG/JPG)',
          onImageSelected: (File? image) {
            _employeImage = image;
          },
        ),
      ],
    );
  }
}

// Écran d'ajout de coiffure
class AjoutCoiffureScreen extends StatelessWidget {
  File? _employeImage;
  @override
  Widget build(BuildContext context) {
    return _buildFormScreen(
      context,
      title: 'Ajout d\'une coiffure',
      buttonText: 'Ajouter la coiffure',
      formFields: [
        _buildTextField(hintText: 'le nom de la coiffure'),
        _buildTextField(hintText: 'le prix (Ex : 5000)'),
        _buildDropdownField(
          items: ['Catégorie 1', 'Catégorie 2', 'Catégorie 3'],
          hintText: 'Sélectionnez une catégorie',
        ),
        _buildDropdownField(
          items: ['Activer', 'Désactiver'],
          hintText: 'le statut de la coiffure',
        ),
        _buildFileUploadField(
          context,
          hintText: 'Ajouter une photo (PNG/JPG)',
          onImageSelected: (File? image) {
            _employeImage = image;
          },
        ),
      ],
    );
  }
}

// Écran d'ajout de plat
class AjoutPlatScreen extends StatelessWidget {
  File? _employeImage;
  @override
  Widget build(BuildContext context) {
    return _buildFormScreen(
      context,
      title: 'Ajout d\'un plat',
      buttonText: 'Ajouter le plat',
      formFields: [
        _buildTextField(hintText: 'le nom du plat'),
        _buildTextField(hintText: 'le prix (Ex : 5000)'),
        _buildDropdownField(
          items: ['Activer', 'Désactiver'],
          hintText: 'Sélectionnez le statut du plat',
        ),
        _buildFileUploadField(
          context,
          hintText: 'Ajouter une photo (PNG/JPG)',
          onImageSelected: (File? image) {
            _employeImage = image;
          },
        ),
      ],
    );
  }
}

// Widget générique pour créer des écrans avec un formulaire
Widget _buildFormScreen(BuildContext context,
    {required String title,
    required String buttonText,
    required List<Widget> formFields}) {
  return Scaffold(
    resizeToAvoidBottomInset: true,
    backgroundColor: Colors.white,
    appBar: AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      leading: IconButton(
        icon: Icon(Icons.arrow_back, color: Colors.black),
        onPressed: () => Navigator.pop(context),
      ),
      title: Text(
        title,
        style: TextStyle(
          color: Colors.black,
          fontFamily: 'Orbitron',
          fontSize: 20,
        ),
        textAlign: TextAlign.center,
      ),
      centerTitle: true,
    ),
    body: Padding(
      padding: const EdgeInsets.all(16.0),
      child: SingleChildScrollView(
        child: Column(
          children: [
            ...formFields,
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Action à implémenter
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF191A2D),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                padding:
                    const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
              ),
              child: Text(
                buttonText,
                style: TextStyle(
                  fontFamily: 'Orbitron',
                  fontSize: 16,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    ),
    bottomNavigationBar: const CustomTabBar(
      currentIndex: 0,
    ),
  );
}

// Champs de formulaire réutilisables
Widget _buildTextField({required String hintText}) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 8.0),
    child: TextField(
      cursorColor: Colors.white,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: TextStyle(
          fontFamily: 'Orbitron',
          color: Colors.white,
        ),
        filled: true,
        fillColor: const Color(0xFF9295B3),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
      ),
      style: const TextStyle(
        color: Colors.white,
        fontFamily: 'Orbitron',
      ),
    ),
  );
}

Widget _buildDropdownField(
    {required List<String> items, required String hintText}) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 8.0),
    child: DropdownButtonFormField<String>(
      items: items
          .map((item) => DropdownMenuItem(
                value: item,
                child: Text(
                  item,
                  style: TextStyle(
                    fontFamily: 'Orbitron',
                    color: Colors.white,
                  ),
                ),
              ))
          .toList(),
      onChanged: (value) {},
      dropdownColor: Color(0xFF191A2D),
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: TextStyle(
          fontFamily: 'Orbitron',
          color: Colors.white,
        ),
        filled: true,
        fillColor: const Color(0xFF9295B3),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
      ),
      icon: Icon(Icons.arrow_drop_down, color: Colors.white), // Icône blanche
    ),
  );
}

Widget _buildFileUploadField(BuildContext context,
    {required String hintText, required Function(File?) onImageSelected}) {
  return StatefulBuilder(
    builder: (BuildContext context, StateSetter setState) {
      File? selectedImage;

      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GestureDetector(
            onTap: () async {
//              final picker = //ImagePicker();
              //final XFile? image = //await picker.pickImage(source: ImageSource.gallery);
              //if (image != null) {
              setState(() {
                //selectedImage = File(image.path);
              });
              onImageSelected(
                  selectedImage); // Callback pour transmettre l'image
              //}
            },
            child: Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: const Color(0xFF9295B3),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    hintText,
                    style: TextStyle(
                      fontFamily: 'Orbitron',
                      color: Colors.white,
                    ),
                  ),
                  Icon(Icons.download, color: Colors.white),
                ],
              ),
            ),
          ),
          if (selectedImage !=
              null) // Afficher l'image si elle est sélectionnée
            Padding(
              padding: const EdgeInsets.only(top: 16.0),
              child: Image.file(
                selectedImage!,
                height: 100,
              ),
            ),
        ],
      );
    },
  );
}
