import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:wage_app/ui/model/wage_model.dart';

class WageTile extends StatelessWidget {
  const WageTile(this.wage, {Key? key}) : super(key: key);
  final Wage wage;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: SizedBox(
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(DateFormat("dd-MM").format(wage.day)),
            Text(
              "Giờ vào ca: ${wage.checkIn.format(context)} ",
            ),
            Text(
              "Giờ ra ca: ${wage.checkOut.format(context)}",
            ),
          ],
        ),
      ),
    );
  }
}
