import 'package:dart_utils/dart_utils.dart';
import 'package:dart_utils/src/errors.dart';
import 'package:test/test.dart';

void main() {
  test('returns an iterable', () {
    expect(range(to: 10), isA<Iterable<int>>());
  });

  test('returns an iterable from 0 to "to" (exclusive) if from is not specified', () {
    expect(range(to: 5), [0, 1, 2, 3, 4]);
  });

  test('returns an iterable from "from" (inclusive) to "to" (exclusive) when both specified', () {
    expect(range(from: 5, to: 10), [5, 6, 7, 8, 9]);
  });

  test('returns an iterable from "from" (inclusive) to "to" (exclusive) with "step" step if specified', () {
    expect(range(from: 4, to: 10, step: 2), [4, 6, 8]);
    expect(range(from: 4, to: 10, step: 10), [4]);
  });

  test('return descending range is step is negative', () {
    expect(range(from: 10, to: 0, step: -2), [10, 8, 6, 4, 2]);
  });

  test('returns an empty iterator if "from" equals "to"', () {
    expect(range(from: 15, to: 15), Iterable.empty());
    expect(range(to: 0), Iterable.empty());
  });

  test('returns infinite range if to is not passed', () {
    expect(range().take(10), [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]);
  });

  test('returns infinite range starting at "from" and step "step" if to is not passed', () {
    expect(range(from: 4, step: 3).take(4), [4, 7, 10, 13]);
  });

  test('throws ValueError when "to" is smaller than "from" and step is positive', () {
    expect(() => range(from: 10, to: 0), throwsA(isA<ValueError>()));
  });

  test('throws ValueError when "to" is larger than "from" and step is negative', () {
    expect(() => range(from: 0, to: 10, step: -1), throwsA(isA<ValueError>()));
  });

  test('throws ValueError if step is 0', () {
    expect(() => range(from: 0, to: 10, step: 0), throwsA(isA<ValueError>()));
  });
}
