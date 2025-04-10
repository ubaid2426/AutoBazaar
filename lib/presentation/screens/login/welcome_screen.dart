import 'package:autobazzaar/core/theme/colors.dart';
import 'package:autobazzaar/presentation/screens/login/login_main.dart';
import 'package:flutter/material.dart';

class WelcomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.bottomLeft,
            end: Alignment.topRight,
            colors: [maroon, black], // Black & Maroon
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 50),

              /// **Welcome Text**
              const Text(
                "Welcome to",
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.w400,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 5),

              /// **AutoBazaar with different colors**
              RichText(
                textAlign: TextAlign.center,
                text: const TextSpan(
                  // style: TextStyle(),
                  children: [
                    TextSpan(
                      text: "Auto",
                      style: TextStyle(
                        fontSize: 50,
                        fontWeight: FontWeight.bold,
                        color: maroon, // Different color for "Auto"
                      ),
                    ),
                    TextSpan(
                      text: "Bazaar",
                      style: TextStyle(
                        fontSize: 50,
                        fontWeight: FontWeight.bold,
                        color: silver, // Different color for "Bazaar"
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 5),

              /// **Subheading**
              const Text(
                "An Auto Marketplace and much more!",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 70),

              /// **Get Started Text**
              const Text(
                "Let's Get Started...",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 20),

              /// **Google Sign-In Button**
              SignInButton(
                text: "Continue with Google",
                icon:
                    "assets/images/login/google.png", // Replace with your Google icon asset
                onTap: () {
                  print("Google Sign In Clicked");
                },
              ),
              const SizedBox(height: 15),

              /// **Email Sign-In Button**
              SignInButton(
                text: "Continue with email",
                icon: "", // No icon needed for this
                onTap: () {
                  print("Email Sign In Clicked");
                },
              ),
              const SizedBox(height: 20),

              /// **Already have an account? Login**
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Already have an account? ",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: Colors.white,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      print("Login Clicked");
                       Navigator.push(context, MaterialPageRoute(builder: (context) => LoginScreen()));
                    },
                    child: const Text(
                      "Login",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        // color: Colors.brown,
                        decoration: TextDecoration.underline,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/// **Reusable Sign-In Button**
class SignInButton extends StatelessWidget {
  final String text;
  final String icon;
  final VoidCallback onTap;

  const SignInButton({
    required this.text,
    required this.icon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(vertical: 15),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black, width: 1),
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (icon.isNotEmpty)
              Padding(
                padding: const EdgeInsets.only(right: 8),
                child: Image.asset(icon, width: 20), // Google icon
              ),
            Text(text, style: const TextStyle(fontWeight: FontWeight.bold)),
          ],
        ),
      ),
    );
  }
}
