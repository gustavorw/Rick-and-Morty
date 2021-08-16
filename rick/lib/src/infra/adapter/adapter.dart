import 'package:rick/src/domain/entities/character_entity.dart';

class Adapter {
  static List<CharacterEntity> jsonToList(List json) {
    return json
        .map((e) => CharacterEntity(
              e['name'],
              e['status'],
              e['image'],
            ))
        .toList();
  }
}
