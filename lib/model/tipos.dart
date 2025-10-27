class TypeInfo{
  String name;

  TypeInfo({required this.name});

  factory TypeInfo.fromJson(Map<String, dynamic> json){
    return TypeInfo(
      name: json["type"]["name"]
    );
  }
}