import 'package:flutter/material.dart';
class Note {
  String title;
  String desc;
  Color color;
  bool isFav;

  Note({
    required this.title,
    required this.desc,
    required this.color,
    this.isFav = false,
  });
}