import 'package:flutter_test/flutter_test.dart';
import 'package:xera_task/models/utilities/shared_preferences/shared_preferences.dart';

void main() {
  late SharedPreferences sharedPreferences;
  setUp(() {
    sharedPreferences = SharedPreferences.instance;
  });

  group(
      "saving movies search to search History, retrieving them and clearing history",
      () {
    test("clearing search History", () async {
      bool result = await sharedPreferences.removeMoviesSearchHistory();
      expect(result, true);
    });

    test("saving a movie search to search History", () async {
      const String firstQuery = 'Puss In Boots';
      bool result =
          await sharedPreferences.saveToMoviesSearchHistory(query: firstQuery);
      expect(result, true);
    });

    test("retrieving a movie search from search History", () async {
      List<String> result = await sharedPreferences.getMoviesSearchHistory();
      expect(result, ['Puss In Boots']);
    });

    test("saving a movie search to search History", () async {
      const String secondQuery = 'M3GAN';
      bool result =
          await sharedPreferences.saveToMoviesSearchHistory(query: secondQuery);
      expect(result, true);
    });

    test("retrieving a movie search from search History", () async {
      List<String> result = await sharedPreferences.getMoviesSearchHistory();
      expect(result, ['M3GAN', 'Puss In Boots']);
    });
  });
}
