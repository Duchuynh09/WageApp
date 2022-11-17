import 'package:flutter/material.dart';

class Wage extends ChangeNotifier {
  final DateTime checkIn;
  final DateTime checkOut;
  final DateTime day;
  Wage({
    required this.checkIn,
    required this.checkOut,
    required this.day,
  });
  Wage copyWith({
    DateTime? checkIn,
    DateTime? checkOut,
    DateTime? day,
  }) {
    return Wage(
        checkIn: checkIn ?? this.checkIn,
        checkOut: checkOut ?? this.checkOut,
        day: day ?? this.day);
  }

  Map<String, dynamic> toJson() {
    return {
      'day': day.millisecondsSinceEpoch,
      'checkOut': checkOut.millisecondsSinceEpoch,
      'checkIn': checkIn.millisecondsSinceEpoch
    };
  }

  static Wage fromJson(Map<String, dynamic> json) {
    return Wage(
        day: DateTime.fromMillisecondsSinceEpoch(json['day']),
        checkOut: DateTime.fromMillisecondsSinceEpoch(json['checkOut']),
        checkIn: DateTime.fromMillisecondsSinceEpoch(json['checkIn']));
  }
}
