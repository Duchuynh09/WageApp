import 'package:flutter/foundation.dart';
import 'package:wage_app/ui/model/wage_model.dart';

class WageManager extends ChangeNotifier {
  final Map<int, List<Wage>> _items = {};
  Map<int, List<Wage>> get items {
    return _items;
  }

  int itemsCount(int id) {
    return _items[id]!.isNotEmpty ? _items[id]!.length : 0;
  }

  void addWage(int id, Wage wage) {
    print(_items.containsKey(id));
    if (_items.containsKey(id)) {
      _items[id]!.add(wage);
    } else {
      List<Wage> wages = [];
      wages.add(wage);
      _items.addAll({id: wages});
    }
  }
}
