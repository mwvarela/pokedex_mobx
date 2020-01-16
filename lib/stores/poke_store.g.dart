// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'poke_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$PokeStore on _PokeStoreBase, Store {
  final _$pokemonAtom = Atom(name: '_PokeStoreBase.pokemon');

  @override
  PokeModel get pokemon {
    _$pokemonAtom.context.enforceReadPolicy(_$pokemonAtom);
    _$pokemonAtom.reportObserved();
    return super.pokemon;
  }

  @override
  set pokemon(PokeModel value) {
    _$pokemonAtom.context.conditionallyRunInAction(() {
      super.pokemon = value;
      _$pokemonAtom.reportChanged();
    }, _$pokemonAtom, name: '${_$pokemonAtom.name}_set');
  }

  final _$_PokeStoreBaseActionController =
      ActionController(name: '_PokeStoreBase');

  @override
  dynamic fetchPokemonList() {
    final _$actionInfo = _$_PokeStoreBaseActionController.startAction();
    try {
      return super.fetchPokemonList();
    } finally {
      _$_PokeStoreBaseActionController.endAction(_$actionInfo);
    }
  }
}
