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

  Car selectedCar;
  String panelTitle;

  Car carToEdit;

  GarageBrowserPanel(this._scope, RootScope rootScope) {
    _scope.on("car:saved").listen((ScopeEvent event) {
      selectedCar.copyToMe(event.data);
      rootScope.emit("global:car:saved", event.data);
    });

    _scope.on("car:selected").listen((ScopeEvent event) {
      Car theSelectedCar = event.data;
      carToEdit = (disabled ? theSelectedCar : new Car.clonedFrom(theSelectedCar));
    });
  }

  void attach() {
    panelTitle = (disabled ? "Garage Browser" : "Garage Editor");
  }

}
