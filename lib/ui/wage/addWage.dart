import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:wage_app/ui/model/wage_model.dart';
import 'package:wage_app/ui/share/appDrawer.dart';
import 'package:wage_app/ui/wage/wageManager.dart';
import 'package:wage_app/ui/model/staff_model.dart';

class AddWage extends StatefulWidget {
  static const String routeName = "/AddWage";
  AddWage(Staff staff, {super.key}) {
    // ignore: prefer_initializing_formals
    this.staff = staff;
  }
  late final Staff staff;

  @override
  State<AddWage> createState() => _AddWageState();
}

class _AddWageState extends State<AddWage> {
  DateTime _dueDate = DateTime.now();
  DateTime _timeCheckIn = DateTime(0, 0, 0, 5, 30);
  DateTime _timeCheckOut = DateTime.now();
  WageManager wageManager = WageManager();
  // ignore: non_constant_identifier_names
  List<TimeOfDay> CheckInTimes = [
    const TimeOfDay(hour: 5, minute: 30),
    const TimeOfDay(hour: 6, minute: 00)
  ];
  TimeOfDay? selectedValue;
  late Wage wageAdd;

  @override
  void initState() {
    wageAdd =
        Wage(checkIn: _timeCheckIn, checkOut: _timeCheckOut, day: _dueDate);
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const AppDrawer(),
      appBar: AppBar(
        title: const Text('CheckOut SCreen'),
        actions: [
          addButton(context.read<WageManager>()),
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          buildNameField(),
          buildDateField(),
          buildTimeIn(),
          buildTimeOut(),
        ],
      ),
    );
  }

  Widget addButton(WageManager wageManager) {
    return Consumer<WageManager>(
      builder: (context, wageManager, child) {
        return ElevatedButton(
          onPressed: () {
            wageManager.addWage(widget.staff.id, wageAdd);
          },
          child: Icon(
            Icons.check,
            color: Colors.amber[600],
          ),
        );
      },
      // child:,
    );
  }

  Widget buildDateField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Ngày check out',
              style: GoogleFonts.lato(fontSize: 28),
            ),
            TextButton(
              child: const Text('Chọn ngày'),
              onPressed: () async {
                final currentDate = DateTime.now();
                final selectedDate = await showDatePicker(
                  context: context,
                  initialDate: currentDate,
                  firstDate: currentDate,
                  lastDate: DateTime(currentDate.year + 5),
                );
                setState(() {
                  if (selectedDate != null) {
                    _dueDate = selectedDate;
                    wageAdd = wageAdd.copyWith(day: _dueDate);
                  }
                });
              },
            )
          ],
        ),
        Text(DateFormat('MM/yyyy').format(_dueDate)),
      ],
    );
  }

  Widget buildTimeIn() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Giờ Check In',
              style: GoogleFonts.lato(fontSize: 28),
            ),
            TextButton(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  border: Border.all(
                      color: Colors.blueGrey,
                      width: 2.0,
                      style: BorderStyle.solid),
                ),
                child: const Text(
                  'Chọn giờ vào ca',
                ),
              ),
              onPressed: () async {
                final timeOfDay = await showTimePicker(
                  context: context,
                  initialTime: TimeOfDay(
                      hour: _timeCheckIn.hour, minute: _timeCheckIn.minute),
                  initialEntryMode: TimePickerEntryMode.input,
                );
                setState(
                  () {
                    if (timeOfDay != null) {
                      _timeCheckIn = DateTime(
                          _timeCheckIn.year,
                          _timeCheckIn.month,
                          _timeCheckIn.day,
                          timeOfDay.hour,
                          timeOfDay.minute);
                    }
                  },
                );
                wageAdd = wageAdd.copyWith(
                    checkIn: DateTime(_dueDate.year, _dueDate.month,
                        _dueDate.day, _timeCheckIn.hour, _timeCheckIn.minute));
              },
            )
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(DateFormat.Hm().format(_timeCheckIn)),
            Column(
              children: [
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Lựa chọn nhanh :',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      DropdownButton(
                        icon: const Icon(
                          Icons.timer,
                        ),
                        value: selectedValue ?? CheckInTimes.first,
                        items: CheckInTimes.map(
                            (item) => DropdownMenuItem<TimeOfDay>(
                                  value: item,
                                  child: Text(
                                    item.toString(),
                                    style: const TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.green,
                                    ),
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                )).toList(),
                        onChanged: ((value) {
                          setState(() {
                            selectedValue = value as TimeOfDay;
                            _timeCheckIn =
                                DateTime(0, 0, 0, value.hour, value.minute);
                          });
                          wageAdd = wageAdd.copyWith(
                              checkIn: DateTime(
                                  _dueDate.year,
                                  _dueDate.month,
                                  _dueDate.day,
                                  _timeCheckIn.hour,
                                  _timeCheckIn.minute));
                        }),
                      ),
                    ])
              ],
            ),
          ],
        ),
      ],
    );
  }

  Widget buildNameField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Item Name',
          style: GoogleFonts.lato(fontSize: 28),
        ),
        TextFormField(
          initialValue: widget.staff.name,
          readOnly: true,
          decoration: const InputDecoration(
            // hintText: 'Tên nhân viên',
            border: OutlineInputBorder(),
          ),
        ),
      ],
    );
  }

  Widget buildTimeOut() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Giờ Check Out',
          style: GoogleFonts.lato(fontSize: 28),
        ),
        Row(
          children: [
            Text(DateFormat.Hm().format(_timeCheckOut)),
            TextButton(
              child: const Text('Chọn giờ ra ca'),
              onPressed: () async {
                final timeOfDay = await showTimePicker(
                  context: context,
                  initialTime: TimeOfDay(
                      hour: _timeCheckOut.hour, minute: _timeCheckOut.minute),
                  initialEntryMode: TimePickerEntryMode.input,
                );
                setState(
                  () {
                    if (timeOfDay != null) {
                      _timeCheckOut =
                          DateTime(0, 0, 0, timeOfDay.hour, timeOfDay.minute);
                    }
                  },
                );
                wageAdd = wageAdd.copyWith(
                    checkOut: DateTime(
                        _dueDate.year,
                        _dueDate.month,
                        _dueDate.day,
                        _timeCheckOut.hour,
                        _timeCheckOut.minute));
              },
            )
          ],
        ),
      ],
    );
  }
}
