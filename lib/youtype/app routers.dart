import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'Bloc/cubit.dart';
import 'api/characters web services.dart';
import 'api/repository/CharactersRepository.dart';
import 'constants/String.dart';
import 'screen/characters details screen.dart';
import 'screen/characters screen.dart';

class AppRouters {
  late CubitApp cubitApp;
  late CharactersRepository charactersRepository;

  AppRouters() {
    charactersRepository = CharactersRepository(CharactersWebServices());
    cubitApp = CubitApp(charactersRepository);
  }

  Route onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case charactersDetailsScreen:
        return MaterialPageRoute(
            builder: (context) => const CharactersDetailsScreen());
      default:
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => cubitApp,
            child: const CharactersScreen(),
          ),
        );
    }
  }
}
