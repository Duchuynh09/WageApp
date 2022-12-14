import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
// import 'package:wage_app/ui/manager/formaddstaff.dart';
import 'package:wage_app/ui/manager/staffManager.dart';
import 'package:wage_app/ui/share/appDrawer.dart';
import 'package:wage_app/ui/wage/addWage.dart';
import 'package:wage_app/ui/wage/wageList.dart';
import '../share/appDrawer.dart';

class Showstaff extends StatefulWidget {
  static const String routeName = "/Showstaff";
  const Showstaff({super.key});

  @override
  State<Showstaff> createState() => _ShowstaffState();
}

class _ShowstaffState extends State<Showstaff> {
  late Future<void> _fetchStaff;

  Future<void> _refreshProducts(BuildContext context) async {
    await context.read<StaffManager>().fetchStaff();
  }

  // List<String> listItem = [
  //   'Chức năng 1',
  //   'Chức năng 2',
  //   'Chức năng 3',
  //   'Chức năng 4'
  // ];
  late String valueChoose = '';
  @override
  void initState() {
    super.initState();
    _fetchStaff = context.read<StaffManager>().fetchStaff();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Center(
        child: Text('Danh sách nhân viên'),
      )),
      drawer: const AppDrawer(),
      body: FutureBuilder(
        future: _fetchStaff,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return RefreshIndicator(
              onRefresh: () => _refreshProducts(context),
              child: screen(),
            );
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }

  Widget screen() {
    return ListView.builder(
      primary: false,
      padding: const EdgeInsets.all(20),
      itemCount: context.read<StaffManager>().items.length,
      itemBuilder: (BuildContext context, int index) {
        return ListTile(
          shape: const Border(bottom: BorderSide()),
          title: Container(
            padding: const EdgeInsets.all(8),
            child: Column(
              children: [
                ExpansionTile(
                  title: Text(context.read<StaffManager>().items[index].name),
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: TextButton(
                              onPressed: () {
                                Navigator.pushNamed(
                                    context, ScreenWage.routeName,
                                    arguments: context
                                        .read<StaffManager>()
                                        .items[index]);
                              },
                              child: const Text('Xem gio da lam')),
                        ),
                        Expanded(
                          child: TextButton(
                              onPressed: () {
                                Navigator.pushNamed(context, AddWage.routeName,
                                    arguments: context
                                        .read<StaffManager>()
                                        .items[index]);
                              },
                              child: const Text('Nhap gio lam')),
                        ),
                        Expanded(
                          child: OutlinedButton(
                            style: TextButton.styleFrom(primary: Colors.red),
                            onPressed: () {
                              context.read<StaffManager>().deleteStaff(
                                  context.read<StaffManager>().items[index].id);
                              ScaffoldMessenger.of(context)
                                ..hideCurrentSnackBar()
                                ..showSnackBar(
                                  const SnackBar(
                                    content: Text(
                                      'Đã sa thải nhân viên',
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                );
                            },
                            child: const Text('Sa thải'),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
