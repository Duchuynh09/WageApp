import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:wage_app/ui/model/staff_model.dart';
import 'package:wage_app/ui/wage/wageManager.dart';
import 'package:wage_app/ui/wage/wageTile.dart';

class ScreenWage extends StatefulWidget {
  // Truyền 1 argumets user cho nó
  static const String routeName = "/ScreenWage";
  const ScreenWage(this.staff, {super.key});
  final Staff staff;

  @override
  State<ScreenWage> createState() => _ScreenWageState();
}

class _ScreenWageState extends State<ScreenWage> {
  WageManager wageManager = WageManager();
  @override
  Widget build(BuildContext newcontext) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Danh sách chấm công'),
      ),
      body: widget.staff == null
          ? const Text('chua co du lieu')
          : Text(newcontext.read<WageManager>().items.toString()),
    );
  }

  Widget ListWage(WageManager wageManager) {
    return ListView.builder(
      itemBuilder: (context, index) {
        return Text('');
      },
      itemCount: wageManager.itemsCount(widget.staff.id),
    );
  }
}
