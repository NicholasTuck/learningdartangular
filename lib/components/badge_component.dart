library dart_garage.components.badge_component;

import 'package:angular/angular.dart';

@Component(
    selector: 'badge',
    templateUrl: 'packages/dart_garage/components/badge_component.html',
    cssUrl: 'packages/dart_garage/components/badge_component.css',
    publishAs: 'cmp'
)
class BadgeComponent {
  @NgAttr('name')
  String name = '';
}