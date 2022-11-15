import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wage_app/ui/manager/formaddstaff.dart';
import 'package:wage_app/ui/manager/showstaff.dart';
import 'package:wage_app/ui/manager/staffManager.dart';
import 'package:wage_app/ui/model/staff_model.dart';
import 'package:wage_app/ui/wage/wageList.dart';
import 'UI/wage/addWage.dart';
import 'UI/wage/wageManager.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (context) => StaffManager(),
          ),
          ChangeNotifierProvider(
            create: (context) => WageManager(),
          ),
        ],
        child: MaterialApp(
          routes: {
            Showstaff.routeName: (context) => const Showstaff(),
            FormAddStaff.routeName: (context) => const FormAddStaff(),
          },
          onGenerateRoute: (settings) {
            if (settings.name == ScreenWage.routeName) {
              final Staff staff = settings.arguments as Staff;
              return MaterialPageRoute(
                builder: (ctx) {
                  return ScreenWage(staff);
                },
              );
            } else {
              final Staff staff = settings.arguments as Staff;
              return MaterialPageRoute(
                builder: (ctx) {
                  return AddWage(staff);
                },
              );
            }
            // if (settings.name == AddWage.routeName) {

            // }
          },
          title: 'Wage app',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: AddWage(
            Staff(
              id: 1,
              age: DateTime(1999, 09, 09),
              name: 'Đức',
            ),
          ),
        ));
  }
}
