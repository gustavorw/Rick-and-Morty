import 'dart:convert';
import 'package:mobx/mobx.dart';
import 'package:rick/src/models/rickAndMorty.dart';
import 'package:http/http.dart' as http;
part 'controller.g.dart';


class Controller = _ControllerBase with _$Controller;

abstract class _ControllerBase with Store {
  @observable
  ObservableList<Character> _characters = ObservableList<Character>();

  String nextUrl = "https://rickandmortyapi.com/api/character/";

  @computed
  ObservableList<Character> get characters => _characters;

  @action
  addCharacter() {
    print(_characters.length);
    nextPageRickAndMorty().then((value) {
      for(var c in value.characters){
        _characters.add(c);
        print(c.name);
      }
      nextUrl = value.info.next;
    });
  }

  
  Future<RickAndMorty> nextPageRickAndMorty() async {
    try {
      var response = await http.get(nextUrl);
      var json = jsonDecode(response.body);
      return RickAndMorty.fromJson(json);
    } catch (error) {
      print(error);
      return null;
    }
  }
}
