import 'package:angular/angular.dart';
import 'package:dart_garage/car/Car.dart';

@Controller(
    selector: '[garage-app]',
    publishAs: 'ctrl')
class GarageAppController {

  List<Car> cars = new List();

  GarageAppController() {
  }
}
