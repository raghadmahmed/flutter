import 'package:final_app/Screens/Settings.dart';
import 'package:final_app/Screens/Starred.dart';
import 'package:final_app/Screens/Subjects.dart';
import 'package:final_app/Screens/Timer_Screen.dart';
import 'package:flutter/material.dart';
import 'package:final_app/Screens/Subjects.dart';
import 'package:final_app/Screens/Lessons_Screen.dart';
import 'package:final_app/Screens/Profile_Screen.dart';

class CustomDrawer extends StatefulWidget {
  const CustomDrawer({super.key});

  @override
  State<CustomDrawer> createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {
  bool isOpen = false;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [

          Container(
            width: double.infinity,
            padding: const EdgeInsets.only(top: 60, bottom: 20),
            color: const Color(0xFF0F172A),
            child: Row(
              spacing: 20,
              children:  [
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ProfileScreen(),
                      ),
                    );
                  },
                  child: CircleAvatar(
                    radius: 35,
                    backgroundColor: Colors.white,
                    child: Icon(
                      Icons.person_outline_rounded,
                      size: 50,
                      color: Color(0xFF0F172A),
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  "UserName",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),

          Expanded(

            child: Container(
              color: Color(0xFFEDEDED),
              child: ListView(
                padding: const EdgeInsets.all(15),
                children: [

                  GestureDetector(
                    onTap: () {
                      setState(() {
                        isOpen = !isOpen;
                      });
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: const [
                            Icon(Icons.grid_view_rounded, color: Color(0xFF0F172A),),
                            SizedBox(width: 10),
                            Text(
                              "Category",
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),

                        Icon(
                          isOpen
                              ? Icons.keyboard_arrow_down
                              : Icons.keyboard_arrow_up,
                        ),
                      ],
                    ),
                  ),

                  if (isOpen) ...[
                    const SizedBox(height: 15),

                    _buildItem(context, "Flutter", Icons.library_books_rounded, () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => SubjectPage(
                        subjectName: "Flutter",

                      )));
                    }),
                    _buildItem(context, "Java", Icons.library_books_rounded, () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => SubjectPage(
                        subjectName: "Java",)));
                    }),
                    _buildItem(context, "Math", Icons.library_books_rounded, () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => SubjectPage(
                        subjectName: "Math",)));

                    }),
                    _buildItem(context, "Testing", Icons.library_books_rounded, () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => SubjectPage(
                        subjectName: "Testing",)));

                    }),
                  ],

                  const SizedBox(height: 20),

                  _buildItem(context, "Starred", Icons.star, () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => StudyPage()));

                  }),
                  _buildItem(context, "Theme", Icons.format_paint, () {}),
                  _buildItem(context, "Timer", Icons.timer, () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => TimerPage()));
                  }),
                  _buildItem(context, "Settings", Icons.settings, () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => Setting()));
                  }),

                  const SizedBox(height: 20),

                  _buildItem(context, "Log Out", Icons.logout, () {}),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildItem(
      BuildContext context, String title, IconData icon, VoidCallback onTap) {
    return ListTile(
      leading: Icon(icon),
      title: Text(title, style: const TextStyle(fontSize: 16)),
      onTap: onTap,
    );
  }
}

class DummyScreen extends StatelessWidget {
  final String title;
  const DummyScreen({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        backgroundColor: const Color(0xFF0F172A),
      ),
      body: Center(
        child: Text("$title Screen"),
      ),
    );
  }
}