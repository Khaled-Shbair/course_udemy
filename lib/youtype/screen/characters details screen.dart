import 'package:course_udemy/youtype/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../models/characters.dart';

class CharactersDetailsScreen extends StatelessWidget {
  const CharactersDetailsScreen({Key? key, required this.character})
      : super(key: key);
  final Character character;

  Widget builtSliversAppBar() {
    return SliverAppBar(
      backgroundColor: MyColors.grey,
      expandedHeight: 600,
      pinned: true,
      stretch: true,
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: true,
        title: Text(
          character.nickname,
          style: const TextStyle(color: MyColors.white),
        ),
        background: Hero(
          tag: character.charId,
          child: Image.network(character.img, fit: BoxFit.cover),
        ),
      ),
    );
  }

  Widget characterInfo(String title, String value) {
    return RichText(
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
      text: TextSpan(
        children: [
          TextSpan(
            text: title,
            style: const TextStyle(
              color: MyColors.white,
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
          TextSpan(
            text: value,
            style: const TextStyle(
              color: MyColors.white,
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }

  Widget buildDivider(double endIndent) {
    return Divider(
      height: 30,
      endIndent: endIndent,
      color: MyColors.yellow,
      thickness: 2,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.grey,
      body: CustomScrollView(
        slivers: [
          builtSliversAppBar(),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                Container(
                  margin: const EdgeInsets.fromLTRB(14, 14, 14, 0),
                  padding: const EdgeInsets.all(8),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      characterInfo('Job : ', character.occupation.join(' / ')),
                      buildDivider(315),
                      characterInfo('Appeared in : ', character.category),
                      buildDivider(250),
                      characterInfo(
                          'Seasons : ', character.appearance.join(' / ')),
                      buildDivider(280),
                      characterInfo('Status : ', character.status),
                      buildDivider(300),
                      character.betterCallSaulAppearance.isEmpty
                          ? Container()
                          : characterInfo('Better Call Saul Seasons : ',
                              character.betterCallSaulAppearance.join(" / ")),
                      character.betterCallSaulAppearance.isEmpty
                          ? Container()
                          : buildDivider(150),
                      characterInfo('Actor/Actress : ', character.name),
                      buildDivider(235),
                      const SizedBox(height: 20),
                    ],
                  ),
                ),
                const SizedBox(height: 500),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
