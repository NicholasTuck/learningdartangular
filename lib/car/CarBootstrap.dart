library dart_garage.car.CarBootstrap;

import 'package:angular/angular.dart';
import 'package:dart_garage/car/CarForm.dart';
import 'package:dart_garage/car/CarItemsList.dart';
import 'package:dart_garage/car/CarStorage.dart';



void bootstrapCar(Module module) {
  module
    ..type(CarForm)
    ..type(CarItemsList)
    ..type(CarStorage)
    ;
}