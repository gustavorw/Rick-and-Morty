// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$Controller on _ControllerBase, Store {
  Computed<ObservableList<Character>> _$charactersComputed;

  @override
  ObservableList<Character> get characters => (_$charactersComputed ??=
          Computed<ObservableList<Character>>(() => super.characters,
              name: '_ControllerBase.characters'))
      .value;

  final _$_charactersAtom = Atom(name: '_ControllerBase._characters');

  @override
  ObservableList<Character> get _characters {
    _$_charactersAtom.reportRead();
    return super._characters;
  }

  @override
  set _characters(ObservableList<Character> value) {
    _$_charactersAtom.reportWrite(value, super._characters, () {
      super._characters = value;
    });
  }

  final _$_ControllerBaseActionController =
      ActionController(name: '_ControllerBase');

  @override
  dynamic addCharacter() {
    final _$actionInfo = _$_ControllerBaseActionController.startAction(
        name: '_ControllerBase.addCharacter');
    try {
      return super.addCharacter();
    } finally {
      _$_ControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  
}
