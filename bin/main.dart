import 'package:dart_utils/dart_utils.dart';

void main() {
  final a = [1, 2, 3];
  final b = [4, 5, 6];
  print(a.reduce(add));
  final c = b.reduce(subtract);
  print(c.runtimeType);
}
