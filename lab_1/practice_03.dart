void main() {
  // 1. Datos de entrada (superficies en hectáreas)
  double firstCropArea = 120.0;
  double secondCropArea = 80.0;
  double thirdCropArea = 50.0;

  // 2. Cálculos matemáticos
  double totalArea = firstCropArea + secondCropArea + thirdCropArea;
  double averageArea = totalArea / 3;
  double firstCropShare = (firstCropArea / totalArea) * 100;

  // 3. Presentación de resultados (con 2 decimales)
  print('=== RESUMEN NUMÉRICO DE CULTIVOS ===');
  print('Total registrado: ${totalArea.toStringAsFixed(2)} ha');
  print('Promedio por cultivo: ${averageArea.toStringAsFixed(2)} ha');
  print(
    'Participación del primer cultivo: ${firstCropShare.toStringAsFixed(2)}%',
  );
}
