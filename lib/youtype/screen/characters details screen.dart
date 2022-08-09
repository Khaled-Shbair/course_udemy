import 'package:flutter/material.dart';

import '../models/characters.dart';

class CharactersDetailsScreen extends StatefulWidget {
  const CharactersDetailsScreen({Key? key, required this.character})
      : super(key: key);
  final Character character;

  @override
  State<CharactersDetailsScreen> createState() =>
      _CharactersDetailsScreenState();
}

class _CharactersDetailsScreenState extends State<CharactersDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
