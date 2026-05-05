import 'package:final_app/Screens/Subjects.dart';
import 'package:flutter/material.dart';
import 'package:fluid_bottom_nav_bar/fluid_bottom_nav_bar.dart';
import 'package:final_app/Screens/Side_menu.dart';
import 'package:final_app/Screens/notes_screen.dart';
import 'package:final_app/Screens/All_Tasks.dart';
import 'package:final_app/Screens/bottom_nav_bar.dart';


class Myhome extends StatefulWidget {
  @override
  State<Myhome> createState() => _MyhomeState();
}

class _MyhomeState extends State<Myhome> {
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFEDEDED),

      bottomNavigationBar: CustomBottomNav(
        selectedIndex: selectedIndex,
        onChange: (index) {
          setState(() {
            selectedIndex = index;
          });
        },
      ),

      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          Builder(builder: (context) => IconButton(onPressed: (){
            Scaffold.of(context).openDrawer();
          }, icon: Icon(Icons.segment_rounded, color: Colors.white,size: 30,)))
        ],

        backgroundColor: Color(0xFF0F172A),

      ),

      drawer: CustomDrawer(),

      body: Stack(
        children: [
          Container(
            height: 180,
            width: double.infinity,
            padding: EdgeInsets.only(top: 50, left: 15, right: 15, bottom: 50),
            color: Color(0xFF0F172A),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Hello! ,Jana",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 9),
                Text(
                  "2 Apr, 2026 Fri",
                  style: TextStyle(color: Colors.white70, fontSize: 13),
                ),
              ],
            ),
          ),

          Container(
            margin: EdgeInsets.only(top: 140),
            padding: EdgeInsets.all(15),
            decoration: BoxDecoration(
              color: Color(0xFFEDEDED),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              children: [
                SizedBox(height: 120),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [

                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Profile()),
                        );
                      },
                      child: Container(
                        width: 140,
                        height: 100,
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(7),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [Icon(Icons.menu_book, size: 30)],
                            ),
                            Text("Subjects", style: TextStyle(fontSize: 17)),
                          ],
                        ),
                      ),
                    ),

                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => NotesScreen()),
                        );
                      },
                      child: Container(
                        width: 140,
                        height: 100,
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(7),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [Icon(Icons.note_alt, size: 30)],
                            ),
                            Text("Notes", style: TextStyle(fontSize: 17)),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),

                SizedBox(height: 15),

                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => HomePage()),
                        );
                      },
                      child: Container(
                        width: 140,
                        height: 100,
                        padding: EdgeInsets.all(10),
                        margin: EdgeInsets.fromLTRB(35, 15, 0, 0),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(7),
                        ),
                        child: Column(
                          mainAxisAlignment:
                          MainAxisAlignment.spaceBetween,
                          crossAxisAlignment:
                          CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment:
                              MainAxisAlignment.end,
                              children: [
                                Icon(Icons.access_time, size: 30)
                              ],
                            ),
                            Text("Tasks",
                                style: TextStyle(fontSize: 17)),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),

          Container(
            width: double.infinity,
            height: 120,
            margin: EdgeInsets.only(top: 120, left: 40, right: 40),
            padding: EdgeInsets.all(15),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(7),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("What's Next",
                    style: TextStyle(color: Colors.grey)),
                SizedBox(height: 12),
                Text(
                  "Geometric Weekly Exam",
                  style: TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 15),
                ),
                SizedBox(height: 12),
                Text("2 Days To Go",
                    style: TextStyle(color: Colors.grey)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}