import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:wage_app/UI/wage/wageManager.dart';
import 'package:wage_app/UI/wage/wageTile.dart';

class ScreenWage extends StatelessWidget {
  // Truyền 1 argumets user cho nó
  const ScreenWage({Key? key}) : super(key: key);
  static const String routeName = "/ScreenWage";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Danh sách chấm công'),
      ),
      body: context.read<WageManager>().items.isEmpty
          ? const Center(
              child: Text('chua co'),
            )
          : Consumer<WageManager>(
              builder: (context, wageManager, child) {
                return ListView.builder(
                  itemBuilder: (context, index) {
                    return WageTile(wageManager.items[1]!.elementAt(index));
                  },
                  itemCount: wageManager.items[1]!.length,
                );
              },
            ),
    );
  }
}
