import 'dart:io';

String? readRequiredText(String prompt) {
  while (true) {
    stdout.write(prompt);
    String? input = stdin.readLineSync();
    if (input == null) return null;
    String trimmed = input.trim();
    if (trimmed.isNotEmpty) return trimmed;
    print('Error: Input cannot be empty.');
  }
}

int? readIntInRange(String prompt, int min, int max) {
  while (true) {
    stdout.write(prompt);
    String? input = stdin.readLineSync();
    if (input == null) return null;
    int? value = int.tryParse(input.trim());
    if (value != null && value >= min && value <= max) return value;
    print('Error: Enter a number between $min and $max.');
  }
}

bool registerBook(Map<String, Map<String, String>> catalog) {
  String? rawCode = readRequiredText('Book unique code: ');
  if (rawCode == null) return false;
  String code = rawCode.trim().toUpperCase();

  if (catalog.containsKey(code)) {
    print('Error: A book with code "$code" already exists.');
    return true;
  }

  String? title = readRequiredText('Title: ');
  if (title == null) return false;

  String? rawGenre = readRequiredText('Genre: ');
  if (rawGenre == null) return false;
  String genre = rawGenre.trim().toLowerCase();

  int? year = readIntInRange('Publication year (1450-2026): ', 1450, 2026);
  if (year == null) return false;

  catalog[code] = {
    'title': title.trim(),
    'genre': genre,
    'year': year.toString(),
  };

  print('Book "$code" registered successfully.');
  return true;
}

void listBooks(Map<String, Map<String, String>> catalog) {
  if (catalog.isEmpty) {
    print('The library catalog is empty.');
    return;
  }

  List<String> sortedCodes = catalog.keys.toList()..sort();
  print('\n--- Registered Books (${catalog.length}) ---');
  for (final code in sortedCodes) {
    final book = catalog[code]!;
    print('[$code] "${book['title']}" (${book['year']}) - Genre: ${book['genre']}');
  }
}

bool searchByCode(Map<String, Map<String, String>> catalog) {
  if (catalog.isEmpty) {
    print('The library catalog is empty.');
    return true;
  }

  String? rawCode = readRequiredText('Enter book code: ');
  if (rawCode == null) return false;
  String code = rawCode.trim().toUpperCase();

  Map<String, String>? book = catalog[code];
  if (book == null) {
    print('Book with code "$code" not found.');
    return true;
  }

  print('\nBook Found:');
  print('  Code:  $code');
  print('  Title: ${book['title']}');
  print('  Genre: ${book['genre']}');
  print('  Year:  ${book['year']}');
  return true;
}

void showGenreStats(Map<String, Map<String, String>> catalog) {
  if (catalog.isEmpty) {
    print('The library catalog is empty.');
    return;
  }

  Set<String> uniqueGenres = <String>{};
  Map<String, int> genreCounts = <String, int>{};

  for (final book in catalog.values) {
    String genre = book['genre']!;
    uniqueGenres.add(genre);
    genreCounts[genre] = (genreCounts[genre] ?? 0) + 1;
  }

  List<String> sortedGenres = uniqueGenres.toList()..sort();
  print('\n--- Unique Genres (${sortedGenres.length}) ---');
  for (final genre in sortedGenres) {
    print('- $genre: ${genreCounts[genre]} book(s)');
  }
}

bool filterByGenre(Map<String, Map<String, String>> catalog) {
  if (catalog.isEmpty) {
    print('The library catalog is empty.');
    return true;
  }

  String? rawGenre = readRequiredText('Enter genre to consult: ');
  if (rawGenre == null) return false;
  String targetGenre = rawGenre.trim().toLowerCase();

  List<String> matchingTitles = catalog.values
      .where((book) => book['genre'] == targetGenre)
      .map((book) => '${book['title']} (${book['year']})')
      .toList()
    ..sort();

  if (matchingTitles.isEmpty) {
    print('No books found for genre "$targetGenre".');
    return true;
  }

  print('\nBooks in "$targetGenre":');
  for (final item in matchingTitles) {
    print('  * $item');
  }
  return true;
}

void main() {
  Map<String, Map<String, String>> catalog = <String, Map<String, String>>{};

  while (true) {
    print('\n==============================');
    print('   COMMUNITY LIBRARY CATALOG');
    print('==============================');
    print('1. Register book');
    print('2. List all books');
    print('3. Search book by code');
    print('4. Show unique genres & counts');
    print('5. Search books by genre');
    print('0. Exit');

    int? option = readIntInRange('Option: ', 0, 5);
    if (option == null || option == 0) {
      print('Closing library catalog.');
      return;
    }

    switch (option) {
      case 1:
        if (!registerBook(catalog)) return;
      case 2:
        listBooks(catalog);
      case 3:
        if (!searchByCode(catalog)) return;
      case 4:
        showGenreStats(catalog);
      case 5:
        if (!filterByGenre(catalog)) return;
    }
  }
}