import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:task_app/view/recycle_bin.dart';
import 'package:task_app/view/tasks_screen.dart';

class AppRouter {
  Route? onGeneratedRoute(RouteSettings route) {
    switch (route.name) {
      case 'recycle_bin':
        return MaterialPageRoute(
          builder: (context) {
            return RecycleBin();
          },
        );
      case 'task_screen':
        return MaterialPageRoute(
          builder: (context) {
            return Task_Screen_EXP();
          },
        );
      default:
        return null;
    }
  }
}
