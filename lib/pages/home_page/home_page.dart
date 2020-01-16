import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:pokedex/consts/consts.dart';
import 'package:pokedex/models/poke_model.dart';
import 'package:pokedex/stores/poke_store.dart';

import 'widgets/appBar_home.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  PokeStore pokeStore;

  @override
  void initState() {
    super.initState();
    pokeStore = PokeStore();
    pokeStore.fetchPokemonList();
  }

  @override
  Widget build(BuildContext context) {
    double sizeWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        overflow: Overflow.visible,
        children: <Widget>[
          Positioned(
            top: -70,
            left: sizeWidth - 145,
            child: Opacity(
              opacity: 0.1,
              child: Image.asset(
                Consts.pokeBallDark,
                height: 240,
                width: 240,
              ),
            ),
          ),
          Container(
            child: Column(
              children: <Widget>[
                Container(
                  height: MediaQuery.of(context).padding.top,
                ),
                AppBarHome(),
                Expanded(child: Observer(
                  builder: (_) {
                    return Container(
                        child: Observer(
                      name: 'ListaHomePage',
                      builder: (_) {
                        PokeModel _pokemon = pokeStore.pokemon;
                        return (_pokemon != null)
                            ? ListView.builder(
                                itemCount: _pokemon.pokemon.length,
                                itemBuilder: (context, index) {
                                  return ListTile(
                                    title: Text(_pokemon.pokemon[index].name),
                                  );
                                },
                              )
                            : Center(
                                child: CircularProgressIndicator(),
                              );
                      },
                    ));
                  },
                )),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
