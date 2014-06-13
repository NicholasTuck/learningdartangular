library dart_garage.browser.GarageBrowserPanel;

import 'package:angular/angular.dart';
import 'package:dart_garage/car/Car.dart';
import 'package:observe/observe.dart';
//import 'package:polymer/polymer.dart';


@Component(
    selector: 'garage-browser-panel',
    templateUrl: 'packages/dart_garage/browser/GarageBrowserPanel.html',
    useShadowDom: false,
    publishAs: 'cmp'
)
class GarageBrowserPanel implements AttachAware {
  Scope _scope;
  @NgTwoWay('cars') List<Car> cars;
  @NgOneWayOneTime('disabled') bool disabled;

  Car _selectedCar;
  String panelTitle;

  Car carToEdit;

  GarageBrowserPanel(this._scope, RootScope rootScope) {
    _scope.on("car:saved").listen((ScopeEvent event) {
      selectedCar.copyToMe(event.data);
      rootScope.emit("global:car:saved", event.data);
    });
  }

  set selectedCar(Car car) {
    _selectedCar = car;
    carToEdit = (disabled ? car : new Car.clonedFrom(car));
  }
  Car get selectedCar => _selectedCar;

  void attach() {
    panelTitle = (disabled ? "Garage Browser" : "Garage Editor");
  }

}
