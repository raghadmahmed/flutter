import 'package:final_app/Model/Provider.dart';
import 'package:flutter/material.dart';
import 'package:fluid_bottom_nav_bar/fluid_bottom_nav_bar.dart';
import 'package:final_app/Screens/Add_lesson_Screen.dart';
import 'package:provider/provider.dart';

class SubjectPage extends StatefulWidget {
  final String subjectName;
  SubjectPage({required this.subjectName});

  @override
  State<SubjectPage> createState() => _SubjectPageState();
}

class _SubjectPageState extends State<SubjectPage> {

  String searchText = "";

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<AppProvider>(context);

    List<String> filteredLessons = provider.lessons.where((lesson) {
      return lesson.toLowerCase().contains(searchText.toLowerCase());
    }).toList();

    return Scaffold(
      backgroundColor: Color(0xFFEDEDED),
      appBar: AppBar(
        backgroundColor: Color(0xFF0F172A),
        toolbarHeight: 120,
        automaticallyImplyLeading: false,
        title: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children:[
                    GestureDetector(
                      onTap: (){
                        Navigator.pop(context);
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Icon(Icons.chevron_left,size:30,color:Colors.black),
                      ),
                    ),
                    Icon(Icons.segment,size: 30,color:Colors.white),
                  ],
                ),
                 Text(widget.subjectName,
                  style:TextStyle(fontSize: 30,fontWeight: FontWeight.bold,color: Colors.white),
                ),
              ],
            ),
          ),
        ),
      ),

      body: Container(
        color: Color(0xFF0F172A),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.grey[300],
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(15),
              topRight: Radius.circular(15),
            ),
          ),
          child: Padding(
            padding: EdgeInsets.all(20),
            child: Column(
              children:[

                Container(
                  width: 330,
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  decoration: BoxDecoration(
                    color: Color(0xFFEDEDED),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: TextField(
                    onChanged: (value){
                      setState(() {
                        searchText = value;
                      });
                    },
                    decoration: InputDecoration(
                      hintText: "Search Lesson",
                      prefixIcon: Icon(Icons.search, color: Colors.grey),
                      border: InputBorder.none,
                    ),
                  ),
                ),

                SizedBox(height: 20),

                Expanded(
                  child: filteredLessons.isEmpty
                      ? Center(
                    child: Text("No Lessons Yet"),
                  )
                      : ListView.builder(
                    itemCount: filteredLessons.length,
                    itemBuilder: (context, index) {
                      return Container(
                        margin: EdgeInsets.only(bottom: 15),
                        padding: EdgeInsets.all(15),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(filteredLessons[index]),
                            Icon(Icons.play_arrow),
                          ],
                        ),
                      );
                    },
                  ),
                ),

                Align(
                  alignment: Alignment.bottomRight,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFF0F172A),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => AddLessonPage(),
                        ),
                      );
                    },
                    child: Text("Add Lesson",
                        style:TextStyle(color: Colors.white)),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),

      bottomNavigationBar: FluidNavBar(
        icons:[
          FluidNavBarIcon(icon: Icons.home),
          FluidNavBarIcon(icon: Icons.access_time),
          FluidNavBarIcon(icon: Icons.menu_book),
          FluidNavBarIcon(icon: Icons.note_add),
        ],
        onChange:(index){},
        style:FluidNavBarStyle(
          barBackgroundColor:Color(0xFF0F172A),
          iconSelectedForegroundColor:Colors.white,
        ),
      ),
    );
  }
}