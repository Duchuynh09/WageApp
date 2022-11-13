import 'package:flutter/material.dart';

class Wage extends ChangeNotifier {
  final TimeOfDay checkIn;
  final TimeOfDay checkOut;
  final DateTime day;
  Wage({
    required this.checkIn,
    required this.checkOut,
    required this.day,
  });
  Wage copyWith({
    TimeOfDay? checkIn,
    TimeOfDay? checkOut,
    DateTime? day,
  }) {
    return Wage(
        checkIn: checkIn ?? this.checkIn,
        checkOut: checkOut ?? this.checkOut,
        day: day ?? this.day);
  }
}
