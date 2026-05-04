import 'package:flutter/material.dart';

class NewPasswordPage extends StatefulWidget {
  @override
  State<NewPasswordPage> createState() => _NewPasswordPageState();
}
class _NewPasswordPageState extends State<NewPasswordPage> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmController = TextEditingController();
  bool hidePassword=true;
  bool hideConfirm=true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF0F172A),
      appBar: AppBar(
        backgroundColor: Color(0xFF0F172A),
        elevation: 0,
        centerTitle: true,
        title: Text("Study"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.all(20),
            child: Text("New Password",style: TextStyle(color: Colors.white,fontSize: 32,fontWeight: FontWeight.bold)),
          ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius:
                BorderRadius.vertical(top: Radius.circular(20)),
              ),
              child: Padding(
                padding: EdgeInsets.all(40),
                child: Form(
                  key: _formKey,
                  child: ListView(
                    padding: EdgeInsets.all(0),
                    children: [
                      Text("Enter New Password",style: TextStyle(fontSize: 15),),
                      SizedBox(height: 20),
                      TextFormField(
                        controller: passwordController,
                        obscureText: hidePassword,
                        decoration: InputDecoration(
                          hintText: "Password",
                          filled: true,
                          fillColor: Colors.grey[200],
                          border: OutlineInputBorder(
                            borderRadius:
                            BorderRadius.circular(30),
                            borderSide: BorderSide.none,
                          ),
                          suffixIcon: IconButton(
                            icon: Icon(
                              hidePassword
                                  ? Icons.visibility_off
                                  : Icons.visibility,
                            ),
                            onPressed: () {
                              setState(() {
                                hidePassword = !hidePassword;
                              });
                            },
                          ),
                        ),
                        validator: (value) {
                          if(value == null || value.isEmpty) {
                            return "Enter password";
                          }
                          if(value.length < 6) {
                            return "Password must be at least 6 chars";
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 20),
                      TextFormField(
                        controller: confirmController,
                        obscureText: hideConfirm,                        decoration: InputDecoration(
                        hintText: "Confirm Password",
                        filled: true,
                        fillColor: Colors.grey[200],
                        border: OutlineInputBorder(
                          borderRadius:
                          BorderRadius.circular(30),
                          borderSide: BorderSide.none,
                        ),
                        suffixIcon: IconButton(
                          icon: Icon(
                            hideConfirm
                                ? Icons.visibility_off
                                : Icons.visibility,
                          ),
                          onPressed: () {
                            setState(() {
                              hideConfirm = !hideConfirm;
                            });
                          },
                        ),
                      ),
                        validator: (value) {
                          if(value == null || value.isEmpty) {
                            return "Confirm your password";
                          }
                          if(value != passwordController.text) {
                            return "Passwords do not match";
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 100,),
                      GestureDetector(
                        onTap: () {
                          if(_formKey.currentState!.validate()) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text("Password Updated✅"),
                              ),
                            );
                          }
                        },
                        child: Container(
                          width: double.infinity,
                          height: 55,
                          decoration: BoxDecoration(
                            color: Color(0xFF0F172A),
                            borderRadius:
                            BorderRadius.circular(30),
                          ),
                          child: Center(
                            child: Text("Send",style: TextStyle(color: Colors.white,fontSize: 20)),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}