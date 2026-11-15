import 'dart:io';

// 1. Función para calcular el área total
double calculateTotalArea(
  double firstArea,
  double secondArea,
  double thirdArea,
) {
  return firstArea + secondArea + thirdArea;
}

// 2. Función para calcular el promedio por cultivo
double calculateAverageArea(double totalArea, int cropCount) {
  return totalArea / cropCount;
}

// 3. Función para calcular el porcentaje de participación
double calculateAreaShare(double cropArea, double totalArea) {
  return (cropArea / totalArea) * 100;
}

// 4. Función para imprimir el encabezado del informe
void showReportHeader(String department, String municipality, int year) {
  print('\n========================================');
  print('      AGRICULTURAL OBSERVATION');
  print('========================================');
  print('Department: $department');
  print('Municipality: $municipality');
  print('Year: $year\n');
}

void main() {
  // --- Lectura de datos generales ---
  stdout.write('Department: ');
  String department = (stdin.readLineSync() ?? '').trim();

  stdout.write('Municipality: ');
  String municipality = (stdin.readLineSync() ?? '').trim();

  stdout.write('Observation year: ');
  int observationYear = int.parse(stdin.readLineSync() ?? '');

  // --- Lectura de los 3 cultivos ---
  stdout.write('First crop: ');
  String firstCrop = (stdin.readLineSync() ?? '').trim();
  stdout.write('First area (ha): ');
  double firstArea = double.parse(stdin.readLineSync() ?? '');

  stdout.write('Second crop: ');
  String secondCrop = (stdin.readLineSync() ?? '').trim();
  stdout.write('Second area (ha): ');
  double secondArea = double.parse(stdin.readLineSync() ?? '');

  stdout.write('Third crop: ');
  String thirdCrop = (stdin.readLineSync() ?? '').trim();
  stdout.write('Third area (ha): ');
  double thirdArea = double.parse(stdin.readLineSync() ?? '');

  // --- Cálculos usando nuestras funciones ---
  double totalArea = calculateTotalArea(firstArea, secondArea, thirdArea);
  double averageArea = calculateAverageArea(totalArea, 3);

  double firstShare = calculateAreaShare(firstArea, totalArea);
  double secondShare = calculateAreaShare(secondArea, totalArea);
  double thirdShare = calculateAreaShare(thirdArea, totalArea);

  // --- Presentación del informe ---
  showReportHeader(department, municipality, observationYear);

  print(
    '$firstCrop: ${firstArea.toStringAsFixed(2)} ha | Share: ${firstShare.toStringAsFixed(2)}%',
  );
  print(
    '$secondCrop: ${secondArea.toStringAsFixed(2)} ha | Share: ${secondShare.toStringAsFixed(2)}%',
  );
  print(
    '$thirdCrop: ${thirdArea.toStringAsFixed(2)} ha | Share: ${thirdShare.toStringAsFixed(2)}%\n',
  );

  print('Total planted area: ${totalArea.toStringAsFixed(2)} ha');
  print('Average area per crop: ${averageArea.toStringAsFixed(2)} ha\n');
  print('Data: fictional learning example.');
}
