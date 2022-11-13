import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wage_app/ui/manager/staffManager.dart';

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
              color: Colors.teal[100],
              child: Column(
                children: [
                  ExpansionTile(
                    title: Text(
                        context.read<StaffManager>().items[index].toString()),
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        // mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          TextButton(
                              onPressed: () {},
                              child: const Text('Chức năng 1')),
                          TextButton(
                              onPressed: () {},
                              child: const Text('Chức năng 2')),
                          TextButton(
                              onPressed: () {},
                              child: const Text('Chức năng 3'))
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
