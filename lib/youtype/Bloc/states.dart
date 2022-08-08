import '../models/characters.dart';

abstract class StatesApp {}

class InitialState extends StatesApp {}

class CharactersLoaded extends StatesApp {
  final List<Character> listCharacters;

  CharactersLoaded({required this.listCharacters});
}
