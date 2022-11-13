import 'package:flutter/foundation.dart';
import '../model/staff_model.dart';

class StaffManager extends ChangeNotifier {
  final List<Staff> _items = [];
  int id = 0;
  void addUser(String name, DateTime age) {
    _items.add(Staff(id: id, name: name, age: age));
    id++;
    print(_items.last.name);
    print(_items.last.age);
  }

  List<Staff> get items {
    return _items;
  }
}
