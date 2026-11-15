import 'dart:io';

void main() {
  // 1. Pedir datos de texto (.trim() quita espacios extra al inicio o final)
  stdout.write('Departamento: ');
  String department = (stdin.readLineSync() ?? '').trim();

  stdout.write('Municipio: ');
  String municipality = (stdin.readLineSync() ?? '').trim();

  stdout.write('Cultivo: ');
  String crop = (stdin.readLineSync() ?? '').trim();

  // 2. Pedir datos numéricos y convertirlos
  stdout.write('Año de observación: ');
  int observationYear = int.parse(stdin.readLineSync() ?? '');

  stdout.write('Área sembrada (ha): ');
  double plantedArea = double.parse(stdin.readLineSync() ?? '');

  // 3. Mostrar el resumen final
  print('\n=== RESUMEN DE REGISTRO ===');
  print('Departamento: $department');
  print('Municipio: $municipality');
  print('Cultivo: $crop');
  print('Año: $observationYear');
  print('Área sembrada: $plantedArea ha');
}
