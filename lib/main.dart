import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wage_app/UI/user/userManager.dart';
import 'package:wage_app/UI/wage/wageList.dart';
import 'UI/wage/addWage.dart';
import 'UI/model/user_model.dart';
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
            create: (context) => WageManager(),
          ),
          ChangeNotifierProvider(
            create: (context) => UserManager(),
          )
        ],
        child: MaterialApp(
          routes: {
            // AddWage.routeName: (ctx) => AddWage(),
            ScreenWage.routeName: (context) => const ScreenWage()
          },
          onGenerateRoute: (settings) {
            if (settings.name == AddWage.routeName) {
              final User user = settings.arguments as User;
              return MaterialPageRoute(
                builder: (ctx) {
                  return AddWage(user);
                },
              );
            }
          },
          title: 'Wage app',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: AddWage(
            User(
              id: 1,
              age: DateTime(1999, 09, 09),
              name: 'Đức',
            ),
          ),
        ));
  }
}
