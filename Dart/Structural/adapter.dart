/// Interface for temperature readings
abstract interface class Temperature {
  double getTemperatureInKelvin();
}

/// Celsius temperature class
class Celsius {
  Celsius({required double temperature}) : _temperature = temperature;

  final double _temperature;

  double get temperature => _temperature;
}

/// Fahrenheit temperature class
class Fahrenheit {
  Fahrenheit({required double temperature}) : _temperature = temperature;

  final double _temperature;

  double get temperature => _temperature;
}

/// Adapter for Celsius to Temperature
class CelsiusAdapter implements Temperature {
  CelsiusAdapter({required this.celsius});

  final Celsius celsius;

  @override
  double getTemperatureInKelvin() {
    return celsius.temperature + 273.15;
  }
}

/// Adapter for Fahrenheit to Temperature
class FahrenheitAdapter implements Temperature {
  FahrenheitAdapter({required this.fahrenheit});

  final Fahrenheit fahrenheit;

  @override
  double getTemperatureInKelvin() {
    return (fahrenheit.temperature + 459.67) * 5 / 9;
  }
}

void main() {
  final celsius = Celsius(temperature: 25);
  final fahrenheit = Fahrenheit(temperature: 77);

  final celsiusAdapter = CelsiusAdapter(celsius: celsius);
  final fahrenheitAdapter = FahrenheitAdapter(fahrenheit: fahrenheit);

  print('Celsius Temperature: ${celsius.temperature} °C');
  print('Converted to Kelvin: ${celsiusAdapter.getTemperatureInKelvin()} K');

  print('=======================');

  print('Fahrenheit Temperature: ${fahrenheit.temperature} °F');
  print('Converted to Kelvin: ${fahrenheitAdapter.getTemperatureInKelvin()} K');

  /// Here is the result:
  /*
  Celsius Temperature: 25.0 °C
  Converted to Kelvin: 298.15 K
  =======================
  Fahrenheit Temperature: 77.0 °F
  Converted to Kelvin: 298.7055555555555 K
  */
}
