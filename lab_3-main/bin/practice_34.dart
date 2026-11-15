void main() {
  Map<String, Map<String, double>> observations = {
    'Andes (2025)': {'Coffee': 125.0, 'Plantain': 75.0},
    'Andes (2024)': {'Coffee': 110.0, 'Beans': 40.0},
    'La Mesa (2025)': {'Cocoa': 20.0, 'Avocado': 30.0},
  };

  print('Available IDs: ${observations.keys.toList()}');

  for (final entry in observations.entries) {
    String id = entry.key;
    Map<String, double> crops = entry.value;
    double total = 0.0;
    for (final area in crops.values) {
      total += area;
    }
    print('$id -> Crops: ${crops.length}, Total Area: $total ha');
  }

  // Consulta inexistente
  String searchKey = 'Rionegro (2025)';
  if (observations[searchKey] == null) {
    print('Observation "$searchKey" not found.');
  }

  // Comprobación de independencia
  observations['Rionegro (2025)'] = {'Rice': 50.0};
  print('Total observations now: ${observations.length}');
  print('Andes (2025) unchanged: ${observations['Andes (2025)']}');
}