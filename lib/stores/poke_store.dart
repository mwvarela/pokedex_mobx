import 'dart:convert';

import 'package:mobx/mobx.dart';
import 'package:pokedex/consts/consts.dart';
import 'package:pokedex/models/poke_model.dart';
import 'package:http/http.dart' as http;
part 'poke_store.g.dart';

class PokeStore = _PokeStoreBase with _$PokeStore;

abstract class _PokeStoreBase with Store {
  @observable
  PokeModel pokemon;

  @action
  void fetchPokemonList() {
    pokemon = null;
    loadPokemon().then((result) {
      pokemon = result;
    });
  }

  Future<PokeModel> loadPokemon() async {
    try {
      final response = await http.get(Consts.pokeapiURL);
      var decodeJson = jsonDecode(response.body);
      return PokeModel.fromJson(decodeJson);
    } catch (e) {
      print(e);
      return null;
    }
  }
}
