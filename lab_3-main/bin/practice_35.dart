void main() {
  Map<String, double> cropAreas = {
    ' Coffee ': 125.0,
    'Beans': 15.0,
    ' Rice': 80.0,
    'COCOA ': 50.0,
  };

  // 1. Nombres ordenados con área >= 50.0
  List<String> largeCrops = cropAreas.entries
      .where((e) => e.value >= 50.0)
      .map((e) => e.key.trim())
      .toList()
    ..sort();
  print('Crops >= 50.0 ha: $largeCrops');

  // 2. Suma con fold
  double totalFold = cropAreas.values.fold<double>(0.0, (sum, area) => sum + area);

  // 3. Conjunto de nombres normalizados
  Set<String> normalizedSet = cropAreas.keys
      .map((name) => name.trim().toLowerCase())
      .toSet();
  print('Normalized set: $normalizedSet');

  // 4. Comparación con ciclo
  double totalLoop = 0.0;
  for (final area in cropAreas.values) {
    totalLoop += area;
  }
  print('Total fold: $totalFold | Total loop: $totalLoop');
}