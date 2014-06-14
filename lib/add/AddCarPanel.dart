library dart_garage.add.AddCarPanel;

import 'package:angular/angular.dart';
import 'package:dart_garage/car/Car.dart';
import 'package:dart_garage/car/CarStorage.dart';

@Component(
    selector: 'add-car-panel',
    templateUrl: 'packages/dart_garage/add/AddCarPanel.html',
    useShadowDom: false,
    publishAs: 'cmp'
)
class AddCarPanel {

  Scope _scope;
  CarStorage _carStorage;

  Car newCar;

  List<Car> cars;

  AddCarPanel(this._scope, this._carStorage){
    cars = _carStorage.cars;
    if (newCar == null) {
      newCar = new Car(3, "Ford", "Escape", true, Car.ENGINE_TYPES[0], -80.3, 0);
    }
    _scope.on("car:saved").listen((ScopeEvent scopeEvent) => this.addCar(scopeEvent.data));
  }


  void addCar(Car car) {
    _carStorage.addCar(car);
    newCar = new Car.empty();
  }

}
