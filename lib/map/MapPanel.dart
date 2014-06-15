library dart_garage.map.MapPanel;

import 'dart:collection';
import 'package:angular/angular.dart';
import 'package:dart_garage/car/Car.dart';
import 'package:observe/observe.dart';
import 'package:dart_garage/WatchingUtil.dart';
import 'package:dart_garage/car/CarStorage.dart';
import 'dart:js';
import 'dart:html';
import 'package:dart_garage/cesium/Cesium.dart';
import 'package:dart_garage/WatchingUtil.dart';

@Component(
    selector: 'map-panel',
    templateUrl: 'packages/dart_garage/map/MapPanel.html',
    useShadowDom: false,
    publishAs: 'cmp')
class MapPanel extends ShadowRootAware implements AttachAware {
  Scope _scope;
  CarStorage _carStorage;
  ObservableList<Car> cars;

  CesiumWidget widget;
  Scene scene;
  BillboardCollection billboards;

  MapPanel(this._scope, this._carStorage);

  void attach() {
    cars = _carStorage.cars;
    cars.listChanges
      ..where(itemAdded).listen((value) => carAdded(cars[value.first.index]))
      ..where(itemRemoved).listen((value) => carRemoved(value.first.removed.first));


  }

  void onShadowRoot(ShadowRoot shadowRoot) {
    createMap();
    createBillboards();
  }

  void createMap() {
    widget = Cesium.cesiumWidget('cesiumMap');
    scene = widget.scene;
  }

  void createBillboards() {
    billboards = Cesium.billboardCollection();

    ImageElement image = new ImageElement(src: "images/tank.png");
    image.onLoad.listen((e) {
      ImageElement image = e.target;
      billboards.textureAtlas = Cesium.textureAtlas({'scene': scene, 'image': image});

      for (Car car in cars) {
        billboards.add(createBillboard(car));
      }

      scene.add(billboards);

    });

  }

  createBillboard(Car car) {
    return {
      'position': Cartesian3.fromDegrees(car.lon, car.lat),
      'imageIndex': 0,
      'id': car.id
    };
  }

  void carAdded(Car car){
    billboards.add(createBillboard(car));
  }

  void carRemoved(Car car){
    billboards.remove(car.id);
  }

}