import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:wage_app/ui/manager/staffManager.dart';

class FormAddStaff extends StatefulWidget {
  const FormAddStaff({super.key});
  static const String routeName = "/FormAddStaff";

  @override
  State<FormAddStaff> createState() => _FormAddStaffState();
}

class _FormAddStaffState extends State<FormAddStaff> {
  String username = "";
  late DateTime ngaysinh = DateTime(1999);
  TextEditingController controller = TextEditingController();
  @override
  void initState() {
    controller.addListener(() {
      controller.text = DateFormat("dd-MM-yyyy").format(ngaysinh);
      ValueNotifier(ngaysinh);
    });

    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Thêm nhân viên'),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(20, 40, 20, 0.0),
        child: Column(
          children: [
            TextField(
              onChanged: (newUsername) {
                username = newUsername;
              },
              keyboardType: TextInputType.text,
              // ignore: prefer_const_constructors
              style: TextStyle(fontSize: 25),
              decoration: InputDecoration(
                  labelText: "Username",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10))),
            ),
            const SizedBox(height: 30),
            TextField(
              controller: controller,
              onChanged: (newngaysinh) {
                ngaysinh = newngaysinh as DateTime;
              },
              keyboardType: TextInputType.datetime,
              // ignore: prefer_const_constructors
              style: TextStyle(fontSize: 25),
              decoration: InputDecoration(
                  suffix: IconButton(
                    icon: const Icon(Icons.calendar_month_outlined),
                    onPressed: () async {
                      DateTime? timeSelect = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(1990),
                        lastDate: DateTime.now(),
                      );
                      if (timeSelect != null) {
                        ngaysinh = timeSelect;
                      }
                    },
                  ),
                  labelText: "Ngày sinh",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10))),
            ),
            const SizedBox(height: 30),
            ClipRRect(
              borderRadius: BorderRadius.circular(4),
              child: Stack(
                children: <Widget>[
                  Positioned.fill(
                    child: Container(
                      decoration: const BoxDecoration(
                        gradient: LinearGradient(
                          colors: <Color>[
                            Color(0xFF0D47A1),
                            Color(0xFF1976D2),
                            Color(0xFF42A5F5),
                          ],
                        ),
                      ),
                    ),
                  ),
                  TextButton(
                    style: TextButton.styleFrom(
                      backgroundColor: Colors.white,
                      padding: const EdgeInsets.all(16.0),
                      textStyle: const TextStyle(fontSize: 20),
                    ),
                    onPressed: () {
                      context.read<StaffManager>().addUser(username, ngaysinh);
                    },
                    child: const Text('Thêm'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
