extension NumOperators on num {
  static num add(num first, num second) => first + second;

  static num subtract(num first, num second) => first - second;

  static num multiply(num first, num second) => first * second;

  static double divide(num first, num second) => first / second;

  static num modulo(num first, num second) => first % second;

  static int divideTruncate(num first, num second) => first ~/ second;

  static num negate(num first) => -first;

  static num invert(num first) => 1 / first;
}

extension IntOperators on int {
  static int add(int first, int second) => first + second;

  static int subtract(int first, int second) => first - second;

  static int multiply(int first, int second) => first * second;

  static double divide(int first, int second) => first / second;

  static int modulo(int first, int second) => first % second;

  static int divideTruncate(int first, int second) => first ~/ second;

  static int negate(int first) => -first;

  static double invert(int first) => 1 / first;
}


extension DoubleOperators on double {
  static double add(double first, double second) => first + second;

  static double subtract(double first, double second) => first - second;

  static double multiply(double first, double second) => first * second;

  static double divide(double first, double second) => first / second;

  static double modulo(double first, double second) => first % second;

  static int divideTruncate(double first, double second) => first ~/ second;

  static double negate(double first) => -first;

  static double invert(double first) => 1 / first;
}
