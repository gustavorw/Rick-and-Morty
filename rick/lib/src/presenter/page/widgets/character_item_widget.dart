import 'package:flutter/material.dart';
import 'package:rick/src/domain/entities/character_entity.dart';

class CharacterItemWidget extends StatelessWidget {
  final CharacterEntity character;

  CharacterItemWidget({this.character});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white38, borderRadius: BorderRadius.circular(40)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Text(
              character.name,
              textAlign: TextAlign.center,
              style: TextStyle(fontWeight: FontWeight.w500),
            ),
            CircleAvatar(
              radius: 49,
              backgroundImage: NetworkImage(character.image),
            ),
            Text(
              character.status,
              textAlign: TextAlign.center,
              style: TextStyle(fontWeight: FontWeight.w500),
            )
          ],
        ),
      ),
    );
  }
}
