import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
// import 'package:wage_app/ui/manager/formaddstaff.dart';
import 'package:wage_app/ui/manager/staffManager.dart';
import 'package:wage_app/ui/wage/addWage.dart';
import 'package:wage_app/ui/wage/wageList.dart';

class Showstaff extends StatefulWidget {
  static const String routeName = "/Showstaff";
  const Showstaff({super.key});

  @override
  State<Showstaff> createState() => _ShowstaffState();
}

class _ShowstaffState extends State<Showstaff> {
  List<String> listItem = [
    'Chức năng 1',
    'Chức năng 2',
    'Chức năng 3',
    'Chức năng 4'
  ];
  late String valueChoose = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Center(
        child: Text('Danh sách nhân viên'),
      )),
      body: ListView.builder(
        primary: false,
        padding: const EdgeInsets.all(20),
        itemCount: context.read<StaffManager>().items.length,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            title: Container(
              padding: const EdgeInsets.all(8),
              // color: Colors.teal[100],
              child: Column(
                children: [
                  ExpansionTile(
                    title: Text(context.read<StaffManager>().items[index].name),
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          TextButton(
                              onPressed: () {
                                Navigator.pushNamed(
                                    context, ScreenWage.routeName,
                                    arguments: context
                                        .read<StaffManager>()
                                        .items[index]);
                              },
                              child: const Text('Xem gio da lam')),
                          TextButton(
                              onPressed: () {
                                Navigator.pushNamed(context, AddWage.routeName,
                                    arguments: context
                                        .read<StaffManager>()
                                        .items[index]);
                              },
                              child: const Text('Nhap gio lam')),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
