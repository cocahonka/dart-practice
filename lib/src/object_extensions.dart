extension ObjectExtensions<T> on T {
  void run<R>(R Function(T it) action) => action(this);
  R let<R>(R Function(T it) action) => action(this);
}
