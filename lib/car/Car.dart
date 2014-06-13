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

  Car.empty();
  Car(this.id, this.make, this.model, this.hasBrakes, this.engineType, this.lon, this.lat);

}