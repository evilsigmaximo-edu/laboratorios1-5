// 1. Función que suma 3 áreas y DEVUELVE el resultado
double calculateTotalArea(double first, double second, double third) {
  return first + second + third;
}

// 2. Función que calcula el promedio y DEVUELVE el resultado
double calculateAverageArea(double total, int count) {
  return total / count;
}

// 3. Función que solo MUESTRA una ficha (no devuelve nada, por eso es void)
void showObservation(String municipality, String crop, double area) {
  print(
    'Municipio: $municipality | Cultivo: $crop | Área: ${area.toStringAsFixed(2)} ha',
  );
}

void main() {
  // --- Primer juego de datos ---
  double total1 = calculateTotalArea(120.0, 80.0, 50.0);
  double average1 = calculateAverageArea(total1, 3);

  showObservation('Andes', 'Coffee', total1);
  print('Promedio por cultivo: ${average1.toStringAsFixed(2)} ha\n');

  // --- Segundo juego de datos (reutilizando las mismas funciones) ---
  double total2 = calculateTotalArea(45.5, 30.0, 24.5);
  double average2 = calculateAverageArea(total2, 3);

  showObservation('Jardín', 'Avocado', total2);
  print('Promedio por cultivo: ${average2.toStringAsFixed(2)} ha');
}
