import 'package:dart_utils/dart_utils.dart';
import 'package:test/test.dart';

void main() {
  group('Caching', () {
    late CachedFunction<int, int> cachedFib;

    int fib(int n) {
      if (n <= 0) {
        return 0;
      } else if (n <= 2) {
        return 1;
      } else {
        return fib(n - 1) + fib(n - 2);
      }
    }

    setUp(() {
      cachedFib = CachedFunction(fib);
    });

    test('Cached function yields same result', () {
      expect(cachedFib(3), fib(3));
      expect(cachedFib(5), fib(5));
      expect(cachedFib(10), fib(10));
    });

    test('Cached function yields result faster after first call with same parameter', () {
      final timer = Stopwatch();
      timer.start();
      cachedFib.call(33);
      timer.stop();
      final firstTime = timer.elapsed;
      timer
        ..reset()
        ..start();
      cachedFib.call(33);
      timer.stop();
      final cachedTime = timer.elapsed;
      expect(cachedTime < firstTime, true);
    });
  });
}
