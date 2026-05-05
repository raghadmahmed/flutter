import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Forgetpassword extends StatefulWidget {
  const Forgetpassword({super.key});

  @override
  State<Forgetpassword> createState() => _ForgetpasswordState();
}

class _ForgetpasswordState extends State<Forgetpassword> {
  GlobalKey<FormState> _myform=GlobalKey<FormState>();
  TextEditingController _emailcontroller=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Forget Password"),),
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.all(20),
            alignment: Alignment.center,
            child: Image.asset("assets/forget_password.iml",
              width:384,
              height:290,
              fit:BoxFit.cover,
            ),
          ),
          SizedBox(height: 20,),
          Padding(
            padding: const EdgeInsets.all(10),
            child: Form(
                key: _myform,
                child: TextFormField(
                  controller: _emailcontroller,
                  decoration:
                  InputDecoration(
                      labelText: "Email",
                      prefixIcon: Icon(Icons.email_rounded),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      )
                  ),
                  validator: (value){
                    if(value==null || value.isEmpty){
                      return "please enter your email";
                    } else if(value!="janamohamed@gmail"){
                      return "email is not valid";
                    }
                    return null;
                  },
                )
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: ElevatedButton(onPressed: (){},
                style: ElevatedButton.styleFrom(
                    backgroundColor:Color(0xF172A),
                    foregroundColor: Colors.white,
                    padding: EdgeInsets.symmetric(vertical: 8,horizontal: 15)
                )
                ,child: Text("Reset Password")),
          ),
          SizedBox(height: 8,),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 0,horizontal: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                TextButton(onPressed: (){}, child:Text("Back to login") ),
              ],
            ),
          )

        ],
      ),
    );
  }
}