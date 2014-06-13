library dart_garage.car;

class Car {
  int id;
  String make;
  String model;
  bool hasBrakes;
  String engineType;
  double lon;
  double lat;

  static List<String> ENGINE_TYPES = ['Four Cylinder', 'Three Cylinder', 'Two Stroke Cycle', 'In-Line Cylinder'];

  Car(this.id, this.make, this.model, this.hasBrakes, this.engineType, this.lon, this.lat);
  Car.empty();
  Car.clonedFrom(car) {
    copyToMe(car);
  }

  copyToMe(Car car){
    id = car.id;
    make = car.make;
    model = car.model;
    hasBrakes = car.hasBrakes;
    engineType = car.engineType;
    lat = car.lat;
    lon = car.lon;
  }

  toString() {
      return "car: $id $make $model $hasBrakes $engineType $lon $lat";
  }
}