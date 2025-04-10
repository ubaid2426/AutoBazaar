import 'package:autobazzaar/core/theme/colors.dart';
import 'package:autobazzaar/presentation/screens/login/login_main.dart';
import 'package:autobazzaar/presentation/screens/login/singup_main.dart';
// import 'package:autobazzaar/presentation/screens/login/splash_screen.dart';
import 'package:autobazzaar/presentation/screens/login/splash_screen3.dart';
import 'package:autobazzaar/presentation/screens/login/welcome_screen.dart';
import 'package:flutter/material.dart';

class SplashScreen4 extends StatefulWidget {
  const SplashScreen4({super.key});

  @override
  _SplashScreen4State createState() => _SplashScreen4State();
}

class _SplashScreen4State extends State<SplashScreen4> {
  bool isSignupSelected = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
              "assets/images/login/splash2.png",
            ), // Your image path
            fit: BoxFit.cover, // Ensures the image covers the whole screen
          ),
        ),
        child: Stack(
          children: [
            /// Centered App Logo
            Positioned(
              top: 140,
              left: 0,
              right: 0,
              child: Center(
                child: Container(
                  width: 300, // Adjust size as needed
                  height: 150,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20), // Rounded corners
                    image: const DecorationImage(
                      image: AssetImage('assets/images/login/applogo.png'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ),

            /// Signup & Guest Button Row - Centered
            Positioned(
              top: 300, // Adjust vertical position as needed
              left: 0,
              right: 0,
              child: Center(
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    /// Signup Button
                    InkWell(
                      onTap: () {
                        // setState(() {
                        //   isSignupSelected = true;
                        // });
                        print("singup page press");
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => RegisterForm(),
                          ),
                        );
                      },
                      child: Container(
                        width: MediaQuery.of(context).size.width / 2 - 100,
                        padding: const EdgeInsets.symmetric(
                          vertical: 12,
                          horizontal: 30,
                        ),
                        decoration: BoxDecoration(
                          color: isSignupSelected ? maroon : Colors.grey[600],
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(30),
                            bottomLeft: Radius.circular(30),
                          ),
                        ),
                        child: const Text(
                          "Signup",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),

                    /// Guest Button
                    GestureDetector(
                      onTap: () {
                        // setState(() {
                        //   isSignupSelected = false;
                        // });
                          print("singin page press");
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => LoginScreen(),
                          ),
                        );
                      },
                      child: Container(
                        width: MediaQuery.of(context).size.width / 2 - 100,
                        padding: const EdgeInsets.symmetric(
                          vertical: 12,
                          horizontal: 30,
                        ),
                        decoration: BoxDecoration(
                          color: isSignupSelected ? silver : Colors.black54,
                          borderRadius: const BorderRadius.only(
                            topRight: Radius.circular(30),
                            bottomRight: Radius.circular(30),
                          ),
                        ),
                        child: const Text(
                          "Login",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            /// Car Image - Always at the Bottom
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Image.asset(
                'assets/images/login/image1.png',
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),

            /// Next Button - Bottom Right
            Positioned(
              bottom: 50,
              right: 20,
              child: GestureDetector(
                onTap: () {
                  // Navigate to Next Screen
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => WelcomeScreen()),
                  );
                },
                child: Container(
                  padding: const EdgeInsets.all(15),
                  decoration: BoxDecoration(
                    color: maroon,
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black26,
                        blurRadius: 4,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                  child: const Icon(
                    Icons.navigate_next,
                    size: 40,
                    color: Colors.black,
                  ),
                ),
              ),
            ),

            ///back button
            Positioned(
              bottom: 50,
              left: 20,
              child: GestureDetector(
                onTap: () {
                  // Navigate to Next Screen
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SplashScreen3()),
                  );
                },
                child: Container(
                  padding: const EdgeInsets.all(15),
                  decoration: BoxDecoration(
                    color: maroon,
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black26,
                        blurRadius: 4,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                  child: const Icon(
                    Icons.navigate_before,
                    size: 40,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
