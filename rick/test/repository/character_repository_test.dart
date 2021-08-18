import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:rick/src/infra/repository/character_repository.dart';

class DioMock extends Mock implements Dio {}

final successResponseMock = Response(
  statusCode: 200,
  data: {
    "results": [
      {
        "id": 1,
        "name": "Rick Sanchez",
        "status": "Alive",
        "image": "https://rickandmortyapi.com/api/character/avatar/1.jpeg",
      }
    ],
  },
);

final errorResponseMock = Response(statusCode: 400, data: {});

void main() {
  final dio = DioMock();
  final repository = CharacterRepositoryImpl(dio);

  test('Teste sucesso ao buscar personagens', () async {
    when(() => dio.get(any())).thenAnswer((_) async => successResponseMock);
    final response = await repository.getCharacter(1);
    expect(response.length, 1);
  });

  test('Teste error ao buscar personagens', () async {},
      skip: 'Ainda não implementado');
}
