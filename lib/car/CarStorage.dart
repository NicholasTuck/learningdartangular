library dart_garage.car.CarStorage;
import 'package:observe/observe.dart';
import 'package:dart_garage/car/Car.dart';


class CarStorage {
  int _carIdCounter = 0;
  ObservableList<Car> cars = new ObservableList();

  CarStorage() {
    cars
      ..add(new Car(3, "Nissan", "Altima", false, Car.ENGINE_TYPES[0], -100.0, 27.0))
      ..add(new Car(3, "Ford", "Focus", true, Car.ENGINE_TYPES[2], -98.2, 40.0))
      ..add(new Car(3, "GMC", "4x4", false, Car.ENGINE_TYPES[1], -120.0, 37.0))
      ..add(new Car(3, "Mazda", "3", true, Car.ENGINE_TYPES[3], 25.0, 27.0))
    ;
  }

  addCar(Car car) {
    car.id = _carIdCounter;
    _carIdCounter++;
    cars.add(car);
  }

}
