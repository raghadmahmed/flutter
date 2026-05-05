import 'package:flutter/material.dart';
import 'package:fluid_bottom_nav_bar/fluid_bottom_nav_bar.dart';
import 'package:final_app/Screens/Side_menu.dart';
import 'package:final_app/Screens/Add_Task_Screen.dart';
import 'package:final_app/Screens/bottom_nav_bar.dart';
import 'package:final_app/Screens/About_Task_Screen.dart';
class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}
class _HomePageState extends State<HomePage> {
  int selectedIndex = 1;
  DateTime today = DateTime.now();
  DateTime selectedDate = DateTime.now();
  final ScrollController _scrollController = ScrollController();
  late DateTime startDate;

  List<Map<String, dynamic>> tasks=[
    {"title": "JAVA Task", "subject": "JAVA", "color": Color(0xFFB5B8C5), "star": false},
    {"title": "Physics Task", "subject": "Physics", "color": Color(0xFF8B1A1A), "star": false},
  ];
  String getDayName(DateTime d) {
    List names = ["MON", "TUE", "WED", "THU", "FRI", "SAT", "SUN"];
    return names[d.weekday-1];
  }
  String getMonthName(DateTime d) {
    List months = [
      "January","February","March","April","May","June",
      "July","August","September","October","November","December"
    ];
    return months[d.month - 1];
  }
  bool isSameDay(DateTime a, DateTime b) {
    return a.day==b.day&&a.month==b.month&&a.year==b.year;
  }
  DateTime getDateFromIndex(int index) {
    return startDate.add(Duration(days: index));
  }
  @override
  void initState() {
    super.initState();
    startDate = DateTime(today.year, 1, 1);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      int index = today.difference(startDate).inDays;
      _scrollController.jumpTo( index * 80.0);
    });
  }
  @override
  Widget build(BuildContext context) {
    String monthYear =
        "${getMonthName(selectedDate)} ${selectedDate.year}";
    return Scaffold(
      backgroundColor: Color(0xFFEDEDED),
      appBar: AppBar(
        leading: null,
          actions: [
            Builder(builder: (context) => IconButton(onPressed: (){
              Scaffold.of(context).openDrawer();
            }, icon: Icon(Icons.segment_rounded, color: Colors.white,size: 30,)))
          ],
        backgroundColor: Color(0xFF0F172A),
        toolbarHeight: 280,
        elevation: 0,
        title: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
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
              ],
            ),
            SizedBox(height: 20),
            Text(
              monthYear,
              style: TextStyle(
                fontSize: 26,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),

            SizedBox(height: 20),
            SizedBox(
              height: 140,
              child: ListView.builder(
                clipBehavior: Clip.none,
                scrollDirection: Axis.horizontal,
                controller: _scrollController,
                itemBuilder: (context, index) {
                  DateTime d = getDateFromIndex(index);
                  bool selected = isSameDay(d, selectedDate);
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedDate = d;
                      });
                    },
                    child: AnimatedContainer(
                      duration: Duration(milliseconds: 200),
                      margin: EdgeInsets.symmetric(horizontal: 6),
                      transform: Matrix4.translationValues(
                        0,
                        selected ? -15 : 0,
                        0,
                      ),
                      width: 70,
                      decoration: BoxDecoration(
                        color: selected ? Color(0xFF3A4F7A):Colors.white,
                        borderRadius: BorderRadius.circular(15),
                        boxShadow: selected
                            ? [
                          BoxShadow(
                            color: Colors.black26,
                            blurRadius: 8,
                            offset: Offset(0, 4),
                          )
                        ]
                            : [],
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            getDayName(d),
                            style: TextStyle(
                              color: selected ? Colors.white : Colors.black,
                            ),
                          ),
                          SizedBox(height: 5),
                          Text(
                            d.day.toString(),
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: selected ? Colors.white : Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      drawer: CustomDrawer(

      ),
      body: Container(
        color: Color(0xFF0F172A),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.grey[300],
            borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
          ),
          child: Padding(
            padding: EdgeInsets.all(20),
            child: Column(
              children: [
                Align(alignment: Alignment.centerLeft, child: Text("Today's Tasks",style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold)),
                ),
                SizedBox(height: 20),
                Expanded(
                  child: ListView.builder(
                    itemCount: tasks.length,
                    itemBuilder: (_, i) {
                      var t = tasks[i];
                      return GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => AboutTask(task: t),
                              ),
                            );
                          },

                          child: Container(
                              margin: EdgeInsets.only(bottom: 20),
                              padding: EdgeInsets.all(25),
                              decoration: BoxDecoration(
                                color: t["color"],
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              t["title"],
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Column(
                              children: [
                                Container(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 10,
                                    vertical: 4,
                                  ),
                                  decoration: BoxDecoration(
                                    color: Colors.white.withOpacity(0.3),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: Text(t["subject"],style: TextStyle(fontSize: 12,fontWeight: FontWeight.bold,color: Colors.white),
                                  ),
                                ),
                                SizedBox(height: 10),
                                GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      t["star"] = !t["star"];
                                    });
                                  },
                                  child: Icon(
                                    Icons.star,
                                    color: t["star"]
                                        ? Colors.yellow
                                        : Colors.grey,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      )
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),

      bottomNavigationBar: CustomBottomNav(
        selectedIndex: selectedIndex,
        onChange: (index) {
          setState(() {
            selectedIndex = index;
          });
        },
      ),
    );
  }
}