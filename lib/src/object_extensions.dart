extension ObjectExtensions on Object? {
  void run<T, R>(R Function(T) action) => action(this as T);
}
