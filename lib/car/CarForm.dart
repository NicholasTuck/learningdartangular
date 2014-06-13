library dart_garage.car.CarForm;

//import 'dart:convert';
import 'dart:convert' show JSON;

import 'package:angular/angular.dart';
import 'package:dart_garage/car/Car.dart';

@Component(
    selector: 'car-form',
    templateUrl: 'packages/dart_garage/car/CarForm.html',
    useShadowDom: false,
    publishAs: 'cmp'
)
class CarForm {

  Scope _scope;
  @NgTwoWay('car')
  Car car;
  var engineTypes = Car.ENGINE_TYPES;

  CarForm(this._scope) {
  }

  void saveCar() {
      _scope.emit("car:saved", car);
  }


/**
 *
 *       return {
    restrict: 'E',
    templateUrl: 'app/car/carForm.html',
    scope: {
    car: '=',
    disabled: '@'
    },
    controllerAs: 'ctrl',
    controller: function ($scope, $rootScope, garageStorage) {
    $scope.engineTypes = garageStorage.getEngineTypes();

    $scope.addCar = function () {
    $scope.$emit("car:saved", $scope.car);

    $rootScope.$broadcast('car:added', $scope.car);
    };
    }
    };
 */

}