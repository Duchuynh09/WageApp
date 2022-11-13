import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wage_app/UI/wage/wageList.dart';
import 'package:wage_app/UI/wage/wageManager.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        // Important: Remove any padding from the ListView.
        padding: EdgeInsets.zero,
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
            child: Text('Drawer Header'),
          ),
          ListTile(
            title: const Text('Hien thi danh sach luong'),
            onTap: () {
              Navigator.pushNamed(context, ScreenWage.routeName);
            },
          ),
        ],
      ),
    );
  }
}
