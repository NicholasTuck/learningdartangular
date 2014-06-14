library dart_garage.log.LogPanel;

import 'package:angular/angular.dart';
import 'package:dart_garage/car/Car.dart';
import 'package:observe/observe.dart';
import 'dart:collection';
import 'package:dart_garage/WatchingUtil.dart';
import 'package:dart_garage/car/CarStorage.dart';

@Component(
    selector: 'log-panel',
    templateUrl: 'packages/dart_garage/log/LogPanel.html',
    useShadowDom: false,
    publishAs: 'cmp'
)
class LogPanel implements AttachAware {
  Scope _scope;
  ObservableList<Car> cars;
  String logText = '';

  LogPanel(this._scope, RootScope rootScope, CarStorage carStorage) {
    logText = '';
    rootScope.on("global:car:saved").listen((ScopeEvent e) {
      logMessage("Car Changed", e.data);
    });
    cars = carStorage.cars;
  }

  clearLog() => logText = '';

  attach() {
    cars.listChanges
      ..where(itemAdded).listen((value) => logMessage("Car Added", cars[value.first.index]))
      ..where(itemRemoved).listen((value) => logMessage("Car Removed", value.first.removed.first));
  }

  logMessage(String prefix, Car car) => logText = "$prefix: $car \n"
                                                  + logText;

}
