import 'package:flutter/material.dart';


class addSubject extends StatefulWidget {
  @override
  State<addSubject> createState() => _addSubjectState();
}

class _addSubjectState extends State<addSubject> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Column(
          children: [
            Container(
              color: Color(0xFF0F172A),
              padding: EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    padding: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10)
                    ),
                    child: Icon(Icons.arrow_back_ios_new_sharp,color: Color(0xFF0F172A),),
                  ),
                  Icon(Icons.menu_rounded,color: Colors.white,)
                ],
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: Container(
                    padding: EdgeInsets.all(10),
                    height: 100,
                    color: Color(0xFF0F172A),
                    child: Text("Add Subject",style: TextStyle(fontSize: 40,color: Colors.white,fontFamily: "Inknut Antiqua"),),
                  ),
                ),
              ],
            ),
            Column(
              children: [
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: Text("Subject Name",style: TextStyle(color:Color(0xFF0F172A),fontFamily: "Inknut Antiqua",fontSize:20 ),),
                    )
                  ],
                ),
                Container(
                  height: 40,
                  width: 420,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius:BorderRadius.circular(20)
                  ),
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: Text("Upload materials",style: TextStyle(color:Color(0xFF0F172A),fontFamily: "Inknut Antiqua",fontSize:20 ),),
                    )
                  ],
                ),
                Container(
                  height: 100,
                  width: 420,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius:BorderRadius.circular(20)
                  ),
                ),
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 8),
                          child: Text("Colors",style: TextStyle(color: Color(0xFF0F172A),fontFamily: "Inknut Antiqua"),),
                        ),
                      ],
                    ),
                    Row(
                      spacing: 8,
                      children: [
                        Padding(
                          padding: EdgeInsetsGeometry.directional(start:15),
                          child: Container(
                            height:20,
                            width: 20,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Color(0x3A4E64),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsGeometry.directional(start:15),
                          child: Container(
                            height:20,
                            width: 20,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Color(0x5C4033),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsGeometry.directional(start:15),
                          child: Container(
                            height:20,
                            width: 20,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Color(0xB5B8C5),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsGeometry.directional(start:15),
                          child: Container(
                            height:20,
                            width: 20,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Color(0x8B1A1A),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsGeometry.directional(start:15),
                          child: Container(
                            height:20,
                            width: 20,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Color(0xCBD5F5),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 13,vertical: 8),
                          child: Text("← Make your color",style: TextStyle(fontFamily: "Inknut Antiqua"),),
                        )
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 15,vertical: 10),
                          decoration: BoxDecoration(color: Color(0x0F172A),
                              borderRadius: BorderRadius.circular(15)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text("Add",style: TextStyle(color: Colors.white,fontFamily: "Inknut Antiqua",fontSize: 20),)
                            ],
                          ),
                        ),
                      ],
                    )
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}