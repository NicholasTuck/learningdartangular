import 'package:angular/angular.dart';
import 'package:dart_garage/car/Car.dart';
import 'package:observe/observe.dart';


@Controller(
    selector: '[garage-app]',
    publishAs: 'ctrl')
class GarageAppController {

  ObservableList<Car> cars = new ObservableList();

  GarageAppController() {
  }
}
