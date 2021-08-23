void main() {
  const String partOne = 'Hello';
  const String partTwo = 'World';

  // The following syntax deactivates a lint on a per-line bases:
  print('$partOne $partTwo');
}

abstract class Base {
  int methodA(int foo);
  String methodB(String foo);
}

class Sub extends Base {
  @override
  int methodA(int bar) => bar;

  @override
  String methodB(String bar) => bar;
}
