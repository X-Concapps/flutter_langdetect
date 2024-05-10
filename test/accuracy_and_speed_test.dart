import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_langdetect/flutter_langdetect.dart' as langdetect;

void main() {
  group('Language Detection Tests', () {
    setUpAll(() async {
      // Ensure the library is initialized before tests are run.
      await langdetect.initLangDetect();
    });

    test('Detects English correctly', () async {
      var text = 'Hello, world!';
      expect(langdetect.detect(text), 'en');
    });

    test('Detects Spanish correctly', () async {
      var text = 'Hola mundo';
      expect(langdetect.detect(text), 'es');
    });

    test('Detects French correctly', () async {
      var text = 'Bonjour le monde';
      expect(langdetect.detect(text), 'fr');
    });

    // Add more languages as necessary for your test coverage needs.

    // Performance Test
    test('Performance check for language detection', () async {
      var text = 'This is a performance test text.';
      var stopwatch = Stopwatch()..start();
      langdetect.detect(text);
      stopwatch.stop();
      int elapsedTime = stopwatch.elapsedMilliseconds;

      // You can define an acceptable max time for detection here, e.g., 100 milliseconds.
      //print('Elapsed time: $elapsedTime ms');
      assert(elapsedTime < 100);
    });
  });
}
