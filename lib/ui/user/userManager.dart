import 'package:flutter/foundation.dart';
import 'package:wage_app/UI/model/user_model.dart';

import '../wage/wageManager.dart';

class UserManager extends ChangeNotifier {
  final List<User> _items = [
    User(id: 1, name: 'Duc', age: DateTime.now().toLocal())
  ];
  List<User> get users {
    return _items;
  }
}
