library dart_garage.add.AddCarPanel;

import 'package:angular/angular.dart';
import 'package:dart_garage/car/Car.dart';


@Component(
    selector: 'add-car-panel',
    templateUrl: 'packages/dart_garage/add/AddCarPanel.html',
    useShadowDom: false,
    publishAs: 'cmp'
)
class AddCarPanel {

  Scope _scope;

  Car newCar;

  @NgTwoWay('cars') List<Car> cars;

  AddCarPanel(this._scope){
    if (newCar == null) {
      newCar = new Car(3, "Nissan", "Altima", false, Car.ENGINE_TYPES[0], -100.0, 27.0);
    }

    _scope.on("car:saved").listen((ScopeEvent scopeEvent) => this.addCar(scopeEvent.data));
  }


  void addCar(Car car) {
    cars.add(car);
    newCar = new Car.empty();
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
