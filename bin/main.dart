import 'package:dart_utils/dart_utils.dart';

int fib(int n) => n < 2 ? n : fib(n-2) + fib(n-1);

void main() {
  final memoized = CachedFunction(fib);
  for (int i=1; i<50; ++i) {
    print('fib($i): ${memoized(i)}');
  }
}