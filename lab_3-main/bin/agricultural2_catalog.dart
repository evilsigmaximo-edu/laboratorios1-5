import 'dart:io';

// --- Lectores validados (reutilizados de Lab 02) ---

String? readRequiredText(String prompt) {
  while (true) {
    stdout.write(prompt);
    String? input = stdin.readLineSync();
    if (input == null) return null; // Fin de entrada (EOF)

    String trimmed = input.trim();
    if (trimmed.isNotEmpty) {
      return trimmed;
    }
    print('Error: Text cannot be empty.');
  }
}

int? readIntInRange(String prompt, int minimum, int maximum) {
  while (true) {
    stdout.write(prompt);
    String? input = stdin.readLineSync();
    if (input == null) return null;

    int? value = int.tryParse(input.trim());
    if (value != null && value >= minimum && value <= maximum) {
      return value;
    }
    print('Error: Enter an integer between $minimum and $maximum.');
  }
}

double? readPositiveArea(String prompt) {
  while (true) {
    stdout.write(prompt);
    String? input = stdin.readLineSync();
    if (input == null) return null;

    double? value = double.tryParse(input.trim());
    if (value != null && value.isFinite && value > 0) {
      return value;
    }
    print('Error: Enter a valid positive number.');
  }
}

// --- Funciones del catálogo ---

String createObservationKey(String municipality, int year) {
  String normalized = municipality.trim().toLowerCase();
  return '$normalized ($year)';
}

String? readUniqueCropName(
  String prompt,
  Map<String, double> currentCrops,
) {
  while (true) {
    String? name = readRequiredText(prompt);
    if (name == null) return null;

    String normalized = name.trim().toLowerCase();
    if (!currentCrops.containsKey(normalized)) {
      return normalized;
    }
    print('Crop already registered in this observation.');
  }
}

bool registerObservation(Map<String, Map<String, double>> observations) {
  String? municipality = readRequiredText('Municipality: ');
  if (municipality == null) return false;

  int? year = readIntInRange('Year (2000-2100): ', 2000, 2100);
  if (year == null) return false;

  String key = createObservationKey(municipality, year);
  if (observations.containsKey(key)) {
    print('Observation already exists.');
    return true;
  }

  int? cropCount = readIntInRange('Number of crops (1-5): ', 1, 5);
  if (cropCount == null) return false;

  Map<String, double> currentCrops = <String, double>{};

  for (int index = 1; index <= cropCount; index++) {
    String? cropName = readUniqueCropName(
      'Crop $index name: ',
      currentCrops,
    );
    if (cropName == null) return false;

    double? area = readPositiveArea('Crop $index area (ha): ');
    if (area == null) return false;

    currentCrops[cropName] = area;
  }

  observations[key] = Map<String, double>.from(currentCrops);
  print('Observation saved in memory.');
  return true;
}

void listObservations(Map<String, Map<String, double>> observations) {
  if (observations.isEmpty) {
    print('No observations registered.');
    return;
  }

  List<String> keys = observations.keys.toList()..sort();
  print('\n--- Registered Observations ---');
  for (final key in keys) {
    print('- $key');
  }
}

double calculateTotalArea(Map<String, double> crops) {
  return crops.values.fold<double>(0.0, (total, area) => total + area);
}

void showObservationSummary(String key, Map<String, double> crops) {
  if (crops.isEmpty) {
    print('No crops available.');
    return;
  }

  double totalArea = calculateTotalArea(crops);
  double averageArea = totalArea / crops.length;

  String largestCrop = '';
  double largestArea = 0.0;

  for (final entry in crops.entries) {
    if (entry.value > largestArea) {
      largestArea = entry.value;
      largestCrop = entry.key;
    }
  }

  double largestShare = totalArea > 0 ? (largestArea / totalArea * 100) : 0.0;

  print('\n=== Observation: $key ===');
  List<String> sortedCropNames = crops.keys.toList()..sort();
  for (final name in sortedCropNames) {
    print('  * $name: ${crops[name]!.toStringAsFixed(2)} ha');
  }
  print('Total area: ${totalArea.toStringAsFixed(2)} ha');
  print('Average area: ${averageArea.toStringAsFixed(2)} ha');
  print('Largest crop: $largestCrop (${largestArea.toStringAsFixed(2)} ha - ${largestShare.toStringAsFixed(2)}%)');
}

bool viewObservation(Map<String, Map<String, double>> observations) {
  if (observations.isEmpty) {
    print('No observations registered.');
    return true;
  }

  String? municipality = readRequiredText('Municipality to search: ');
  if (municipality == null) return false;

  int? year = readIntInRange('Year (2000-2100): ', 2000, 2100);
  if (year == null) return false;

  String key = createObservationKey(municipality, year);
  Map<String, double>? crops = observations[key];

  if (crops == null) {
    print('Observation not found.');
    return true;
  }

  showObservationSummary(key, crops);
  return true;
}

void showUniqueCrops(Map<String, Map<String, double>> observations) {
  Set<String> uniqueCrops = <String>{};

  for (final crops in observations.values) {
    uniqueCrops.addAll(crops.keys);
  }

  if (uniqueCrops.isEmpty) {
    print('No crops available.');
    return;
  }

  List<String> sortedNames = uniqueCrops.toList()..sort();
  print('\nUnique crop names: ${sortedNames.length}');
  for (final name in sortedNames) {
    print('- $name');
  }
}

void main() {
  Map<String, Map<String, double>> observations =
      <String, Map<String, double>>{};

  while (true) {
    print('\n==================================');
    print('        AGRODIVERSA CATALOG');
    print('==================================');
    print('1. Register observation');
    print('2. List observations');
    print('3. View observation details');
    print('4. Show unique crop names');
    print('0. Exit');

    int? option = readIntInRange('Option: ', 0, 4);

    if (option == null || option == 0) {
      print('Goodbye!');
      return;
    }

    switch (option) {
      case 1:
        if (!registerObservation(observations)) return;
      case 2:
        listObservations(observations);
      case 3:
        if (!viewObservation(observations)) return;
      case 4:
        showUniqueCrops(observations);
      default:
        print('Unknown option.');
    }
  }
}