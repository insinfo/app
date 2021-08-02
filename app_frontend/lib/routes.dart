import 'package:angular_router/angular_router.dart';

import 'package:app_frontend/src/pagina1/pagina1.template.dart'
    as pagina1_template;

    
import 'package:app_frontend/src/pagina2/pagina2.template.dart'
    as pagina2_template;

class Routes {
  static final pagina1 = RouteDefinition(
    routePath: RoutePath(path: 'pagina1'),
    component: pagina1_template.Pagina1NgFactory,
    useAsDefault: true,
  );


static final pagina2 = RouteDefinition(
    routePath: RoutePath(path: 'pagina2'),
    component: pagina2_template.Pagina2NgFactory,
   
  );



  static final all = <RouteDefinition>[
    pagina1,pagina2
  ];
}
