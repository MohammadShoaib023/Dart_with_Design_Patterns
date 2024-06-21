/// Interface to define the car methods
abstract interface class Car {
  void drive();
}

/// Interface to define the bike methods
abstract interface class Bike {
  void ride();
}

/// Concrete implementation of car for Tesla
class TeslaCar implements Car {
  @override
  void drive() => print('Driving a Tesla Car!');
}

/// Concrete implementation of car for Ford
class FordCar implements Car {
  @override
  void drive() => print('Driving a Ford Car!');
}

/// Concrete implementation of bike for Tesla
class TeslaBike implements Bike {
  @override
  void ride() => print('Riding a Tesla Bike!');
}

/// Concrete implementation of bike for Ford
class FordBike implements Bike {
  @override
  void ride() => print('Riding a Ford Bike!');
}

/// Interface to define all factory methods
abstract interface class VehicleFactory {
  Car createCar();
  Bike createBike();
}

/// Concrete implementation of Tesla factory
class TeslaFactory implements VehicleFactory {
  @override
  Car createCar() => TeslaCar();

  @override
  Bike createBike() => TeslaBike();
}

/// Concrete implementation of Ford factory
class FordFactory implements VehicleFactory {
  @override
  Car createCar() => FordCar();

  @override
  Bike createBike() => FordBike();
}

void main() {
  final teslaFactory = TeslaFactory();
  final fordFactory = FordFactory();

  final teslaCar = teslaFactory.createCar();
  final teslaBike = teslaFactory.createBike();

  final fordCar = fordFactory.createCar();
  final fordBike = fordFactory.createBike();

  print('====Tesla Factory result====');
  teslaCar.drive();
  teslaBike.ride();

  print('====Ford Factory result====');
  fordCar.drive();
  fordBike.ride();

  /// Here is the result:
  /*
  ====Tesla Factory result====
  Driving a Tesla Car!
  Riding a Tesla Bike!
  ====Ford Factory result====
  Driving a Ford Car!
  Riding a Ford Bike!
  */
}
