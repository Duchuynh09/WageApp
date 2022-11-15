class Staff {
  late int id;
  late String name;
  late DateTime age;
  Staff({required this.id, required this.name, required this.age});
  Staff copyWith({int? id, String? name, DateTime? age}) {
    return Staff(
      id: id ?? this.id,
      name: name ?? this.name,
      age: age ?? this.age,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'age': age,
    };
  }

  static Staff fromJson(Map<String, dynamic> json) {
    return Staff(id: json['id'], name: json['name'], age: json['age']);
  }
}
