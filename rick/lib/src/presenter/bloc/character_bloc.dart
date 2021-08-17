import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick/src/domain/entities/character_entity.dart';
import 'package:rick/src/domain/events/character_events.dart';
import 'package:rick/src/domain/states/character_state.dart';
import 'package:rick/src/infra/repository/character_repository.dart';

class CharacterBloc extends Bloc<CharacterEvent, CharacterState> {
  final CharacterRepository repository;

  CharacterBloc(this.repository)
      : super(InitCharacterState(<CharacterEntity>[]));

  @override
  Stream<CharacterState> mapEventToState(CharacterEvent event) async* {
    yield state.loading(state);

    final response = await repository.getCharacter(state.page);

    if (response.isNotEmpty) {
      yield state.success(state, response);
      print(state.page);
    }
    // estado de erro
  }
}
