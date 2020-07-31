import '../tuple.dart';

Iterable<Tuple<F, S>> zip<F, S>(Iterable<F> first, Iterable<S> second) sync* {
  final firstIterator = first.iterator;
  final secondIterator = second.iterator;
  while (firstIterator.moveNext() && secondIterator.moveNext()) {
    yield Tuple(firstIterator.current, secondIterator.current);
  }
}

Iterable<R> zipMap<P1, P2, R>(Iterable<P1> first, Iterable<P2> second, R Function(P1, P2) mapper) sync* {
  final firstIterator = first.iterator;
  final secondIterator = second.iterator;
  while (firstIterator.moveNext() && secondIterator.moveNext()) {
    yield mapper(firstIterator.current, secondIterator.current);
  }
}
