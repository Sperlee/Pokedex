import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:pokedex_app/filtros/tipo.dart';
import 'package:pokedex_app/home.dart';
import 'package:pokedex_app/model/pokemon.dart';
import 'package:pokedex_app/model/stats.dart';
import 'package:pokedex_app/page2.dart';

class Fim extends StatefulWidget {

  final String url;
  
  const Fim(String texto) : url = "https://pokeapi.co/api/v2/$texto/";

  @override
  State<Fim> createState() => _FimState();
}

class _FimState extends State<Fim> {

  var fundo = Menu();
  List<Pokemon>? _pokemon;

  Future<Pokemon> _fetchPokemonDetails(String id) async {
    final response = await http.get(Uri.parse('https://pokeapi.co/api/v2/pokemon/$id'));
    final decodedJson = jsonDecode(response.body);

    return Pokemon.fromJson(decodedJson);
  }


  Future<List<Pokemon>> _getPokemon() async {
    final response = await http.get(Uri.parse(widget.url));
    var decodeJson = jsonDecode(response.body);
    List<Pokemon> pokemons = [];
    final pokemonListKey = decodeJson.containsKey('pokemon_species') ? 'pokemon_species' : 'pokemon';

    for (var item in decodeJson[pokemonListKey]) {
      final pokemonData = item.containsKey('pokemon') ? item['pokemon'] : item;
      pokemons.add(Pokemon.fromSimpleJson(pokemonData));
    }
    return pokemons;
  }

  @override
  void initState() {
    super.initState();
    print("Tentando buscar a URL: ${widget.url}");
    _getPokemon().then((map) {
      setState(() {
        _pokemon = map;
      });
    });
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Stack(
          children: [
            _pokemon == null
                ? Center(child: CircularProgressIndicator())
                : ListView.builder(
                    itemCount: _pokemon!.length,
                    itemBuilder: (context, index) {
                      final pokemonDaLista = _pokemon![index];
                      
                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                        child: Container(
                          color: const Color.fromARGB(153, 255, 0, 0),
                          child: ListTile(
                            onTap: () {
                              showDialog(
                                context: context,
                                builder: (context) {
                                  return FutureBuilder<Pokemon>(
                                    future: _fetchPokemonDetails(pokemonDaLista.id),
                                    builder: (context, snapshot) {
                                      if (snapshot.connectionState == ConnectionState.waiting) {
                                        return AlertDialog(
                                          title: Text(pokemonDaLista.name),
                                          content: Container(
                                            height: 100,
                                            child: Center(child: CircularProgressIndicator()),
                                          ),
                                        );
                                      }
                                      if (snapshot.hasError) {
                                        return AlertDialog(title: Text('Erro ao buscar detalhes'));
                                      }
                                      
                                      final pokemonDetalhado = snapshot.data!;
                                      
                                      final hpStat = pokemonDetalhado.stats.firstWhere(
                                        (stat) => stat.name == 'hp',
                                        orElse: () => Stats(name: 'hp', baseStat: 0),
                                      );

                                      return AlertDialog(
                                        title: Text(pokemonDetalhado.name[0].toUpperCase() + pokemonDetalhado.name.substring(1)),
                                        content: SingleChildScrollView(
                                          child: Column(
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              Image.network(pokemonDetalhado.imageUrl, scale: 0.5),
                                              const SizedBox(height: 10),
                                              
                                            
                                              Text(
                                                'Tipos: ${pokemonDetalhado.types.map((tipo) => tipo.name).join(', ')}',
                                                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                                              ),
                                              const SizedBox(height: 15),

                                              Text(
                                                'Vida (HP): ${hpStat.baseStat}',
                                                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                                              ),
                                            ],
                                          ),
                                        ),
                                        actions: [
                                          TextButton(
                                            onPressed: () => Navigator.pop(context),
                                            child: Text("Fechar"),
                                          )
                                        ],
                                      );
                                    },
                                  );
                                },
                              );
                            },
                            leading: Image.network(pokemonDaLista.imageUrl, width: 60),
                            title: Text(
                              pokemonDaLista.name[0].toUpperCase() + pokemonDaLista.name.substring(1),
                              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                            ),
                            subtitle: Text("ID: ${pokemonDaLista.id}"),
                          ),
                        ),
                      );
                    },
                  ),
            Align(
              
              alignment: Alignment.bottomRight,
              child: Padding(
                padding: EdgeInsetsGeometry.only(bottom: 20),
                child:ElevatedButton(
                   style: ElevatedButton.styleFrom(
                    backgroundColor: button_color,
                    minimumSize:Size(100, 50)
                  ),
                  onPressed: (){
                    Navigator.pop(context);
                    },
                  child: Text("voltar",style: TextStyle(color: const Color.fromARGB(255, 255, 255, 255),fontSize: 25))) ,)
            )
          ],
        ),
      ),
    );
  }
}