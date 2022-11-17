import 'package:flutter/foundation.dart';
import 'package:wage_app/ui/service/staffService.dart';
import '../model/staff_model.dart';

class StaffManager extends ChangeNotifier {
  final _staffService = StaffService();
  late List<Staff> _items = [];
  Future<void> fetchStaff() async {
    _items = await _staffService.fetchStaff();
    notifyListeners();
  }

  Future<void> addStaff(Staff staff) async {
    final newStaff = await _staffService.addStaff(staff);
    if (newStaff != null) {
      _items.add(newStaff);
      notifyListeners();
    }
  }

  Future<void> deleteStaff(String? id) async {
    final index = _items.indexWhere((item) => item.id == id);
    Staff? existingProduct = _items[index];
    _items.removeAt(index);
    notifyListeners();

    if (!await _staffService.deleteStaff(id!)) {
      _items.insert(index, existingProduct);
      notifyListeners();
    }
  }

  List<Staff> get items {
    return _items;
  }
}
