import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:rick/src/domain/entities/character_entity.dart';
import 'package:rick/src/infra/adapter/adapter.dart';

abstract class CharacterRepository {
  Future<List<CharacterEntity>> getCharacter(int page);
}

class RickAndMortyRepositoryImpl implements CharacterRepository {
  final Dio dio;
  RickAndMortyRepositoryImpl(
    this.dio,
  );

  @override
  Future<List<CharacterEntity>> getCharacter(int page) async {
    String url = 'https://rickandmortyapi.com/api/character/?page=$page';
    try {
      final response = await dio.get(url);
      return Adapter.jsonToList(response.data['results'] as List);
    } on DioError catch (error) {
      debugPrint(error.message);
      throw Exception('');
    }
  }
}
