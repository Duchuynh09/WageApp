import 'package:flutter/foundation.dart';
import 'package:wage_app/ui/model/wage_model.dart';
import 'package:wage_app/ui/service/wageService.dart';

class WageManager extends ChangeNotifier {
  final _wageService = WageService();
  final Map<String?, List<Wage>> _items = {};
  Map<String?, List<Wage>> get items {
    return _items;
  }

  int itemsCount(String? id) {
    return _items[id]!.isNotEmpty ? _items[id]!.length : 0;
  }

  Future<void> fetchStaff(String? id) async {
    _items[id] = await _wageService.fetchWage(id);
    notifyListeners();
  }

  void addWage(String? id, Wage wage) async {
    await _wageService.addWage(id, wage);
    if (_items.containsKey(id)) {
      _items[id]!.add(wage);
    } else {
      List<Wage> wages = [];
      wages.add(wage);
      _items.addAll({id: wages});
    }
  }
}
