import 'package:flutter/material.dart';

class Profile_Provider extends ChangeNotifier {

  int completedTasks = 0;
  int pendingTasks = 0;

  void markCompleted() {
    completedTasks++;
    notifyListeners();
  }

  void addTask() {
    pendingTasks++;
    notifyListeners();
  }

  void finishTask() {
    if (pendingTasks > 0) {
      pendingTasks--;
      completedTasks++;
      notifyListeners();
    }
  }
}