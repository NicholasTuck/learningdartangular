library dart_garage.car.CarItemsList;

import 'package:angular/angular.dart';
import 'package:dart_garage/car/Car.dart';

@Component(
    selector: 'car-items-list',
    templateUrl: 'packages/dart_garage/car/CarItemsList.html',
    useShadowDom: false,
    publishAs: 'cmp'
)
class CarItemsList {

  @NgTwoWay('cars') List<Car> cars;
  @NgTwoWay('selectedCar') Car selectedCar;

  void selectCar(Car car){
    selectedCar = car;
  }

}
