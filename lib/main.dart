import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:dictionary_app/pages/word_page.dart';
import 'package:flutter/material.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

void main() {
  AwesomeNotifications().initialize(
    'assets/logo.png',
    [
      NotificationChannel(
        channelKey: 'basic_channel',
        channelName: 'Basic notifications',
        channelDescription: 'Notification channel for basic notifications',
        defaultColor: Color.fromARGB(255, 242, 166, 166),
        ledColor: const Color.fromARGB(255, 255, 72, 72),
      ),
    ],
  );

  AwesomeNotifications().createNotification(
    content: NotificationContent(
      id: 0,
      channelKey: 'daily_notification',
      title: 'Дума на деня',
      body: 'Обогатете речника си днес!',
    ),
    schedule: NotificationCalendar(
      timeZone: 'Europe/Sofia', // Set the time zone to Bulgarian time
      hour: 9,
      minute: 0,
      second: 0,
      allowWhileIdle:
          true, // Allow notification to be shown even if device is idle
      repeats: true, // Repeat daily
    ),
  );
  //await fetchAndDisplayRandomWord();

  sqfliteFfiInit();
  databaseFactory = databaseFactoryFfi;
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'За думите',
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
      home: WordPage(),
    );
  }
}
