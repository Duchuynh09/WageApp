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
  late Future<void> _fetchWages;

  Future<void> _refreshWages(BuildContext context) async {
    await context.read<WageManager>().fetchStaff(widget.staff.id);
  }

  @override
  void initState() {
    super.initState();
    _fetchWages = context.read<WageManager>().fetchStaff(widget.staff.id);
  }

  @override
  Widget build(BuildContext newcontext) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Danh sách chấm công'),
        ),
        body: FutureBuilder(
          future: _fetchWages,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              return RefreshIndicator(
                  onRefresh: () => _refreshWages(context),
                  child: context
                          .read<WageManager>()
                          .items[widget.staff.id]!
                          .isNotEmpty
                      ? listWage(context.read<WageManager>())
                      : const Center(
                          child: Text(
                            'Vui lòng nhập lương cho nhân viên ',
                            style: TextStyle(
                                fontSize: 20, color: Colors.orangeAccent),
                          ),
                        ));
            }
            return const Center(
              child: CircularProgressIndicator(),
            );
          },
        ));
  }

  Widget listWage(WageManager wageManager) {
    return ListView.builder(
      itemBuilder: (context, index) {
        // print(wageManager.items[widget.staff.id]!.elementAt(index));
        return WageTile(wageManager.items[widget.staff.id]!.elementAt(index));
      },
      itemCount: wageManager.itemsCount(widget.staff.id),
    );
  }
}
