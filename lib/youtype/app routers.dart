import 'package:flutter/material.dart';

import 'constants/String.dart';
import 'screen/characters screen.dart';

class AppRouters {
  Route? onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case mainScreen:
        return MaterialPageRoute(
            builder: (context) => const CharactersScreen());
    }
    return null;
  }
}
