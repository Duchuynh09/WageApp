import 'package:flutter/foundation.dart';
import '../model/staff_model.dart';

class StaffManager extends ChangeNotifier {
  final List<Staff> _items = [
    Staff(
      id: 10,
      age: DateTime(1999, 09, 09),
      name: 'Đức',
    ),
  ];
  int id = 0;
  void addUser(String name, DateTime age) {
    _items.add(Staff(id: id, name: name, age: age));
    id++;
  }

  List<Staff> get items {
    return _items;
  }
}
