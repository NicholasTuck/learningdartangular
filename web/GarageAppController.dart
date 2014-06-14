import 'package:angular/angular.dart';
import 'package:dart_garage/car/Car.dart';
import 'package:dart_garage/car/CarStorage.dart';
import 'package:observe/observe.dart';


@Controller(
    selector: '[garage-app]',
    publishAs: 'ctrl')
class GarageAppController {

  List<Car> cars;
  GarageAppController(CarStorage carStorage) {
    cars = carStorage.cars;
  }
}
