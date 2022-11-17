import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'ui/model/staff_model.dart';
import 'ui/manager/formaddstaff.dart';
import 'ui/manager/showstaff.dart';
import 'ui/manager/staffManager.dart';
import 'ui/wage/wageManager.dart';
import 'ui/wage/addWage.dart';
import 'ui/wage/wageList.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
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
            }
            if (settings.name == AddWage.routeName) {
              final Staff staff = settings.arguments as Staff;
              return MaterialPageRoute(
                builder: (ctx) {
                  return AddWage(staff);
                },
              );
            }
            return null;
          },
          title: 'Wage app',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: const Showstaff(),
        ));
  }
}
