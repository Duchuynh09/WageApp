import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:wage_app/ui/model/staff_model.dart';

import 'fireBase.dart';

class StaffService extends FirebaseService {
  StaffService() : super();

  Future<List<Staff>> fetchStaff() async {
    final List<Staff> staffs = [];
    try {
      final usresUrl = Uri.parse('$databaseUrl/staffs.json');
      final response = await http.get(usresUrl);
      final staffMap = json.decode(response.body) as Map<String, dynamic>;
      if (response.statusCode != 200) {
        return staffs;
      }
      staffMap.forEach((staffId, staff) {
        staffs.add(Staff.fromJson({
          'id': staffId,
          ...staff,
        }));
      });

      return staffs;
    } catch (error) {
      print(error);
      return staffs;
    }
  }

  Future<Staff?> addStaff(Staff staff) async {
    try {
      final url = Uri.parse('$databaseUrl/staffs.json');
      final response = await http.post(
        url,
        body: json.encode(
          staff.toJson()..addAll({}),
        ),
      );

      if (response.statusCode != 200) {
        throw Exception(json.decode(response.body)['error']);
      }

      return staff.copyWith(
        id: json.decode(response.body)['name'],
      );
    } catch (error) {
      print(error);
      return null;
    }
  }

  Future<bool> deleteStaff(String id) async {
    try {
      final url = Uri.parse('$databaseUrl/staffs/$id.json');
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
