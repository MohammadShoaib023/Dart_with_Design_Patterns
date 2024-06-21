/// Abstraction of our shape
abstract interface class Shape {
  String getName();
  String getColor();
}

/// Abstraction for our colors
abstract interface class Color {
  String getColor();
}

/// Concrete implementation of color blue
class Blue implements Color {
  @override
  String getColor() => 'Blue';
}

/// Concrete implementation of color red
class Red implements Color {
  @override
  String getColor() => 'Red';
}

/// Concrete implementation of color green
class Green implements Color {
  @override
  String getColor() => 'Green';
}

/// Concrete implementation for a circle
/// with the color relation.
class Circle implements Shape {
  Circle({required this.color});

  final Color color;

  @override
  String getName() => 'Circle';

  @override
  String getColor() => color.getColor();
}

/// Concrete implementation for a square
/// with the color relation.
class Square implements Shape {
  Square({required this.color});

  final Color color;

  @override
  String getName() => 'Square';

  @override
  String getColor() => color.getColor();
}

/// Concrete implementation for a triangle
/// with the color relation.
class Triangle implements Shape {
  Triangle({required this.color});

  final Color color;

  @override
  String getName() => 'Triangle';

  @override
  String getColor() => color.getColor();
}

void main() {
  final circle = Circle(color: Red());
  final square = Square(color: Blue());
  final triangle = Triangle(color: Green());

  print('This is a ${circle.getName()} with color ${circle.getColor()}.');
  print('This is a ${square.getName()} with color ${square.getColor()}.');
  print('This is a ${triangle.getName()} with color ${triangle.getColor()}.');

  /// Here is the result:
  /*
  This is a Circle with color Red.
  This is a Square with color Blue.
  This is a Triangle with color Green.
  */
}
