import 'package:autobazzaar/components/navigation.dart';
import 'package:autobazzaar/core/theme/colors.dart';
// import 'package:autobazzaar/presentation/screens/Home/home_main.dart';
import 'package:autobazzaar/presentation/screens/login/singup_main.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SizedBox(
         width:double.infinity,
        height: double.infinity,
        child: Stack(
          children: [
            /// **Background Circles**
            Positioned(
              // width: double.infinity,
              top: -250,
              left: -50,
              child: CircleAvatar(
                radius: 250,
                backgroundColor: red,
              ),
            ),
            Positioned(
              top: -100,
              right: -120,
              child: CircleAvatar(
                radius: 150,
                backgroundColor: Colors.brown.shade100.withOpacity(0.5),
              ),
            ),
        
            /// **Main Content**
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height: 80),
        
                  /// **Login Title**
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Login Account",
                            style: GoogleFonts.poppins(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            "Welcome back Auto Bazaar !",
                            style: GoogleFonts.poppins(
                              fontSize: 14,
                              color: Colors.black54,
                            ),
                          ),
                        ],
                      ),
                      const Icon(Icons.person_outline, size: 28),
                    ],
                  ),
                  const SizedBox(height: 40),
        
                  /// **MiniShop Title**
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: "Auto",
                          style: GoogleFonts.poppins(
                            fontSize: 36,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                        TextSpan(
                          text: "Bazaar",
                          style: GoogleFonts.poppins(
                            fontSize: 36,
                            fontWeight: FontWeight.bold,
                            color: Colors.brown,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 100),
        
                  /// **Email Field**
                  CustomTextField(hintText: "Enter email i’d"),
                  const SizedBox(height: 15),
        
                  /// **Password Field**
                  CustomTextField(hintText: "Enter password", isPassword: true),
                  const SizedBox(height: 10),
        
                  /// **Forgot Password**
                  Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      "Forget Password ?",
                      style: GoogleFonts.poppins(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
        
                  /// **Login Button**
                  GestureDetector(
                    onTap: () {
                      print("Login Clicked");
                    },
                    child: Container(
                      width: double.infinity,
                      padding: const EdgeInsets.symmetric(vertical: 15),
                      decoration: BoxDecoration(
                        color: maroon,
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Center(
                        child: Text(
                          "Login",
                          style: GoogleFonts.poppins(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
        
                  /// **Or Sign Up With Divider**
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(child: Divider(thickness: 1, color: Colors.black26)),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Text(
                          "Or sign up with",
                          style: GoogleFonts.poppins(color: Colors.black54),
                        ),
                      ),
                      Expanded(child: Divider(thickness: 1, color: Colors.black26)),
                    ],
                  ),
                  const SizedBox(height: 20),
        
                  /// **Social Media Buttons**
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SocialIcon("assets/images/login/google.png"),
                      const SizedBox(width: 20),
                      // SocialIcon("assets/facebook.png"),
                      // const SizedBox(width: 20),
                      SocialIcon("assets/images/login/apple.png"),
                    ],
                  ),
                  const SizedBox(height: 40),
        
                  /// **Create Account Link**
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Not register yet ? ",
                        style: GoogleFonts.poppins(fontSize: 14),
                      ),
                      GestureDetector(
                        onTap: () {
                          print("Create Account Clicked");
                               Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => RegisterForm(),
                            ),
                          );
                        },
                        child: Text(
                          "Create Account",
                          style: GoogleFonts.poppins(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                      TextButton(onPressed: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) =>  Navigation(),));
                    }, child: Text("Go To Home", style: TextStyle(fontSize: 13, color: red),))
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// **Reusable TextField Widget**
class CustomTextField extends StatelessWidget {
  final String hintText;
  final bool isPassword;

  const CustomTextField({required this.hintText, this.isPassword = false});

  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: isPassword,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: GoogleFonts.poppins(color: Colors.black54),
        contentPadding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: Colors.black26),
        ),
      ),
    );
  }
}

/// **Reusable Social Icon Button**
class SocialIcon extends StatelessWidget {
  final String iconPath;

  const SocialIcon(this.iconPath);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 45,
      height: 45,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: Colors.black26),
      ),
      child: Center(
        child: Image.asset(iconPath, width: 25),
      ),
    );
  }
}
