import 'dart:async';
import 'package:flutter/material.dart';
import 'package:healthy_routine_mobile/healthy_routine.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

void main() => runApp(Application());

final appTheme = ThemeData(
  buttonColor: PURPLE,
  scaffoldBackgroundColor: PURPLE,
  backgroundColor: BACKGROUND_GRAY,
  dividerColor: LIGHT_GRAY,
  textTheme: TextTheme(
    title: WHITE_BOLD.copyWith(fontSize: 24),
    body1: PURPLE_BOLD.copyWith(fontSize: 14),
    headline: DEEP_PURPLE_BOLD.copyWith(fontSize: 14),
    display1: PURPLE_BOLD.copyWith(fontSize: 24),
    button: WHITE_FONT.copyWith(fontSize: 16),
    caption: WHITE_FONT.copyWith(color: WHITE.withOpacity(0.8))
  ),
  floatingActionButtonTheme: FloatingActionButtonThemeData(
    backgroundColor: PURPLE,
    shape: ROUNDED_SQUARE_SHAPE,
  ),
  primaryColor: PURPLE,
  cursorColor: PURPLE,
  secondaryHeaderColor: LIGHT_GRAY,
);

class Application extends StatefulWidget {
  _Application createState() => _Application();
}

class _Application extends State<Application> {
  NotificationService notificationService = NotificationService();
  Timer timer;
  @override
  initState() {
    super.initState();
    notificationService.initLocalNotification();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      timer = Timer(Duration(seconds: 5), () {
        notificationService.showNotificationWithoutSound();
      });
    });
  }



  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Healthy Routine',
      theme: appTheme,
      home: DailyTaskListPage(notificationService: notificationService),
      routes: {
        Routes.createTask: (c) => CreateTaskPage(),
      },
    );
  }
}
