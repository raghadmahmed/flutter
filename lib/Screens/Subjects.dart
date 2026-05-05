import 'package:final_app/Screens/Notes_screen.dart';
import 'package:flutter/material.dart';
import 'package:fluid_bottom_nav_bar/fluid_bottom_nav_bar.dart';
import 'package:final_app/Screens/Lessons_Screen.dart';
class Profile extends StatefulWidget {
  @override
  State<Profile> createState() => _ProfileState();
}
class _ProfileState extends State<Profile> {
  List<Map<String, dynamic>> subjects = [
    {"name":"Flutter","color":Color(0xFFCBD5F5)},
    {"name":"Testing","color":Color(0xFF5C4033)},
    {"name":"Java","color":Color(0xFF3A4E64)},
    {"name":"Math","color":Color(0xFFB5B8C5)},
    {"name":"English","color":Color(0xFF8B1A1A)},
    {"name":"Arabic","color":Color(0xFFCBD5F5)},
    {"name":"Studies","color":Color(0xFF5C4033)},
    {"name":"Web","color":Color(0xFF3A4E64)},
    {"name":"C++","color":Color(0xFF3A4E64)},
    {"name":"Database","color":Color(0xFFB5B8C5)},
  ];
  List<Map<String, dynamic>> filteredSubjects = [];
  @override
  void initState() {
    super.initState();
    filteredSubjects = subjects;
  }
  void search(String value){
    setState((){
      filteredSubjects = subjects.where((subject){
        return subject["name"]
            .toLowerCase()
            .contains(value.toLowerCase());
      }).toList();
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFEDEDED),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Color(0xFF0F172A),
        toolbarHeight: 120,
        title: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children:[
                    Container(
                      width: 30,
                      height: 30,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: IconButton(
                        icon: Icon(Icons.chevron_left, size: 16),
                        padding: EdgeInsets.zero,
                        constraints: BoxConstraints(),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                    ),
                    Icon(Icons.segment,size: 30,color:Colors.white),
                  ],
                ),
                SizedBox(height:10),
                Text("Subjects", style:TextStyle(fontSize: 30,fontWeight: FontWeight.bold,color: Colors.white,),
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
                    onChanged: search,
                    decoration: InputDecoration(
                      hintText: "Search Subject",
                      prefixIcon: Icon(Icons.search, color: Colors.grey),
                      border: InputBorder.none,
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Expanded(
                  child: filteredSubjects.isEmpty?Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children:[
                        Icon(Icons.search_off,size: 60,color:Colors.grey),
                        SizedBox(height: 10),
                        Text("No Results Found",style:TextStyle(fontSize:20,fontWeight:FontWeight.bold,color:Colors.grey,),
                        ),
                      ],
                    ),
                  )
                      :GridView.builder(
                    itemCount:filteredSubjects.length,
                    gridDelegate:
                    SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 20,
                      mainAxisSpacing: 15,
                      childAspectRatio: 1.5,
                    ),
                    itemBuilder:(context, index) {
                      return GestureDetector(onTap:(){Navigator.push(context,MaterialPageRoute(builder: (context) => SubjectPage(
                        subjectName: filteredSubjects[index]["name"],
                      ),
                      ),
                      );
                      },
                        child:Container(
                          decoration:BoxDecoration(
                            color:
                            filteredSubjects[index]["color"],
                            borderRadius:
                            BorderRadius.circular(20),
                          ),
                          child: Center(
                            child: Row(
                              mainAxisAlignment:
                              MainAxisAlignment.spaceEvenly,
                              children:[Text(filteredSubjects[index]["name"], style: TextStyle(fontSize: 20,color: Colors.black,fontWeight: FontWeight.bold),),
                                Icon(Icons.arrow_forward_ios_outlined,color: Colors.black,size: 18),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}