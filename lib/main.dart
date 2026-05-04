import 'package:final_app/Model/Provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:final_app/Screens/Login_page.dart';
import 'package:provider/provider.dart';
import 'package:final_app/Model/Provider.dart';

void main(){
  runApp(
    ChangeNotifierProvider(
      create: (_) => AppProvider(),
      child: MyApp(),
    )
  );
}
 class MyApp extends StatelessWidget {
   @override
   Widget build(BuildContext context) {
     return MaterialApp(
       debugShowCheckedModeBanner: false,

       home: LoginScreen(),
     );
   }
 }
