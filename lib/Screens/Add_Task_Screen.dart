import 'package:flutter/material.dart';

class add_tasks extends StatefulWidget {
  @override
  State<add_tasks> createState() => _add_tasksState();
}

class _add_tasksState extends State<add_tasks> {
  DateTime today = DateTime.now();
  DateTime selectedDate = DateTime.now();
  final ScrollController _controller = ScrollController();
  late DateTime startDate;

  final TextEditingController titleController = TextEditingController();
  final TextEditingController descController = TextEditingController();

  String getDayName(DateTime d) {
    List names = ["MON","TUE","WED","THU","FRI","SAT","SUN"];
    return names[d.weekday - 1];
  }

  String getMonthName(DateTime d) {
    List months = [
      "January","February","March","April","May","June",
      "July","August","September","October","November","December"
    ];
    return months[d.month - 1];
  }

  DateTime getDateFromIndex(int index) {
    return startDate.add(Duration(days: index));
  }

  bool isSameDay(DateTime a, DateTime b) {
    return a.day==b.day&&a.month==b.month&&a.year==b.year;
  }

  @override
  void initState() {
    super.initState();
    startDate = DateTime(today.year, 1, 1);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      int index = today.difference(startDate).inDays;
      _controller.jumpTo(index * 80.0);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF0F172A),

      appBar: AppBar(
        backgroundColor: Color(0xFF0F172A),
        toolbarHeight: 140,
        title: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: Container(
                    padding: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Icon(Icons.arrow_back, size: 30),
                  ),
                ),
                Icon(Icons.segment, size: 30, color: Colors.white),
              ],
            ),
            SizedBox(height: 20),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Add Tasks",
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),

      body: Container(
        decoration: BoxDecoration(
          color: Colors.grey[200],
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(15),
            topRight: Radius.circular(15),
          ),
        ),

        child: ListView(
          padding: EdgeInsets.all(20),
          children: [

            TextField(
              controller: titleController,
              decoration: InputDecoration(
                hintText: "Task Name",
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
              ),
            ),

            SizedBox(height: 15),

            TextField(
              controller: descController,
              maxLines: 4,
              decoration: InputDecoration(
                hintText: "Task Description",
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
              ),
            ),

            SizedBox(height: 30),

            GestureDetector(
              onTap: () {
                Navigator.pop(context, {
                  "title": titleController.text,
                  "subject": descController.text,
                  "color": Color(0xFF8B1A1A),
                  "star": false,
                });
              },
              child: Container(
                width: double.infinity,
                height: 60,
                decoration: BoxDecoration(
                  color: Color(0xFF0B1B3B),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Center(
                  child: Text(
                    "Add",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),

          ],
        ),
      ),
    );
  }
}