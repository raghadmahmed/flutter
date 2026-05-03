import 'package:flutter/material.dart';
import 'package:final_app/Screens/Home_Screen.dart';
import 'package:final_app/Screens/Login_page.dart';


class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}
class _SignUpScreenState extends State<SignUpScreen> {
  final _formKey = GlobalKey<FormState>();

  bool _obscurePassword = true;
  bool _obscureConfirmPassword = true;

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFEDEDED),

      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: [

              Container(
                color: const Color(0xFF0F172A),
                padding: const EdgeInsets.symmetric(vertical: 70, horizontal: 30),
              ),

              Container(
                margin: const EdgeInsets.fromLTRB(30, 60, 0, 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextButton(
                      onPressed: () {
                        Navigator.push(context,
                          MaterialPageRoute(
                            builder: (context) =>
                                LoginScreen(),
                          ),);
                      },
                      child: const Text(
                        "Don't Have An Account",
                        style: TextStyle(
                          color: Color(0xFF1A2340),
                          fontSize: 13,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ),


                    _buildField(
                      controller: _nameController,
                      hint: "User Name",
                      icon: Icons.person_outline_rounded,
                    ),

                    _buildField(
                      controller: _emailController,
                      hint: "Email",
                      icon: Icons.email_outlined,
                    ),

                    _buildPasswordField(),

                    _buildConfirmPasswordField(),

                    const SizedBox(height: 28),

                    SizedBox(
                      width: double.infinity,
                      height: 52,
                      child: ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(builder: (context) => Myhome()),
                            );
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF1A2340),
                          foregroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                        ),
                        child: const Text('Sign Up'),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }


  Widget _buildField({
    required TextEditingController controller,
    required String hint,
    required IconData icon,
  }) {
    return Container(
      margin: const EdgeInsets.fromLTRB(0, 0, 30, 10),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: TextFormField(
        controller: controller,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return "$hint is required";
          }

          if (hint == "Email" && !value.contains("@")) {
            return "Invalid email";
          }

          return null;
        },
        decoration: InputDecoration(
          icon: Icon(icon, color: Colors.grey),
          hintText: hint,
          border: InputBorder.none,
        ),
      ),
    );
  }


  Widget _buildPasswordField() {
    return Container(
      margin: const EdgeInsets.fromLTRB(0, 0, 30, 10),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: TextFormField(
        controller: _passwordController,
        obscureText: _obscurePassword,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return "Password required";
          }
          if (value.length < 6) {
            return "Min 6 characters";
          }
          return null;
        },
        decoration: InputDecoration(
          icon: const Icon(Icons.lock, color: Colors.grey),
          hintText: "Password",
          border: InputBorder.none,
          suffixIcon: IconButton(
            icon: Icon(
              _obscurePassword ? Icons.visibility_off : Icons.visibility,
              color: Colors.grey,
            ),
            onPressed: () {
              setState(() {
                _obscurePassword = !_obscurePassword;
              });
            },
          ),
        ),
      ),
    );
  }


  Widget _buildConfirmPasswordField() {
    return Container(
      margin: const EdgeInsets.fromLTRB(0, 0, 30, 10),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: TextFormField(
        controller: _confirmPasswordController,
        obscureText: _obscureConfirmPassword,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return "Confirm your password";
          }
          if (value != _passwordController.text) {
            return "Passwords don't match";
          }
          return null;
        },
        decoration: InputDecoration(
          icon: const Icon(Icons.lock, color: Colors.grey),
          hintText: "Confirm Password",
          border: InputBorder.none,
          suffixIcon: IconButton(
            icon: Icon(
              _obscureConfirmPassword ? Icons.visibility_off : Icons.visibility,
              color: Colors.grey,
            ),
            onPressed: () {
              setState(() {
                _obscureConfirmPassword = !_obscureConfirmPassword;
              });
            },
          ),
        ),
      ),
    );
  }
}