library dart_garage.log.LogPanel;

import 'package:angular/angular.dart';
import 'package:dart_garage/car/Car.dart';
import 'package:observe/observe.dart';

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
    logText = 'blah';
  }
  clearLog() => logText = '';

  void attach() {
    cars.listChanges.listen(onChange);
  }

  onChange(e){
    print(e);
  }


}
