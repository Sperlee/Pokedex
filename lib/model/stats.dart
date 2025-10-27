class Stats {
  String name;
  int baseStat;

  Stats({required this.name,required this.baseStat});

  factory Stats.fromJson(Map<String, dynamic> json){
    return Stats(
      name: json["stat"]["name"],
      baseStat: json["base_stat"]
      );
  }
}