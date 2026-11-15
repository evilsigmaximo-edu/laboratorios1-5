double calculateTotal(List<double> areas) {
  double total = 0.0;
  for (final area in areas) {
    total += area;
  }
  return total;
}

double calculateAverage(List<double> areas) {
  if (areas.isEmpty) return 0.0;
  return calculateTotal(areas) / areas.length;
}

void showSummary({
  required String municipality,
  required double total,
  required double average,
}) {
  print('--- Summary: $municipality ---');
  print('Total area: ${total.toStringAsFixed(2)} ha');
  print('Average area: ${average.toStringAsFixed(2)} ha\n');
}

void main() {
  // Predicción: total 50.0, promedio 25.0
  List<double> firstList = [20.0, 30.0];
  showSummary(
    municipality: 'Andes',
    total: calculateTotal(firstList),
    average: calculateAverage(firstList),
  );

  // Predicción: total 60.0, promedio 20.0
  List<double> secondList = [10.0, 20.0, 30.0];
  showSummary(
    municipality: 'La Mesa',
    total: calculateTotal(secondList),
    average: calculateAverage(secondList),
  );
}