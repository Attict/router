// This is a copy of app_component_4.dart
import 'package:angular2/core.dart';
import 'package:angular2/router.dart';

// Not yet used: import 'compose_message_component.dart';
import 'crisis_center/crisis_center_component.dart';
import 'heroes/hero_detail_component.dart';
import 'heroes/hero_service.dart';
import 'heroes/heroes_component.dart';
import 'not_found_component.dart';

@Component(
    selector: 'my-app',
    template: '''
      <h1>Angular Router</h1>
      <nav>
        <a [routerLink]="['CrisisCenter']">Crisis Center</a>
        <a [routerLink]="['Heroes']">Heroes</a>
        <!--
        <a [routerLink]="['CrisisCenter', 'Crises', 'CrisisDetail', {'id': '1'}]">Dragon Crisis</a>
        -->
      </nav>
      <router-outlet></router-outlet>
      <!-- Note: the named outlet is not yet used:
      <router-outlet></router-outlet>
      <router-outlet name="popup"></router-outlet>
      -->
    ''',
    styles: const ['.router-link-active {color: #039be5;}'],
    directives: const [ROUTER_DIRECTIVES],
    providers: const [HeroService, ROUTER_PROVIDERS])
@RouteConfig(const [
  const Redirect(path: '/', redirectTo: const ['Heroes']),
  const Route(
      path: '/crisis-center/...',
      name: 'CrisisCenter',
      component: CrisisCenterComponent),
  const Route(path: '/heroes', name: 'Heroes', component: HeroesComponent),
  const Route(
      path: '/hero/:id', name: 'HeroDetail', component: HeroDetailComponent),
  // Not yet used: const AuxRoute(path: '/contact', name: 'Contact', component: ComposeMessageComponent),
  const Route(path: '/**', name: 'NotFound', component: NotFoundComponent)
])
class AppComponent {}
