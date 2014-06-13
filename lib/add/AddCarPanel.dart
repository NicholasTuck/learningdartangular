library dart_garage.add.AddCarPanel;

import 'package:angular/angular.dart';
import 'package:dart_garage/car/CarForm.dart';


@Component(
    selector: 'add-car-panel',
    templateUrl: 'packages/dart_garage/add/AddCarPanel.html',
    useShadowDom: false,
    publishAs: 'cmp'
)
class AddCarPanel {

  Scope _scope;
  Car car;


  AddCarPanel(this._scope){
    if (car == null) {
      car = new Car(3, "Nissan", "Altima", false, Car.ENGINE_TYPES[0], -100.0, 27.0);
    }
  }



/**
 *
*   $scope.cars = garageStorage.getAllCars();
    $scope.car = garageStorage.makeFakeCar();

    $scope.$on('car:saved', function(event, car){
    garageStorage.addCar(car);
    $scope.car = garageStorage.makeFakeCar();
    });
 */
}
