import 'dart:io';

// --- Funciones de cálculo ---
double calculateLodgingTotal(int nights, double costPerNight) {
  return nights * costPerNight;
}

double calculateFoodTotal(int travelers, int days, double dailyFoodPerPerson) {
  return travelers * days * dailyFoodPerPerson;
}

double calculateGrandTotal(double transport, double lodging, double food) {
  return transport + lodging + food;
}

double calculateCostPerTraveler(double grandTotal, int travelers) {
  return grandTotal / travelers;
}

double calculateTransportShare(double transport, double grandTotal) {
  return (transport / grandTotal) * 100;
}

void main() {
  // 1. Solicitud de datos por consola
  stdout.write('Destino: ');
  String destination = (stdin.readLineSync() ?? '').trim();

  stdout.write('Cantidad de viajeros: ');
  int travelers = int.parse(stdin.readLineSync() ?? '1');

  stdout.write('Días de viaje: ');
  int days = int.parse(stdin.readLineSync() ?? '1');

  stdout.write('Noches de alojamiento: ');
  int nights = int.parse(stdin.readLineSync() ?? '0');

  stdout.write('Costo total de transporte: ');
  double transportCost = double.parse(stdin.readLineSync() ?? '0');

  stdout.write('Costo de alojamiento por noche (todo el grupo): ');
  double lodgingPerNight = double.parse(stdin.readLineSync() ?? '0');

  stdout.write('Costo diario de alimentación por persona: ');
  double foodPerPersonDay = double.parse(stdin.readLineSync() ?? '0');

  // 2. Cálculos usando nuestras funciones
  double totalLodging = calculateLodgingTotal(nights, lodgingPerNight);
  double totalFood = calculateFoodTotal(travelers, days, foodPerPersonDay);
  double grandTotal = calculateGrandTotal(
    transportCost,
    totalLodging,
    totalFood,
  );
  double costPerPerson = calculateCostPerTraveler(grandTotal, travelers);
  double transportShare = calculateTransportShare(transportCost, grandTotal);

  // 3. Presentación del informe
  print('\n========================================');
  print('      PRESUPUESTO DE EXCURSIÓN');
  print('========================================');
  print('Destino: $destination');
  print('Viajeros: $travelers | Duración: $days días / $nights noches\n');
  print(
    'Transporte: \$${transportCost.toStringAsFixed(2)} (${transportShare.toStringAsFixed(2)}%)',
  );
  print('Alojamiento total: \$${totalLodging.toStringAsFixed(2)}');
  print('Alimentación total: \$${totalFood.toStringAsFixed(2)}\n');
  print('PRESUPUESTO GENERAL: \$${grandTotal.toStringAsFixed(2)}');
  print('VALOR POR PERSONA: \$${costPerPerson.toStringAsFixed(2)}');
  print('========================================');
}
