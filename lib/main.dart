import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:dictionary_app/database/database_service.dart';
import 'package:dictionary_app/pages/word_page.dart';
import 'package:dictionary_app/utils/word_adder.dart';
import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
//import 'package:sqflite_common_ffi/sqflite_ffi.dart';

void main() {
  AwesomeNotifications().initialize(
      null, // default icon
      [
        NotificationChannel(
          channelKey: 'dictionary_app',
          channelName: 'Dictionary app',
          channelDescription: 'Notification channel for daily updates',
          defaultColor: Color(0xFF9D50DD),
          ledColor: Colors.white,
          playSound: true,
          enableVibration: true,
        ),
        // Define other channels if necessary
      ],
      debug: true // set this to false in production
      );

  AwesomeNotifications().createNotification(
    content: NotificationContent(
        id: 10,
        channelKey: 'dictionary_app',
        title: 'Дума на деня',
        body: 'Обогатете речника си днес!',
        icon: 'resource://drawable/logo'),
    schedule: NotificationCalendar(
      timeZone: 'Europe/Sofia', // Set the time zone to Bulgarian time
      hour: 1,
      minute: 16,
      second: 0,
      allowWhileIdle:
          true, // Allow notification to be shown even if device is idle
      repeats: true, // Repeat daily
    ),
  );
  //await fetchAndDisplayRandomWord();

  //sqfliteFfiInit();
  //databaseFactory = databaseFactoryFfi;
  runApp(MyApp());
}

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'За думите',
//       theme: ThemeData(
//         primarySwatch: Colors.orange,
//       ),
//       home: WordPage(),
//     );
//   }
// }

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    checkDatabaseContent();
  }

  @override
  Widget build(BuildContext context) {
    print("Building MyApp");
    addWordsToDB();
    return MaterialApp(
      title: 'За думите',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: WordPage(),
    );
  }

  Future<void> checkDatabaseContent() async {
    final Database db = await DatabaseService().database;
    List<Map> result = await db.query('words');
    if (result.isEmpty) {
      print('Database is empty');
    } else {
      print('Database has data');
    }
  }
}
