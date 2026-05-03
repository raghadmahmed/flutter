import 'package:flutter/material.dart';
class ForgetpasswordScreen extends StatelessWidget {
  const ForgetpasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return
    Scaffold(
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
            Spacer(),
            Text(
              "Forget Your Password",
              style: TextStyle(
                color: Colors.white,
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
