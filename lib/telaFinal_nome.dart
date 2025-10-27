import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:pokedex_app/model/pokemon.dart'; 
import 'package:pokedex_app/model/stats.dart';   

class PokemonDetailScreen extends StatefulWidget {

  final String pokemonIdentifier;

  const PokemonDetailScreen({super.key, required this.pokemonIdentifier});

  @override
  State<PokemonDetailScreen> createState() => _PokemonDetailScreenState();
}

class _PokemonDetailScreenState extends State<PokemonDetailScreen> {

  Pokemon? _pokemon;
  bool _isLoading = true;
  String? _error;

  @override
  void initState() {
    super.initState();
    _fetchDetails();
  }


  Future<void> _fetchDetails() async {
    try {
      final response = await http.get(Uri.parse('https://pokeapi.co/api/v2/pokemon/${widget.pokemonIdentifier}'));
      
      if (response.statusCode == 200) {
        final decodedJson = jsonDecode(response.body);
        _pokemon = Pokemon.fromJson(decodedJson);
      } else {
        _error = 'Pokémon não encontrado!';
      }
    } catch (e) {
      _error = 'Falha ao conectar. Verifique sua internet.';
    }


    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

        title: Text(_isLoading ? 'Carregando...' : _pokemon?.name.toUpperCase() ?? 'Erro'),
        backgroundColor: Colors.red,
      ),
      body: _buildBody(),
    );
  }


  Widget _buildBody() {
    if (_isLoading) {
      return const Center(child: CircularProgressIndicator());
    }

    if (_error != null) {
      return Center(child: Text(_error!, style: TextStyle(fontSize: 18, color: Colors.red)));
    }


    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Center(
        child: Column(
          children: [
            Image.network(
              _pokemon!.imageUrl,
              height: 200,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) => Icon(Icons.broken_image, size: 200),
            ),
            const SizedBox(height: 16),
            Text(
              _pokemon!.name.toUpperCase(),
              style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text('ID: ${_pokemon!.id} | Peso: ${_pokemon!.weight} | Altura: ${_pokemon!.height}', style: TextStyle(fontSize: 16)),
            const SizedBox(height: 24),

            Text('Tipos', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: _pokemon!.types.map((tipo) => Chip(label: Text(tipo.name))).toList(),
            ),
            const SizedBox(height: 24),

            Text('Stats Base', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
            ..._pokemon!.stats.map((stat) {
              return ListTile(
                title: Text(stat.name.toUpperCase()),
                trailing: Text('${stat.baseStat}', style: TextStyle(fontWeight: FontWeight.bold)),
              );
            }).toList(),

          ],
        ),
      ),
    );
  }
}