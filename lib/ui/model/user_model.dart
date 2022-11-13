import 'dart:convert';

import 'package:flutter/foundation.dart';

class User {
  late int id;
  late String name;
  late DateTime age;
  User({required this.id, required this.name, required this.age});
  User copyWith({int? id, String? name, DateTime? age}) {
    return User(
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

  static User fromJson(Map<String, dynamic> json) {
    return User(id: json['id'], name: json['name'], age: json['age']);
  }
}
