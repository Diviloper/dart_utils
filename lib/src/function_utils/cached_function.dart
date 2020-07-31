class CachedFunction<P, R> {
  final Map<P, R> _memory = {};
  final R Function(P) _function;

  CachedFunction(R Function(P) function) : _function = function;

  R call(P param) {
    if (!_memory.containsKey(param)) {
      _memory[param] = _function(param);
    }
    return _memory[param]!;
  }
}
