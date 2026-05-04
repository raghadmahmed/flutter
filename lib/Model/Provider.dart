import 'package:flutter/material.dart';
import 'package:final_app/Model/note_model.dart';
class AppData {
  List<String> subjects = [];
  List<Note> notes = [];
  List<String> lessons = [];
}

class AppProvider extends ChangeNotifier {
  List<String> subjects = [];
  List<Note> notes = [];
  List<String> lessons = [];
  List<String> tasks = [];
  String _query = "";

  String get query => _query;

  void setQuery(String value) {
    _query = value;
    notifyListeners();
  }

  void addSubject(String name) {
    subjects.add(name);
    notifyListeners();
  }

  void addNote(Note note) {
    notes.add(note);
    notifyListeners();
  }
  void toggleFav(int index) {
    notes[index].isFav = !notes[index].isFav;
    notifyListeners();
  }

  void addLesson(String lesson) {
    lessons.add(lesson);
    notifyListeners();
  }
  void addTask(String task) {
    tasks.add(task);
    notifyListeners();
  }
}

