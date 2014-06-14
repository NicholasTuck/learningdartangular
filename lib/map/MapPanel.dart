library dart_garage.map.MapPanel;

import 'dart:collection';
import 'package:angular/angular.dart';
import 'package:dart_garage/car/Car.dart';
import 'package:observe/observe.dart';
import 'package:dart_garage/WatchingUtil.dart';
import 'package:dart_garage/car/CarStorage.dart';
import 'dart:js';
import 'dart:html';

@Component(
    selector: 'map-panel',
    templateUrl: 'packages/dart_garage/map/MapPanel.html',
    useShadowDom: false,

    publishAs: 'cmp'
)
class MapPanel extends ShadowRootAware implements AttachAware {
  Scope _scope;
  CarStorage _carStorage;
  List<Car> cars;

  MapPanel(this._scope, this._carStorage);

  void attach() {
    List<Car> cars = _carStorage.cars;

//    createMap();
  }


  void onShadowRoot(ShadowRoot shadowRoot) {

    createMap();
  }

  void createMap(){
    var Cesium = context['Cesium'];
//    var viewer = new JsObject(Cesium['Viewer'], ['cesiumMap']);
    var widget = new JsObject(Cesium['CesiumWidget'], ['cesiumMap']);



    // js interop example
//    var object = new JsObject(context['Object']);
//    object['greeting'] = 'Hello';
//    object['greet'] = (name) => "${object['greeting']} $name";
//    var message = object.callMethod('greet', ['JavaScript']);
//    context['console'].callMethod('log', [message]);

  }

}
