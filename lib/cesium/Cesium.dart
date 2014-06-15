library Cesium;

import 'dart:js';


class Cesium {

  static JsObject cesiumProxy = context['Cesium'];
//  static Cartesian3 cartesian3 = new Cartesian3();
//    var widget = new JsObject(Cesium['CesiumWidget'], ['cesiumMap']);

  static CesiumWidget cesiumWidget(String divId) => new CesiumWidget(divId);
  static BillboardCollection billboardCollection() => new BillboardCollection();
  static TextureAtlas textureAtlas(var args) => new TextureAtlas(args);




}

class CesiumWidget {

  var cesiumWidgetProxy;
  Scene scene;

  CesiumWidget(String divId) {
    cesiumWidgetProxy = new JsObject(Cesium.cesiumProxy['CesiumWidget'], [divId]);
    scene = new Scene.fromProxy(cesiumWidgetProxy['scene']);
  }
}

class Scene{
  JsObject _sceneProxy;
  BillboardCollection _billboardCollection;

  Scene.fromProxy(this._sceneProxy);

  void add(BillboardCollection billboards) {
    _billboardCollection = billboards;
    _sceneProxy['primitives'].callMethod('add', [billboards._billboardCollectionProxy]);
  }

}



class BillboardCollection{
  var _billboardCollectionProxy;
  TextureAtlas _textureAtlas;
  //      billboards['textureAtlas'] = textureAtlas;


  BillboardCollection(){
    _billboardCollectionProxy = new JsObject(Cesium.cesiumProxy['BillboardCollection']);
  }

  TextureAtlas get textureAtlas => _textureAtlas;
  set textureAtlas(TextureAtlas textureAtlas) {
    _textureAtlas = textureAtlas;
    _billboardCollectionProxy['textureAtlas'] = _textureAtlas._textureAtlasProxy;
  }

  void add(var billboard) {
    _billboardCollectionProxy.callMethod('add', [new JsObject.jsify(billboard)]);
  }

}

class TextureAtlas{
  var _textureAtlasProxy;

  TextureAtlas(var args) {
    var jsifyArgs = new JsObject.jsify({
      'scene': (args['scene'] as Scene)._sceneProxy,
      'image': args['image']
    });

    _textureAtlasProxy = new JsObject(Cesium.cesiumProxy['TextureAtlas'], [jsifyArgs]);
  }
}

class Cartesian3 {
  static var _cartesian3Proxy = Cesium.cesiumProxy['Cartesian3'];

  static fromDegrees(double lon, double lat) {
    return _cartesian3Proxy.callMethod('fromDegrees', [lon, lat]);
  }

}
