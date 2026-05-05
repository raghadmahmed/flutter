import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:final_app/Model/Profile_Provider.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final provider = Provider.of<Profile_Provider>(context);

    return Scaffold(
      backgroundColor: Color(0xFF0F172A),

      appBar: AppBar(
        backgroundColor: Color(0xFF0F172A),
        title: Text("Profile"),
      ),

      body: Column(
        children: [

          Padding(
            padding: EdgeInsets.all(20),
            child: Row(
              children: [
                CircleAvatar(radius: 30),
                SizedBox(width: 10),
                Text("UserName", style: TextStyle(color: Colors.white)),
              ],
            ),
          ),

          Expanded(
            child: Container(
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
              ),
              child: Column(
                children: [

                  Text("Tasks Overview",
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),

                  SizedBox(height: 20),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [

                      Container(
                        width: 140,
                        padding: EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Column(
                          children: [
                            Text(
                              "${provider.completedTasks}",
                              style: TextStyle(
                                  fontSize: 30, fontWeight: FontWeight.bold),
                            ),
                            Text("Completed"),
                          ],
                        ),
                      ),

                      Container(
                        width: 140,
                        padding: EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Column(
                          children: [
                            Text(
                              "${provider.pendingTasks}",
                              style: TextStyle(
                                  fontSize: 30, fontWeight: FontWeight.bold),
                            ),
                            Text("Pending"),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}