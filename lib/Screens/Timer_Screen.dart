import 'dart:async';
import 'package:fluid_bottom_nav_bar/fluid_bottom_nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:final_app/Screens/Side_menu.dart';
class TimerPage extends StatefulWidget {
  @override
  State<TimerPage> createState() => _TimerPageState();
}

class _TimerPageState extends State<TimerPage> {
  int seconds = 0;
  Timer? timer;
  bool isRunning = false;

  void startTimer() {
    if (isRunning || seconds == 0) return;

    setState(() {
      isRunning = true;
    });

    timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (seconds > 0) {
        setState(() {
          seconds--;
        });
      } else {
        timer.cancel();
        setState(() {
          isRunning = false;
        });
      }
    });
  }

  void pauseTimer() {
    timer?.cancel();
    setState(() {
      isRunning = false;
    });
  }

  void resetTimer() {
    timer?.cancel();
    setState(() {
      seconds = 0;
      isRunning = false;
    });
  }

  void addTime() {
    if (isRunning) return;

    setState(() {
      seconds += 60;
    });
  }

  void minusTime() {
    if (isRunning) return;

    setState(() {
      if (seconds >= 60) {
        seconds -= 60;
      } else {
        seconds = 0;
      }
    });
  }

  String formatTime(int seconds) {
    int minutes = seconds ~/ 60;
    int secs = seconds % 60;

    return "${minutes.toString().padLeft(2, '0')}:${secs.toString().padLeft(2, '0')}";
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.grey[200],

        bottomNavigationBar: FluidNavBar(
          icons: [
            FluidNavBarIcon(icon: Icons.home, backgroundColor: Color(0xFF0F172A)),
            FluidNavBarIcon(icon: Icons.access_time, backgroundColor: Color(0xFF0F172A)),
            FluidNavBarIcon(icon: Icons.menu_book, backgroundColor: Color(0xFF0F172A)),
            FluidNavBarIcon(icon: Icons.checklist, backgroundColor: Color(0xFF0F172A)),
            FluidNavBarIcon(icon: Icons.note_add, backgroundColor: Color(0xFF0F172A)),
          ],
          onChange: (index) {},
          style: FluidNavBarStyle(
            barBackgroundColor: Color(0xFF0F172A),
            iconSelectedForegroundColor: Colors.white,
          ),
          scaleFactor: 1.5,
          defaultIndex: 0,
        ),

        appBar: AppBar(
          leading: null,
            actions: [
              Builder(builder: (context) => IconButton(onPressed: (){
                Scaffold.of(context).openDrawer();
              }, icon: Icon(Icons.segment_rounded, color: Colors.white,size: 30,)))
            ],
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
                    child: IconButton(onPressed: (){

                    },
                        icon: Icon(Icons.arrow_back, size: 30),
      ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              Row(
                children: [
                  Text(
                    "Timer",
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
drawer: CustomDrawer(),
        body: Column(
          children: [

            Container(
              margin: EdgeInsets.all(20),
              padding: EdgeInsets.all(20),
              width: double.infinity,
              height: 120,
              decoration: BoxDecoration(
                color: Color(0xFF0F172A),
                borderRadius: BorderRadius.circular(15),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [

                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        formatTime(seconds),
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 26,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 10),

                      GestureDetector(
                        onTap: resetTimer,
                        child: Container(
                          padding: EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Text("Reset"),
                        ),
                      ),
                    ],
                  ),

                  GestureDetector(
                    onTap: () {
                      if (isRunning) {
                        pauseTimer();
                      } else {
                        startTimer();
                      }
                    },
                    child: Container(
                      width: 60,
                      height: 60,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.white),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Icon(
                        isRunning ? Icons.pause : Icons.play_arrow,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(height: 60),

            Container(
              width: 180,
              height: 180,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: Colors.black, width: 5),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [

                  Text(
                    formatTime(seconds),
                    style: TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF0F172A),
                    ),
                  ),

                  SizedBox(height: 30),

                  GestureDetector(
                    onTap: () {
                      if (isRunning) {
                        pauseTimer();
                      } else {
                        startTimer();
                      }
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Color(0xFF0F172A),
                      ),
                      padding: EdgeInsets.all(5),
                      child: Icon(
                        isRunning ? Icons.pause : Icons.play_arrow,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(height: 130),

            Container(
              margin: EdgeInsets.only(left: 350),
              width: 45,
              height: 120,
              decoration: BoxDecoration(
                color: Color(0xFF0F172A),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [

                  GestureDetector(
                    onTap: addTime,
                    child: Icon(Icons.add, color: Colors.white),
                  ),

                  Icon(Icons.hourglass_bottom, color: Colors.white, size: 18),

                  GestureDetector(
                    onTap: minusTime,
                    child: Icon(Icons.remove, color: Colors.white),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}