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
  late List<Character> searchCharacters;
  bool isSearch = false;
  late TextEditingController searchTextController;

  @override
  void initState() {
    super.initState();
    BlocProvider.of<CubitApp>(context).getAllCharacterss();
    searchTextController = TextEditingController();
  }

  @override
  void dispose() {
    searchTextController.dispose();
    super.dispose();
  }

  Widget builtAppBarSearchFiled() {
    return TextField(
      controller: searchTextController,
      cursorColor: MyColors.grey,
      style: const TextStyle(
        color: MyColors.grey,
        fontSize: 16,
      ),
      onChanged: (String text) {
        setState(() {
          addSearchedForItemToSearchedList(text.toLowerCase());
        });
      },
      decoration: const InputDecoration(
        hintText: 'find to characters',
        hintStyle: TextStyle(
          color: MyColors.grey,
          fontSize: 16,
        ),
        border: InputBorder.none,
      ),
    );
  }

  List<Widget> _builtAppBarAction() {
    if (isSearch) {
      return [
        IconButton(
          onPressed: () {
            clearSearch();
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.clear,
            color: MyColors.grey,
          ),
        ),
      ];
    } else {
      return [
        IconButton(
          onPressed: () {
            ModalRoute.of(context)!
                .addLocalHistoryEntry(LocalHistoryEntry(onRemove: stopSearch));
            setState(() {
              isSearch = true;
            });
          },
          icon: const Icon(
            Icons.search,
            color: MyColors.grey,
          ),
        ),
      ];
    }
  }

  void stopSearch() {
    clearSearch();
    setState(() {
      isSearch = false;
    });
  }

  void clearSearch() {
    setState(() {
      searchTextController.clear();
    });
  }

// اضافة العناصر التي يبحث عنها في قائمة اخري
  void addSearchedForItemToSearchedList(String text) {
    searchCharacters = allCharacters
        .where((character) => character.name.toLowerCase().startsWith(text))
        .toList();
  }

  Widget builtAppBarTitle() {
    return const Text(
      'Characters',
      style: TextStyle(
        color: MyColors.grey,
        fontSize: 16,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: MyColors.yellow,
        centerTitle: true,
        title: isSearch ? builtAppBarSearchFiled() : builtAppBarTitle(),
        actions: _builtAppBarAction(),
      ),
      body: BlocBuilder<CubitApp, StatesApp>(
        builder: (context, state) {
          if (state is CharactersLoaded) {
            allCharacters = state.listCharacters;
            return listCharacters();
          } else {
            return showLoadingIndicator();
          }
        },
      ),
    );
  }

  Widget listCharacters() {
    return SingleChildScrollView(
      child: Container(
        color: MyColors.yellow,
        child: Column(
          children: [
            GridView.builder(
              physics: const ClampingScrollPhysics(),
              shrinkWrap: true,
              itemCount: searchTextController.text.isEmpty
                  ? allCharacters.length
                  : searchCharacters.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 1,
                mainAxisSpacing: 1,
                childAspectRatio: 2 / 3,
              ),
              itemBuilder: (context, index) {
                return CharactersItem(
                  character: searchTextController.text.isEmpty
                      ? allCharacters[index]
                      : searchCharacters[index],
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
