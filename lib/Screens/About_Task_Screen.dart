import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:final_app/Model/Profile_Provider.dart';

class AboutTask extends StatefulWidget {

  final Map<String, dynamic> task;

  const AboutTask({
    super.key,
    required this.task,
  });

  @override
  State<AboutTask> createState() => _AboutTaskState();
}

class _AboutTaskState extends State<AboutTask> {
  String? selectedCategory;
  bool isCompleted = false;

  @override
  void initState() {
    super.initState();

    selectedCategory = widget.task["subject"];
    isCompleted = widget.task["star"] ?? false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFEDEDED),

      appBar: AppBar(
        title: Text("About Task", style: TextStyle(color: Colors.white)),
        backgroundColor: Color(0xFF0F172A),
      ),

      body: Column(
        children: [

          Padding(
            padding: const EdgeInsets.all(10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [

                Container(
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(30),
                  ),
                  // child: DropdownButtonHideUnderline(
                  //   child: DropdownButton<String>(
                  //     value: selectedCategory,
                  //     hint: Text("Category",
                  //         style: TextStyle(color: Colors.grey[400], fontSize: 20)),
                  //     items: ['Flutter', 'Java', 'Testing', 'Math']
                  //         .map((e) => DropdownMenuItem(value: e, child: Text(e)))
                  //         .toList(),
                  //     onChanged: (v) {
                  //       setState(() {
                  //         selectedCategory = v;
                  //       });
                  //     },
                  //   ),
                  // ),
                ),

                IconButton(
                  icon: Icon(Icons.edit),
                  onPressed: () {},
                ),
              ],
            ),
          ),

          Text(
            widget.task["title"],
            style: TextStyle(fontSize: 25),
          ),

          SizedBox(height: 10),

          Container(
            margin: EdgeInsets.all(10),
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Color(0xFFC9D4F1),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Text(widget.task["subject"]),
          ),

          SizedBox(height: 20),

          Container(
            margin: EdgeInsets.all(10),
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Color(0xFFC9D4F1),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Deadline"),
                Text("17:00"),
              ],
            ),
          ),

          SizedBox(height: 20),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: EdgeInsets.only(left: 20),
                child: Text("Completed?", style: TextStyle(fontSize: 20)),
              ),
              Checkbox(
                value: isCompleted,
                onChanged: (v) {
                  setState(() {
                    isCompleted = v!;
                  });
                },
              ),
            ],
          ),

          Spacer(),

          ElevatedButton(
            onPressed: () {

              if (isCompleted) {
                Provider.of<Profile_Provider>(context, listen: false)
                    .markCompleted();
              }

              Navigator.pop(context);
            },
            child: Text("Finish"),
          ),

          SizedBox(height: 20),
        ],
      ),
    );
  }
}