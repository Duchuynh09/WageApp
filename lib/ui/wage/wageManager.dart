import 'package:flutter/foundation.dart';
import 'package:wage_app/UI/model/wage_model.dart';

class WageManager extends ChangeNotifier {
  final Map<int, List<Wage>> _items = {};

  Map<int, List<Wage>> get items {
    return _items;
  }

  Iterable<List<Wage>> get listItems {
    return _items.values;
  }

  void addWage(int id, Wage wage) {
    if (_items.containsKey(id)) {
      _items[id]!.add(wage);
    } else {
      List<Wage> wages;
      wages = listItems.cast<Wage>().toList();
      wages.add(wage);
      _items.addAll({id: wages});
    }
  }
}
