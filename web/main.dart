library garage;

import 'package:angular/angular.dart';

import 'package:angular/application_factory.dart';

import 'package:dart_garage/components/badge_component.dart';
import 'package:dart_garage/add/AddCarPanel.dart';
import 'package:dart_garage/car/CarForm.dart';
import 'package:dart_garage/car/CarItemsList.dart';
import 'package:dart_garage/remove/RemoveCarPanel.dart';
import 'package:dart_garage/browser/GarageBrowserPanel.dart';
import 'GarageAppController.dart';

//dart_garage.components.badge_component


//import 'package:angular_dart_demo/recipe_book.dart';
//import 'package:angular_dart_demo/formatter/category_filter.dart';
//import 'package:angular_dart_demo/rating/rating_component.dart';
//import 'package:angular_dart_demo/tooltip/tooltip.dart';
//@MirrorsUsed(override: '*')
//import 'dart:mirrors';

class GarageAppModule extends Module {
  GarageAppModule() {
    type(BadgeComponent);
    type(AddCarPanel);
    type(CarForm);
    type(GarageAppController);
    type(CarItemsList);
    type(RemoveCarPanel);
    type(GarageBrowserPanel);
//    type(RecipeBookController);
//    type(RatingComponent);
//    type(Tooltip);
//    type(CategoryFilter);
  }
}

void main() {
  applicationFactory()
    .addModule(new GarageAppModule())
    .run();
}
