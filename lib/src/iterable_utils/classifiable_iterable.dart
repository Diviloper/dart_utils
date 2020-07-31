extension ClassifiableIterable<T> on Iterable<T> {
  List<List<T>> classify(List<bool Function(T)> classifiers, {bool multiple = false}) {
    final classified = List.generate(classifiers.length + 1, (_) => <T>[]);
    for (final value in this) {
      bool classifiedValue = false;
      for (int i = 0; i < classifiers.length; ++i) {
        if (classifiers[i](value)) {
          classifiedValue = true;
          classified[i].add(value);
          if (!multiple) {
            break;
          }
        }
      }
      if (!classifiedValue) classified.last.add(value);
    }
    return classified;
  }
}
