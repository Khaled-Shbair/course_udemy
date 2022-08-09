import 'package:course_udemy/youtype/models/characters.dart';
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

  Route onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case charactersDetailsScreen:
        final character = settings.arguments as Character;
        return MaterialPageRoute(
            builder: (context) =>
                CharactersDetailsScreen(character: character));
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
