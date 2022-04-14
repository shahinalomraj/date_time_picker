import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late DateTime _dateTime;
  late TimeOfDay _timeOfDay;

  getDate() async {
    DateTime? date = await showDatePicker(
        context: context,
        initialDate: DateTime(DateTime.now().year),
        firstDate: DateTime(DateTime.now().year - 20),
        lastDate: DateTime(DateTime.now().year + 2));
    setState(() {
      _dateTime = date!;
    });
  }

  getTime() async {
    TimeOfDay? time =
        await showTimePicker(context: context, initialTime: TimeOfDay.now());
    setState(() {
      _timeOfDay = time!;
    });
  }

  @override
  Widget build(BuildContext context) {
    var _dateTime;
    var _timeOfDay;
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _dateTime == null
                  ? Text("Choose Date")
                  : Text(
                      "Date : ${_dateTime.year},${_dateTime.month},${_dateTime.day},",
                      style: TextStyle(fontSize: 40),
                    ),
              _timeOfDay == null
                  ? Text("Choose Time")
                  : Text(
                      "Time : ${_timeOfDay..hour},-${_timeOfDay.minute}",
                      style: TextStyle(fontSize: 40),
                    ),
              RaisedButton(onPressed: () {
                getDate();
              }),
              RaisedButton(onPressed: () {
                getTime();
              }),
            ],
          ),
        ),
      ),
    );
  }
}
