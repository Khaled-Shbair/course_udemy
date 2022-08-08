import 'package:course_udemy/youtype/Bloc/states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../api/repository/CharactersRepository.dart';
import '../models/characters.dart';

class CubitApp extends Cubit<StatesApp> {
  final CharactersRepository charactersRepository;
  List<Character> characters = [];

  CubitApp(this.charactersRepository) : super(InitialState());

  List<Character> getAllCharacters() {
    charactersRepository.getAllCharacters().then((characters) {
      emit(CharactersLoaded(listCharacters: characters));
      this.characters = characters;
    });
    return characters;
  }
}
