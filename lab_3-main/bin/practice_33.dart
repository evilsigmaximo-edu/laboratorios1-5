void main() {
  List<String> rawCrops = [
    'Coffee',
    ' coffee ',
    'COCOA',
    'Beans',
    'beans ',
    'Avocado',
  ];

  Set<String> uniqueCrops = <String>{};
  for (final crop in rawCrops) {
    uniqueCrops.add(crop.trim().toLowerCase());
  }

  print('Original records: ${rawCrops.length}');
  print('Unique crops count: ${uniqueCrops.length}');

  List<String> sortedCrops = uniqueCrops.toList()..sort();
  print('Sorted unique crops: $sortedCrops');
  print('Includes "coffee"? ${uniqueCrops.contains('coffee')}');
}