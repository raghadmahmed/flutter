import 'package:final_app/Model/Profile_Provider.dart';
import 'package:final_app/Model/Provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:final_app/Screens/Login_page.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => AppProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => Profile_Provider(),
        ),
      ],
      child: MyApp(),
    ),
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