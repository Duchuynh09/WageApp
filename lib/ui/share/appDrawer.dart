import 'package:flutter/material.dart';
import 'package:wage_app/UI/wage/wageList.dart';
import 'package:wage_app/ui/manager/formaddstaff.dart';
import 'package:wage_app/ui/manager/showstaff.dart';

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
          ListTile(
            title: const Text('Trang thi danh sach nhan vien '),
            onTap: () {
              Navigator.pushNamed(context, Showstaff.routeName);
            },
          ),
          ListTile(
            title: const Text('Hien thi them nhan vien'),
            onTap: () {
              Navigator.pushNamed(context, FormAddStaff.routeName);
            },
          ),
        ],
      ),
    );
  }
}
