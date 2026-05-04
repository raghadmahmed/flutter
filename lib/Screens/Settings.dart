import 'package:final_app/Screens/All_Tasks.dart';
import 'package:flutter/material.dart';
void main() {
  runApp(Setting());
}

class Setting extends StatefulWidget {
  @override
  State<Setting> createState() => _SettingState();
}

class _SettingState extends State<Setting> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.grey[200],
        appBar: AppBar(
          backgroundColor: Color(0xFF0F172A),
          toolbarHeight: 140,
          title: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white,
                    ),
                    padding: EdgeInsets.all(5),
                    child: Icon(Icons.arrow_back, size: 30),
                  ),
                  Icon(Icons.segment, size: 30, color: Colors.white),
                ],
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "Settings",
                    style: TextStyle(
                      fontSize: 28,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),

        body: Column(

          children: [
            Expanded(
              child: Container(
                margin:EdgeInsets.all(10),
                padding: EdgeInsets.all(15),
                child: ListView(
                  children: [
                    Container(
                      width: 90,
                      height: 60,
                      decoration: BoxDecoration(
                        color: Colors.white,

                      ),
                      child: ListTile(
                        leading: Icon(Icons.person_outline, color: Colors.black),
                        title: Text(
                          "Account",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => HomePage()),
                          );
                        },
                      ),
                    ),
                    SizedBox(height: 10),
                    Container(
                      width: 90,
                      height: 60,
                      decoration: BoxDecoration(
                        color: Colors.white,

                      ),
                      child: ListTile(
                        leading: Icon(Icons.brush_outlined, color: Colors.black),
                        title: Text(
                          "Theme",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => HomePage()),
                          );
                        },
                      ),
                    ),
                    SizedBox(height: 10),
                    Container(
                      width: 90,
                      height: 60,
                      decoration: BoxDecoration(
                        color: Colors.white,

                      ),
                      child: ListTile(
                        leading: Icon(Icons.language, color: Colors.black),
                        title: Text(
                          "Language",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => HomePage()),
                          );
                        },

                      ),

                    ),
                    SizedBox(height: 10),

                    Container(
                      width: 90,
                      height: 60,
                      decoration: BoxDecoration(
                        color: Colors.white,

                      ),
                      child: ListTile(
                        leading: Icon(Icons.info_outline, color: Colors.black),
                        title: Text(
                          "About Us",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => HomePage()),
                          );
                        },
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
