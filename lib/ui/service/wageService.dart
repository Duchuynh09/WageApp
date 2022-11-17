import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:wage_app/ui/model/staff_model.dart';
import 'package:wage_app/ui/model/wage_model.dart';
import 'package:wage_app/ui/wage/addWage.dart';

import 'fireBase.dart';

class WageService extends FirebaseService {
  WageService() : super();

  Future<List<Wage>> fetchWage(String? id) async {
    final List<Wage> wages = [];
    try {
      // final filters =
      //     filterByUser ? 'orderBy="creatorId"&equalTo="$id"' : '';
      final usresUrl = Uri.parse('$databaseUrl/wages/${id.toString()}.json');
      print(usresUrl);
      final response = await http.get(usresUrl);
      final staffMap = json.decode(response.body) as Map<String, dynamic>;
      if (response.statusCode != 200) {
        return wages;
      }
      staffMap.forEach((dayWage, wage) {
        wages.add(Wage.fromJson({
          // 'id': dayWage,
          ...wage,
        }));
      });

      return wages;
    } catch (error) {
      print(error);
      return wages;
    }
  }

  Future<void> addWage(String? staff, Wage wage) async {
    try {
      final url = Uri.parse(
          '$databaseUrl/wages/${staff.toString()}/${DateFormat("dd").format(wage.day)}.json');
      final response = await http.put(
        url,
        body: json.encode(
          wage.toJson(),
        ),
      );

      if (response.statusCode != 200) {
        throw Exception(json.decode(response.body)['error']);
      }
    } catch (error) {
      print(error);
    }
  }

  // Future<bool> delete(String id) async {
  //   try {
  //     final url = Uri.parse('$databaseUrl/staff/$id.json');
  //     final response = await http.delete(url);
  //     if (response.statusCode != 200) {
  //       throw Exception(json.decode(response.body)['error']);
  //     }
  //     return true;
  //   } catch (error) {
  //     print(error);
  //     return false;
  //   }
  // }
}
