library dart_garage.browser.GarageBrowserPanel;

import 'package:angular/angular.dart';
import 'package:dart_garage/car/Car.dart';
import 'package:observe/observe.dart';
import 'package:dart_garage/WatchingUtil.dart';


@Component(
    selector: 'garage-browser-panel',
    templateUrl: 'packages/dart_garage/browser/GarageBrowserPanel.html',
    useShadowDom: false,
    publishAs: 'cmp'
)
class GarageBrowserPanel implements AttachAware {
  Scope _scope;
  RootScope _rootScope;
  Car _selectedCar;

  @NgTwoWay('cars')  ObservableList<Car> cars;
  @NgOneWayOneTime('disabled') bool disabled;

  String panelTitle;
  Car carToEdit;

  GarageBrowserPanel(this._scope, this._rootScope) {
    _scope.on("car:saved").listen(onCarSaved);
  }

  set selectedCar(Car car) {
    _selectedCar = car;
    if(_selectedCar != null) {
      carToEdit = (disabled ? car : new Car.clonedFrom(car));
    }
  }
  Car get selectedCar => _selectedCar;

  void attach() {
    panelTitle = (disabled ? "Garage Browser" : "Garage Editor");

    cars.listChanges.where(itemRemoved).listen(onCarRemoved);
  }

  void onCarRemoved(value) {
    if (!cars.contains(selectedCar)) {
      selectedCar = null;
    }
  }

  void onCarSaved(ScopeEvent event) {
    selectedCar.copyToMe(event.data);
    _rootScope.emit("global:car:saved", event.data);
  }

}
