import 'package:dart_utils/dart_utils.dart';
import 'package:test/test.dart';

void main() {
  test('returns a list of lists', () {
    expect([1, 3, 4, 5].classify([(x) => x > 2]), isA<List<List<int>>>());
  });

  test('puts elements at the group of the first classifier they pass when "multiple" is set to false', () {
    final actual = [1, 2, 3, 4, 5, 6].classify([(x) => x < 3, (x) => x < 5]);
    final expected = [
      [1, 2],
      [3, 4],
      [5, 6]
    ];
    expect(actual, expected);
  });

  test('puts elements at the group of every classifier they pass when "multiple" is set to true', () {
    final actual = [1, 2, 3, 4, 5, 6].classify([(x) => x < 3, (x) => x < 5], multiple: true);
    final expected = [
      [1, 2],
      [1, 2, 3, 4],
      [5, 6]
    ];
    expect(actual, expected);
  });

  test('works with any iterable', () {
    final expected = [
      [1, 2],
      [3]
    ];
    final classifiers = <bool Function(int)>[(x) => x < 3];
    expect([1, 2, 3].classify(classifiers), expected);
    expect(Iterable.generate(3, (i) => i + 1).classify(classifiers), expected);
    expect({1, 2, 3}.classify(classifiers), expected);
  });
}
