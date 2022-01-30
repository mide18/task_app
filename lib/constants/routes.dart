import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:task_manager_app/screens/edit_task_screen.dart';
import 'package:task_manager_app/screens/intro_screen.dart';
import 'package:task_manager_app/screens/tasks_screen.dart';

class AppRoutes{
  static const String tasksScreen = './tasksScreen';
  static const String editTaskScreen = '/editTaskScreen';

  static Route<dynamic> onGenerateRoute(RouteSettings settings){
    switch(settings.name) {
      case editTaskScreen: return _buildRoute(EditTaskScreen(), settings);
      case tasksScreen: return _buildRoute(TasksScreen(), settings);
      default: return _buildRoute(IntroScreen(), settings);

    }
  }
  static _buildRoute(Widget screen, RouteSettings settings) {
    return MaterialPageRoute(builder: (context) => screen, settings: settings);
  }
}