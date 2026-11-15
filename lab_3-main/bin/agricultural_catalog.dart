void main() {
  List<String> cropHistory = [];

  // 1. Comprobar lista vacía
  if (cropHistory.isEmpty) {
    print('History is currently empty.');
  }

  // 2. Agregar nombres
  cropHistory.addAll(['Coffee', 'Plantain', 'Coffee', 'Avocado']);

  // 3. Mostrar posiciones
  for (int i = 0; i < cropHistory.length; i++) {
    print('Position $i: ${cropHistory[i]}');
  }

  // 4. Buscar existente y búsqueda fallida
  print('Contains Coffee? ${cropHistory.contains('Coffee')}');
  print('Contains Rice? ${cropHistory.contains('Rice')}');

  // 5. Eliminar primera coincidencia y mostrar
  cropHistory.remove('Coffee');
  print('Updated history: $cropHistory');
}