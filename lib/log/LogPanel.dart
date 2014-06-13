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
    cars.listChanges.listen(onChange);
  }

  onChange(List<ListChangeRecord> e){
    if(e.first.addedCount > 0) {
      logText += "Added Car: ${cars[e.first.index]}";
    };
    if(e.first.removed.length > 0) {
      logText += "Removed Car: ${e.first.removed.first} \n";
    }
  }


}
