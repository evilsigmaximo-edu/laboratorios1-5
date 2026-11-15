void main() {
  // Constante para la unidad de superficie
  const String areaUnit = 'ha';

  // Variables con los datos del cultivo
  String department = 'Antioquia';
  String municipality = 'Andes';
  String crop = 'Coffee';
  int observationYear = 2025;
  double plantedArea = 80.0;
  bool isPreliminary = true;

  print('=== FICHA INICIAL ===');
  print('Departamento: $department');
  print('Municipio: $municipality');
  print('Cultivo: $crop');
  print('Año: $observationYear');
  print('Superficie: $plantedArea $areaUnit');
  print('Dato preliminar: $isPreliminary');

  // Reasignamos valores (sin repetir double ni bool)
  plantedArea = 82.5;
  isPreliminary = false;

  print('');
  print('=== FICHA CORREGIDA ===');
  print('Departamento: $department');
  print('Municipio: $municipality');
  print('Cultivo: $crop');
  print('Año: $observationYear');
  print('Superficie: $plantedArea $areaUnit');
  print('Dato preliminar: $isPreliminary');
}
