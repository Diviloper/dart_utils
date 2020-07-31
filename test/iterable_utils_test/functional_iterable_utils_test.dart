import 'package:dart_utils/dart_utils.dart';
import 'package:test/test.dart';

void main() {
  group('zip', () {
    test('returns iterable of tuples from sources', () {
      final first = [1, 2, 3, 4];
      final second = ['A', 'B', 'C', 'D'];
      final zipped = zip(first, second);
      expect(zipped, isA<Iterable<Tuple<int, String>>>());
      expect(zipped, [Tuple(1, 'A'), Tuple(2, 'B'), Tuple(3, 'C'), Tuple(4, 'D')]);
    });

    test('returns a list with as many elements as the shortest source', () {
      final first = [1, 2];
      final second = ['A', 'B', 'C'];
      final zipped = zip(first, second);
      final zipped2 = zip(second, first);
      expect(zipped.length, 2);
      expect(zipped2.length, 2);
    });
  });

  group('zipMap', () {
    test('returns an iterable resulting of merging the sources with the mapper function', () {
      final first = [1, 2, 3];
      final second = ['A', 'B', 'C'];
      final zipped = zipMap(first, second, (i, s) => '$i $s');
      expect(zipped, isA<Iterable<String>>());
      expect(zipped, ['1 A', '2 B', '3 C']);
    });

    test('returns a list with as many elements as the shortest source', () {
      final first = [1, 2];
      final second = ['A', 'B', 'C'];
      final zipped = zipMap(first, second, (i, s) => '$i $s');
      final zipped2 = zipMap(second, first, (s, i) => '$i $s');
      expect(zipped.length, 2);
      expect(zipped2.length, 2);
    });
  });
}