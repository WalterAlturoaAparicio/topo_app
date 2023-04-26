abstract class ListRoute {}

class CalculatorDirection implements ListRoute {
  final String nombre;
  final String direction;

  CalculatorDirection(this.nombre, this.direction);
}