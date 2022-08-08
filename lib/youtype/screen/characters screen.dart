import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../Bloc/cubit.dart';
import '../Bloc/states.dart';
import '../constants/colors.dart';
import '../models/characters.dart';
import 'characters item.dart';

class CharactersScreen extends StatefulWidget {
  const CharactersScreen({Key? key}) : super(key: key);

  @override
  State<CharactersScreen> createState() => _CharactersScreenState();
}

class _CharactersScreenState extends State<CharactersScreen> {
  late List<Character> allCharacters;

  @override
  void initState() {
    super.initState();
    allCharacters = BlocProvider.of<CubitApp>(context).getAllCharacters();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CubitApp, StatesApp>(
      builder: (context, state) {
        if (state is CharactersLoaded) {
          allCharacters = state.listCharacters;
          return listCharacters();
        } else {
          return showLoadingIndicator();
        }
      },
    );
  }

  Widget listCharacters() {
    return SingleChildScrollView(
      child: Container(
        color: MyColors.yellow,
        child: Column(
          children: [
            GridView.builder(
              physics: ClampingScrollPhysics(),
              shrinkWrap: true,
              itemCount: allCharacters.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 2 / 3,
                crossAxisSpacing: 1,
                mainAxisSpacing: 1,
              ),
              itemBuilder: (context, index) {
                return CharactersItem(
                  character:allCharacters[index] ,
                );

              },
            )
          ],
        ),
      ),
    );
  }

  Widget showLoadingIndicator() {
    return const Center(
      child: CircularProgressIndicator(
        color: MyColors.yellow,
      ),
    );
  }
}
