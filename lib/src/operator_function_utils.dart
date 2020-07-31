T add<T extends num>(T first, T second) => (first + second) as T;

T subtract<T extends num>(T first, T second) => (first - second) as T;

T multiply<T extends num>(T first, T second) => (first * second) as T;

double divide<T extends num>(T first, T second) => first / second;

T modulo<T extends num>(T first, T second) => (first % second) as T;

int divideTruncate<T extends num>(T first, T second) => first ~/ second;

T negate<T extends num>(T first) => -first as T;

double invert<T extends num>(T first) => 1 / first;
