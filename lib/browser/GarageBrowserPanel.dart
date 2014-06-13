library dart_garage.browser.GarageBrowserPanel;

import 'package:angular/angular.dart';
import 'package:dart_garage/car/Car.dart';


@Component(
    selector: 'garage-browser-panel',
    templateUrl: 'packages/dart_garage/browser/GarageBrowserPanel.html',
    useShadowDom: false,
    publishAs: 'cmp'
)
class GarageBrowserPanel implements AttachAware {
  @NgTwoWay('cars') List<Car> cars;
  @NgAttr('disabled') bool disabled;

  Car selectedCar;
  String panelTitle;

  void attach() {
    panelTitle = (disabled ? "Garage Browser" : "Garage Editor");
  }

}
