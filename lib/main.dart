// ignore_for_file: camel_case_types, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:async';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: dateAndTime(),
    );
  }
}

class dateAndTime extends StatefulWidget {
  const dateAndTime({super.key});

  @override
  State<dateAndTime> createState() => _dateAndTimeState();
}

class _dateAndTimeState extends State<dateAndTime> {
  String day = "";
  String mounth = "";
  String year = "";
  String weekday = "";
  int hour = 0;
  String mood = "am";
  int second = 0;
  int minute = 0;

  changeDateAndTime() {
    Timer.periodic(Duration(seconds: 1), (time) {
      setState(() {
        day = DateTime.now().day.toString();
        mounth = DateTime.now().month.toString();
        year = DateTime.now().year.toString();
        weekday = DateTime.now().weekday.toString();
        hour = DateTime.now().hour.toInt();
        minute = DateTime.now().minute.toInt();
        second = DateTime.now().second.toInt();

        if (hour > 12) {
          hour = hour - 12;
          mood = "pm";
        }

        switch (weekday) {
          case "1":
            weekday = "Mounday";
            break;
          case "2":
            weekday = "Tuesday";
            break;
          case "3":
            weekday = "Wednesday";
            break;
          case "4":
            weekday = "Thursday";
            break;
          case "5":
            weekday = "Friday";
            break;
          case "6":
            weekday = "Saturday";
            break;
          case "7":
            weekday = "Sunday";
            break;
        }

        switch (mounth) {
          case "1":
            mounth = "Jan";
            break;
          case "2":
            mounth = "Feb";
            break;
          case "3":
            mounth = "Mar";
            break;
          case "4":
            mounth = "Apr";
            break;
          case "5":
            mounth = "May";
            break;
          case "6":
            mounth = "Jun";
            break;
          case "7":
            mounth = "JUl";
            break;
          case "8":
            mounth = "Aug";
            break;
          case "9":
            mounth = "Sep";
            break;
          case "10":
            mounth = "Oct";
            break;
          case "11":
            mounth = "NOv";
            break;
          case "12":
            mounth = "Des";
            break;
        }
      });
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    changeDateAndTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        title: Text(
          "Date & Time",
          style: TextStyle(fontSize: 27, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Color.fromARGB(255, 48, 45, 45),
      ),
      backgroundColor: Color.fromARGB(255, 75, 74, 74),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Today's Date is $weekday",
              style: TextStyle(
                color: Colors.white,
                fontSize: 32,
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Text(
              "$mounth $day , $year",
              style: TextStyle(
                color: Colors.white,
                fontSize: 35,
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Text(
              "${hour.toString().padLeft(2,"0")} : ${minute.toString().padLeft(2,"0")} : ${second.toString().padLeft(2,"0")} $mood",
              style: TextStyle(
                color: Colors.white,
                fontSize: 32,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
