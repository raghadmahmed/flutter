import 'package:final_app/Screens/Home_Screen.dart';
import 'package:flutter/material.dart';

class Notes extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: NotesScreen(),
    );
  }
}

class NotesScreen extends StatelessWidget {
  final List<Map<String, dynamic>> notes = [
    {
      "title": "Remember",
      "desc": "Stay organized and keep track...",
      "color": Color(0xFF8B1A1A),
    },
    {
      "title": "Ideas & Projects",
      "desc": "Mini Flutter app, doodles...",
      "color": Color(0xFFCBD5F5),
    },
    {
      "title": "Focus",
      "desc": "One thing at a time.",
      "color": Color(0xFF3A4E64),
    },
    {
      "title": "Flutter",
      "desc": "Learn widgets & layouts",
      "color": Color(0xFFCBD5F5),
    },
    {
      "title": "Flutter",
      "desc": "Learn widgets & layouts",
      "color": Color(0xFFB5B8C5),
    },
    {
      "title": "Flutter",
      "desc": "Learn widgets & layouts",
      "color": Color(0xFF8B1A1A),
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF0F172A),
      appBar: AppBar(
        toolbarHeight: 150,
        backgroundColor: Color(0xFF0F172A),
        elevation: 0,
        title: Column(
          spacing: 10,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                    padding: EdgeInsetsGeometry.all(3),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white,
                    ),
                    child: Icon(Icons.arrow_back_ios_outlined, color: Color(0xFF0F172A),)),
                Icon(Icons.segment_rounded, color: Colors.white,),
              ],
            ),
            Text(
              "My Notes",
              style: TextStyle(
                color: Colors.white,
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          color: Colors.grey[200],
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(30),
          ),
        ),
        child: Column(

          children: [
            Container(
              margin: EdgeInsets.fromLTRB(5, 15, 5, 15),
              padding: EdgeInsetsGeometry.all(15),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20)
              ),
              child: Row(
                children: [
                  Icon(Icons.search, color: Colors.grey,),
                  Text("Search notes" ,style: TextStyle(color: Colors.grey),),
                ],
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: GridView.builder(
                  itemCount: notes.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 12,
                    mainAxisSpacing: 12,
                    childAspectRatio: 0.9,
                  ),
                  itemBuilder: (context, index) {
                    final note = notes[index];

                    return Container(
                      padding: EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: note["color"],
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            spacing: 3,
                            children: [
                              Icon(Icons.star_border_rounded, color: Colors.white),
                              SizedBox(height: 10),
                              Text(
                                note["title"],
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),

                          SizedBox(height: 8),
                          Text(
                            note["desc"],
                            style: TextStyle(color: Colors.white),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ),
            SizedBox(
              width: double.infinity,
              height: 52,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) =>  Myhome()));
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF1A2340),
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                child: const Text('Add Notes'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}