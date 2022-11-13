import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:wage_app/ui/model/user_model.dart';

import 'fireBase.dart';

class UserService extends FirebaseService {
  UserService() : super();

  Future<List<User>> fetchUsers() async {
    final List<User> usres = [];
    try {
      final usresUrl = Uri.parse('$databaseUrl/staff.json');
      final response = await http.get(usresUrl);
      final usresMap = json.decode(response.body) as List<User>;

      if (response.statusCode != 200) {
        return usres;
      }

      return usres;
    } catch (error) {
      print(error);
      return usres;
    }
  }

  Future<User?> addProduct(User user) async {
    try {
      final url = Uri.parse('$databaseUrl/staff.json');
      final response = await http.post(
        url,
        body: json.encode(
          user.toJson()..addAll({}),
        ),
      );

      if (response.statusCode != 200) {
        throw Exception(json.decode(response.body)['error']);
      }

      return user.copyWith(
        id: json.decode(response.body)['name'],
      );
    } catch (error) {
      print(error);
      return null;
    }
  }
  Future<bool> deleteProduct(String id) async {
    try {
      final url = Uri.parse('$databaseUrl/staff/$id.json');
      final response = await http.delete(url);
      if (response.statusCode != 200) {
        throw Exception(json.decode(response.body)['error']);
      }
      return true;
    } catch (error) {
      print(error);
      return false;
    }
  }
}
