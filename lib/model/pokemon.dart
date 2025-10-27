import 'package:pokedex_app/model/stats.dart';
import 'package:pokedex_app/model/tipos.dart';

class Pokemon {
  final String name; // Corrigido para 'name'
  final String imageUrl;
  final String id;
  final String locationAreaEncounters;
  final List<Stats> stats;
  final int weight;
  final int height;
  final List<TypeInfo> types; // Corrigido para 'types'

  Pokemon({
    required this.name,
    required this.imageUrl,
    required this.id,
    required this.locationAreaEncounters,
    required this.stats,
    required this.weight,
    required this.height,
    required this.types,
  });

  factory Pokemon.fromJson(Map<String, dynamic> json) {
    
    final id = json['id'].toString();
    
    // Adicionado '??' para segurança contra valores nulos
    final imageUrl = json['sprites']['front_default'] ?? ''; 

    var statsListFromJson = json['stats'] as List;
    List<Stats> statsList = statsListFromJson
        .map((statJson) => Stats.fromJson(statJson))
        .toList();

    var typesListFromJson = json['types'] as List;
    List<TypeInfo> typesList = typesListFromJson
        .map((typeJson) => TypeInfo.fromJson(typeJson))
        .toList();

    return Pokemon(
      name: json["name"],
      id: id,
      imageUrl: imageUrl,
      locationAreaEncounters: json["location_area_encounters"],
      stats: statsList,
      weight: json["weight"],
      height: json["height"],
      types: typesList,
    );
  }

  factory Pokemon.fromSimpleJson(Map<String, dynamic> json) {
    final url = json['url'] as String;
    final id = url.split('/')[url.split('/').length - 2];
    final imageUrl = 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/$id.png';

    // Como não temos os outros dados, passamos valores padrão
    return Pokemon(
      id: id,
      name: json['name'],
      imageUrl: imageUrl,
      // ---- Valores Padrão/Placeholder ----
      weight: 0,
      height: 0,
      stats: [], // Lista vazia
      types: [], // Lista vazia
      locationAreaEncounters: url, // Reutiliza a url
    );
  }
}