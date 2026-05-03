import 'package:flutter/material.dart';

class CustomDrawer extends StatefulWidget {
  const CustomDrawer({super.key});

  @override
  State<CustomDrawer> createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {
  List<String> subjects = ["Flutter", "Java", "Math"];
  int selectedIndex = 0;

  void onItemTap(int index) {
    setState(() {
      selectedIndex = index;
    });
    Navigator.pop(context); // يقفل الدراور
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [

          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(vertical: 40),
            color: Color(0xFF0F172A),
            child: const Column(
              children: [
                CircleAvatar(radius: 30),
                SizedBox(height: 10),
                Text("UserName", style: TextStyle(color: Colors.white)),
              ],
            ),
          ),

          Expanded(
            child: ListView(
              children: [

                ExpansionTile(
                  title: Text("Category"),
                  children: subjects.map((subject) {
                    return ListTile(
                      title: Text(subject),
                    );
                  }).toList(),
                ),

                ListTile(
                  leading: Icon(Icons.star),
                  title: Text("Starred"),
                  selected: selectedIndex == 1,
                  onTap: () => onItemTap(1),
                ),

                ListTile(
                  leading: Icon(Icons.settings),
                  title: Text("Settings"),
                  selected: selectedIndex == 2,
                  onTap: () => onItemTap(2),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}