library dart_garage.map.MapPanel;

import 'dart:collection';
import 'package:angular/angular.dart';
import 'package:dart_garage/car/Car.dart';
import 'package:observe/observe.dart';
import 'package:dart_garage/WatchingUtil.dart';
import 'package:dart_garage/car/CarStorage.dart';

@Component(
    selector: 'map-panel',
    templateUrl: 'packages/dart_garage/map/MapPanel.html',
    useShadowDom: false,
    publishAs: 'cmp'
)
class MapPanel implements AttachAware {
  Scope _scope;

  MapPanel(this._scope);

  void attach() {

  }

}
