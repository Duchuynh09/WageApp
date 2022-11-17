import 'package:intl/intl.dart';

class Staff {
  late final String? id;
  late final String name;
  late final DateTime age;
  Staff({required this.name, required this.age, this.id});
  Staff copyWith({String? id, String? name, DateTime? age}) {
    return Staff(
      id: id ?? this.id,
      name: name ?? this.name,
      age: age ?? this.age,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'age': age.millisecondsSinceEpoch,
    };
  }

  static Staff fromJson(Map<String, dynamic> json) {
    return Staff(
        id: json['id'],
        name: json['name'],
        age: DateTime.fromMillisecondsSinceEpoch(json['age']));
  }
}
