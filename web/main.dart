library garage;

import 'package:angular/angular.dart';
import 'package:angular/application_factory.dart';
import 'package:dart_garage/add/AddCarPanel.dart';
import 'package:dart_garage/remove/RemoveCarPanel.dart';
import 'package:dart_garage/browser/GarageBrowserPanel.dart';
import 'package:dart_garage/log/LogPanel.dart';
import 'package:dart_garage/car/CarBootstrap.dart';

import 'GarageAppController.dart';


class GarageAppModule extends Module {
  GarageAppModule() {
    type(AddCarPanel);
    type(GarageAppController);
    type(RemoveCarPanel);
    type(GarageBrowserPanel);
    type(LogPanel);
    bootstrapCar(this);
  }
}

void main() {
  applicationFactory()
    .addModule(new GarageAppModule())
    .run();
}
