import 'package:flutter/material.dart';
import 'package:final_app/Model/Provider.dart';
import 'package:provider/provider.dart';

class AddLessonPage extends StatefulWidget {
  @override
  State<AddLessonPage> createState() => _AddLessonPageState();
}
class _AddLessonPageState extends State<AddLessonPage> {

  TextEditingController lessonController = TextEditingController();
  void saveLesson() {
    String lessonName = lessonController.text;

    if (lessonName.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Please enter lesson name")),
      );
      return;
    }

    Provider.of<AppProvider>(context, listen: false)
        .addLesson(lessonName);

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text("Lesson Saved ✅")),
    );

    lessonController.clear();

    Navigator.pop(context);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF0F172A),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: IconButton(
                      icon: Icon(Icons.arrow_back_ios_new, size: 18),
                      onPressed: () {},
                    ),
                  ),
                  Icon(Icons.segment, color: Colors.white, size: 28),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, top: 10, bottom: 20),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text("Add Lesson",style: TextStyle(color: Colors.white,fontSize: 34,fontWeight: FontWeight.bold)),
              ),
            ),
            Expanded(
              child: Container(
                width: double.infinity,
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Color(0xFFEDEDED),
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(20),
                  ),
                ),
                child: ListView(
                  children: [
                    Text("Lesson Name",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w600)),
                    SizedBox(height: 15),
                    Container(
                      height: 55,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: TextField(
                        controller: lessonController,
                        decoration: InputDecoration(
                          hintText: "Enter lesson name",
                          border: InputBorder.none,
                          contentPadding:
                          EdgeInsets.symmetric(horizontal: 20),
                        ),
                      ),
                    ),
                    SizedBox(height: 30),
                    Text("Upload Materials",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w600)),
                    SizedBox(height: 15),
                    Container(
                      height: 180,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(25),
                      ),
                    ),
                    SizedBox(height: 40),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: GestureDetector(
                        onTap: saveLesson,
                        child: Container(
                          width: 140,
                          height: 60,
                          decoration: BoxDecoration(
                            color: Color(0xFF0D1B2A),
                            borderRadius: BorderRadius.circular(25),
                          ),
                          child: Center(
                            child: Text("Save",style: TextStyle(color: Colors.white,fontSize: 22,fontWeight: FontWeight.bold)),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
