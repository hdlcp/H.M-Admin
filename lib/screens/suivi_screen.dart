import 'package:flutter/material.dart';
import '../screens/custom_tab_bar.dart';

class SuiviScreen extends StatelessWidget {
  SuiviScreen({Key? key}) : super(key: key);

  final List<String> days = ['Lun', 'Mar', 'Mer', 'Jeu', 'Ven', 'Sam', 'Dim'];
  final List<double> weeklyRevenue = [10, 30, 50, 70, 90, 120, 150];

  final List<String> employees = [
    'Roméo',
    'Luc',
    'Jacques',
    'Gloria',
    'Justine'
  ];
  final List<double> employeeRevenue = [80, 50, 70, 60, 40];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // Fond blanc
      body: SingleChildScrollView(
        child: Padding(
          padding:
              const EdgeInsets.only(top: 30, bottom: 10, left: 10, right: 10.0),
          child: Column(
            children: [
              // Première boîte : Revenus générés cette semaine
              _buildGraphBox(
                context,
                title: "Revenus générés cette Semaine",
                graph: _buildLineChart(days, weeklyRevenue),
              ),

              const SizedBox(height: 16),

              // Deuxième boîte : Revenus par employé
              _buildGraphBox(
                context,
                title: "Revenus par employé par mois",
                graph: _buildBarChart(employees, employeeRevenue),
                actions: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    _buildDropdown(context, "Juin", ["Juin", "Mai", "Avril"]),
                    const SizedBox(width: 8),
                    _buildDropdown(context, "2024", ["2024", "2023", "2022"]),
                  ],
                ),
              ),

              const SizedBox(height: 16),

              // Troisième boîte : Nombre de clients servis
              _buildGraphBox(
                context,
                title: "Nombre de clients servis",
                graph: _buildStats(context),
              ),
            ],
          ),
        ),
      ),
      // TabBar
      bottomNavigationBar: const CustomTabBar(currentIndex: 1),
    );
  }

  Widget _buildGraphBox(
    BuildContext context, {
    required String title,
    required Widget graph,
    Widget? actions,
  }) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: const Color(0xFF9295B3),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Titre et actions
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  title,
                  style: const TextStyle(
                    fontFamily: 'Orbitron',
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
              if (actions != null) actions,
            ],
          ),
          const SizedBox(height: 16),
          // Graphique
          graph,
        ],
      ),
    );
  }

  Widget _buildLineChart(List<String> labels, List<double> data) {
    return SizedBox(
      height: 120,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: labels.length,
        itemBuilder: (context, index) {
          final barHeight =
              data[index] / 150 * 100; // Proportion pour éviter débordement
          return Column(
            children: [
              Container(
                height: barHeight,
                width: 20,
                margin: const EdgeInsets.symmetric(horizontal: 8),
                decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.circular(4),
                ),
              ),
              const SizedBox(height: 4),
              Text(
                labels[index],
                style: const TextStyle(
                  fontFamily: 'Orbitron',
                  fontSize: 10,
                  color: Colors.white,
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  Widget _buildBarChart(List<String> labels, List<double> data) {
    return SizedBox(
      height: 120,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: labels.length,
        itemBuilder: (context, index) {
          final barHeight =
              data[index] / 100 * 100; // Proportion pour éviter débordement
          return Column(
            children: [
              Container(
                height: barHeight,
                width: 20,
                margin: const EdgeInsets.symmetric(horizontal: 8),
                decoration: BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.circular(4),
                ),
              ),
              const SizedBox(height: 4),
              Text(
                labels[index],
                style: const TextStyle(
                  fontFamily: 'Orbitron',
                  fontSize: 10,
                  color: Colors.white,
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  Widget _buildStats(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildStatRow("Totale :", "134000"),
        const SizedBox(height: 8),
        _buildStatRow("Année :", "6700",
            action: _buildDropdown(context, "2024", ["2024", "2023", "2022"])),
        const SizedBox(height: 8),
        _buildStatRow("Mois :", "600",
            action: _buildDropdown(context, "Juin", ["Juin", "Mai", "Avril"])),
      ],
    );
  }

  Widget _buildStatRow(String label, String value, {Widget? action}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontFamily: 'Orbitron',
            fontSize: 14,
            color: Colors.white,
          ),
        ),
        Row(
          children: [
            Text(
              value,
              style: const TextStyle(
                fontFamily: 'Orbitron',
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            if (action != null) ...[const SizedBox(width: 8), action],
          ],
        ),
      ],
    );
  }

  Widget _buildDropdown(
      BuildContext context, String value, List<String> items) {
    return DropdownButton<String>(
      dropdownColor: const Color(0xFF9295B3),
      value: value,
      items: items
          .map(
            (item) => DropdownMenuItem(
              value: item,
              child: Text(
                item,
                style: const TextStyle(
                  fontFamily: 'Orbitron',
                  fontSize: 12,
                  color: Colors.white,
                ),
              ),
            ),
          )
          .toList(),
      onChanged: (newValue) {
        _showConfirmationDialog(
            context, "Confirmation", "Vous avez sélectionné $newValue.");
      },
    );
  }

  void _showConfirmationDialog(
      BuildContext context, String title, String content) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        title: Text(
          title,
          style: const TextStyle(
            fontFamily: 'Orbitron',
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        content: Text(
          content,
          style: const TextStyle(
            fontFamily: 'Orbitron',
            fontSize: 14,
          ),
        ),
        actions: [
          Center(
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF191A2D),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              onPressed: () => Navigator.pop(context),
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
}
