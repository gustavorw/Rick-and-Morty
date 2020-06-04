import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rick/src/models/rickAndMorty.dart';



class Item extends StatelessWidget {
  final Character character;


  Item({this.character});
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