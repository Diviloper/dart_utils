import 'package:dart_utils/src/errors.dart';

Iterable<int> range({int from = 0, int? to, int step = 1}) sync* {
  if (to == null) {
    yield* _infiniteRange(from: from, step: step);
  } else {
    if (step > 0 && to < from) {
      throw ValueError('Invalid range with positive step: [$from, $to) with step $step');
    }
    if (step < 0 && to > from) {
      throw ValueError('Invalid range with negative step: [$from, $to) with step $step');
    }
    if (step == 0) {
      throw ValueError('Step cannot be zero');
    }
    yield* Iterable.generate(((to - from).abs() / step.abs()).ceil(), (index) => from + index * step);
  }
}

Iterable<int> _infiniteRange({int from = 0, int step = 1}) sync* {
  int current = from;
  while (true) {
    yield current;
    current += step;
  }
}
