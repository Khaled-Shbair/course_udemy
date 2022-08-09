import 'package:flutter/material.dart';

import '../constants/String.dart';
import '../constants/colors.dart';
import '../models/characters.dart';

class CharactersItem extends StatelessWidget {
  final Character character;

  const CharactersItem({Key? key, required this.character}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsetsDirectional.fromSTEB(8, 8, 8, 8),
      padding: const EdgeInsetsDirectional.all(4),
      width: double.infinity,
      decoration: BoxDecoration(
        color: MyColors.white,
        borderRadius: BorderRadius.circular(8),
      ),
      child: InkWell(
        onTap: () => Navigator.pushNamed(context, charactersDetailsScreen,
            arguments: character),
        child: GridTile(
          footer: Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            color: Colors.black54,
            alignment: Alignment.bottomCenter,
            child: Text(
              character.name,
              style: const TextStyle(
                fontSize: 15,
                color: MyColors.white,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          child: Hero(
            tag: character.charId,
            child: Container(
              child: character.img.isNotEmpty
                  ? Image.network(
                      character.img,
                      width: double.infinity,
                      height: double.infinity,
                      fit: BoxFit.cover,
                    )
                  : const Center(
                      child: CircularProgressIndicator(
                        color: MyColors.yellow,
                      ),
                    ),
            ),
          ),
        ),
      ),
    );
  }
}
