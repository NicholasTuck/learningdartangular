library dart_garage.remove.RemoveCarPanel;

//import 'dart:convert';
import 'dart:convert' show JSON;

import 'package:angular/angular.dart';
import 'package:dart_garage/car/Car.dart';

@Component(
  selector: 'remove-car-panel',
  templateUrl: 'packages/dart_garage/remove/RemoveCarPanel.html',
  useShadowDom: false,
  publishAs: 'cmp')
class RemoveCarPanel implements AttachAware {

  @NgTwoWay('cars') List<Car> cars;
  Car selectedCar;

  initializeSelectedCar() {
    selectedCar = (cars.isNotEmpty ? cars[0] : null);
  }

  removeSelectedCar() {
    cars.remove(selectedCar);
    initializeSelectedCar();
  }

  void attach() {
    if (selectedCar == null) {
      initializeSelectedCar();
    }
  }


}
