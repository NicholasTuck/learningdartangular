library dart_garage.map.MapPanel;

import 'dart:collection';
import 'package:angular/angular.dart';
import 'package:dart_garage/car/Car.dart';
import 'package:observe/observe.dart';
import 'package:dart_garage/WatchingUtil.dart';
import 'package:dart_garage/car/CarStorage.dart';
import 'dart:js';
import 'dart:html';

@Component(selector: 'map-panel', templateUrl: 'packages/dart_garage/map/MapPanel.html', useShadowDom: false,

publishAs: 'cmp')
class MapPanel extends ShadowRootAware implements AttachAware {
  Scope _scope;
  CarStorage _carStorage;
  List<Car> cars;

  var Cesium;
  var scene;
  var billboards;

  MapPanel(this._scope, this._carStorage);

  void attach() {
    cars = _carStorage.cars;
  }


  void onShadowRoot(ShadowRoot shadowRoot) {

    createMap();
    createBillboards();

  }

  void createMap() {
    Cesium = context['Cesium'];
//    var viewer = new JsObject(Cesium['Viewer'], ['cesiumMap']);
    JsObject widget = new JsObject(Cesium['CesiumWidget'], ['cesiumMap']);

    scene = widget['scene'];

  }

  void createBillboards() {
    billboards = new JsObject(Cesium['BillboardCollection']);

    ImageElement image = new ImageElement(src: "images/tank.png");
    image.onLoad.listen((e) {
      ImageElement image = e.target;
      JsObject textureAtlas = new JsObject(Cesium['TextureAtlas'], [new JsObject.jsify({
          'scene': scene, 'image': image
      })]);

      billboards['textureAtlas'] = textureAtlas;

      for (Car car in cars) {
        billboards.callMethod('add', [createBillboard(car)]);
      }

      scene['primitives'].callMethod('add', [billboards]);

    });

  }

  JsObject createBillboard(Car car) {
    return new JsObject.jsify({
        'position': Cesium['Cartesian3'].callMethod('fromDegrees', [car.lon, car.lat]), 'imageIndex': 0, 'id': car.id
    });

  }

}