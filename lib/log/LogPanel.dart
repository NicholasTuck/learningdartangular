library dart_garage.log.LogPanel;

import 'package:angular/angular.dart';
import 'package:dart_garage/car/Car.dart';
import 'package:observe/observe.dart';
import 'dart:collection';

@Component(
    selector: 'log-panel',
    templateUrl: 'packages/dart_garage/log/LogPanel.html',
    useShadowDom: false,
    publishAs: 'cmp'
)
class LogPanel implements AttachAware {
  Scope _scope;

  @NgOneWay('cars') ObservableList<Car> cars;
  String logText = '';

  LogPanel(this._scope) {
    logText = '';
  }

  clearLog() => logText = '';

  attach() {
    cars.listChanges
      ..where(itemAdded).listen((value) => logMessage("Car Added", cars[value.first.index]))
      ..where(itemRemoved).listen((value) => logMessage("Car Removed", value.first.removed.first));
  }

  logMessage(String prefix, Car car) => logText += "$prefix: $car \n";

  itemAdded(value)=> value.first.addedCount > 0;
  itemRemoved(value)=> value.first.removed.length > 0;
}
