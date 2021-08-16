import 'package:rick/src/domain/entities/character_entity.dart';

abstract class CharacterState {
  final List<CharacterEntity> data;
  final isLoading;
  final int page;
  CharacterState(this.data, {this.isLoading = true, this.page = 1});

  SuccessCharacterState success(
          CharacterState state, List<CharacterEntity> newsData) =>
      SuccessCharacterState(
        [...state.data, ...newsData],
        isLoading: false,
        page: (state.page + 1),
      );
  SuccessCharacterState loading(CharacterState state) => SuccessCharacterState(
        state.data,
        isLoading: true,
        page: state.page,
      );
}

class InitCharacterState extends CharacterState {
  InitCharacterState(List<CharacterEntity> data)
      : super(
          data,
          isLoading: true,
          page: 1,
        );
}

class SuccessCharacterState extends CharacterState {
  SuccessCharacterState(List<CharacterEntity> data,
      {bool isLoading = false, int page = 1})
      : super(
          data,
          isLoading: isLoading,
          page: page,
        );
}
