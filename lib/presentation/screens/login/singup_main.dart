import 'package:autobazzaar/components/navigation.dart';
import 'package:autobazzaar/core/theme/colors.dart';
import 'package:autobazzaar/components/buildTextField.dart';
import 'package:autobazzaar/core/constants/validators.dart';
import 'package:autobazzaar/core/constants/widgets.dart';
import 'package:autobazzaar/presentation/screens/Home/home_main.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

class RegisterForm extends StatefulWidget {
  const RegisterForm({Key? key}) : super(key: key);

  @override
  State<RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  bool obsecure = true;

  final _formKey = GlobalKey<FormState>();

  late final TextEditingController _firstNameController;
  late final TextEditingController _lastNameController;
  late final TextEditingController _emailController;
  late TextEditingController _phoneController;
  late final TextEditingController _passwordController;
  late final TextEditingController _confirmPasswordController;

  late final FocusNode _firstNameNode;
  late final FocusNode _lastNameNode;
  late final FocusNode _emailNode;
  late FocusNode _phoneNode;
  late final FocusNode _passwordNode;
  late final FocusNode _confirmPasswordNode;

  @override
  void initState() {
    super.initState();
    _firstNameController = TextEditingController();
    _lastNameController = TextEditingController();
    _emailController = TextEditingController();
    _phoneController = TextEditingController();
    _passwordController = TextEditingController();
    _confirmPasswordController = TextEditingController();

    _firstNameNode = FocusNode();
    _lastNameNode = FocusNode();
    _emailNode = FocusNode();
    _phoneNode = FocusNode();
    _passwordNode = FocusNode();
    _confirmPasswordNode = FocusNode();
  }

  @override
  void dispose() {
    _firstNameController.dispose();
    _lastNameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();

    _firstNameNode.dispose();
    _lastNameNode.dispose();
    _emailNode.dispose();
    _phoneNode.dispose();
    _passwordNode.dispose();
    _confirmPasswordNode.dispose();

    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(),
      backgroundColor: Colors.white,
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Stack(
          children: [
            Positioned(
              // width: double.infinity,
              top: -250,
              left: -50,
              child: CircleAvatar(radius: 250, backgroundColor: maroon),
            ),
            Positioned(
              top: -100,
              right: -120,
              child: CircleAvatar(
                radius: 150,
                backgroundColor: Colors.brown.shade100.withOpacity(0.5),
              ),
            ),
              Positioned(
              top: 110,
              left: 0,
              right: 0,
              child: Center(
                child: Container(
                  width: 300, // Adjust size as needed
                  height: 150,
                  decoration: BoxDecoration(
                    // color: const Color.fromARGB(25, 37, 36, 36),
                    borderRadius: BorderRadius.circular(20), // Rounded corners
                    image: const DecorationImage(
                      image: AssetImage('assets/images/login/applogo.png'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ),
            //  const SizedBox(height: 80),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 140),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    /// First & Last Name Fields
                    Row(
                      children: [
                        Expanded(
                          child: buildTextField(
                            label: 'First Name',
                            hint: 'Enter your First Name',
                            controller: _firstNameController,
                            focusNode: _firstNameNode,
                            keyboardType: TextInputType.name,
                            validator:
                                (value) => checkNullEmptyValidation(
                                  value,
                                  'first name',
                                ), maxline: 1,
                          ),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: buildTextField(
                            label: 'Last Name',
                            hint: 'Enter your Last Name',
                            controller: _lastNameController,
                            focusNode: _lastNameNode,
                            keyboardType: TextInputType.name,
                            validator:
                                (value) => checkNullEmptyValidation(
                                  value,
                                  'last name',
                                ), maxline: 1,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 15),

                    /// Email Field
                    buildTextField(
                      label: 'Email',
                      hint: 'Enter your Email',
                      controller: _emailController,
                      focusNode: _emailNode,
                      keyboardType: TextInputType.emailAddress,
                      validator:
                          (value) => validateEmail(
                            value,
                            EmailValidator.validate(_emailController.text),
                          ), maxline: 1,
                    ),
                    const SizedBox(height: 15),

                    /// Phone Number Field
                    IntlPhoneField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: BorderSide(),
                        ),
                        labelText: 'Phone Number',
                        // hint: 'Enter your Phone Number',
                      ),
                      controller: _phoneController,
                      focusNode: _phoneNode,
                      keyboardType: TextInputType.phone,
                      validator:
                          (value) =>
                              checkNullEmptyValidation(value, 'phone number'),
                      initialCountryCode: 'US', // Default country
                      onChanged: (phone) {
                        print(
                          phone.completeNumber,
                        ); // Get full number with country code
                      },
                    ),
                    const SizedBox(height: 15),

                    /// Password Field
                    buildTextField(
                      label: 'Password',
                      hint: 'Enter Your Password',
                      controller: _passwordController,
                      focusNode: _passwordNode,
                      keyboardType: TextInputType.visiblePassword,
                      validator:
                          (value) =>
                              validatePassword(value, _passwordController.text), maxline: 1,
                      obscureText: obsecure,
                      suffixIcon: IconButton(
                        icon: Icon(
                          Icons.remove_red_eye_outlined,
                          color: obsecure ? greyColor : blackColor,
                        ),
                        onPressed: () {
                          setState(() {
                            obsecure = !obsecure;
                          });
                        },
                      ),
                    ),
                    const SizedBox(height: 15),

                    /// Confirm Password Field
                    buildTextField(
                      label: 'Confirm Password',
                      hint: 'Enter Your Confirm Password',
                      controller: _confirmPasswordController,
                      focusNode: _confirmPasswordNode,
                      keyboardType: TextInputType.visiblePassword,
                      validator:
                          (value) => validateSamePassword(
                            value,
                            _passwordController.text,
                          ), maxline: 1,
                      obscureText: true,
                    ),
                    const SizedBox(height: 30),

                    /// Sign Up Button
                    roundedButton(
                      context: context,
                      bgColor: maroon,
                      text: 'Sign Up',
                      textColor: whiteColor,
                      onPressed: () async {
                        if (_formKey.currentState!.validate()) {
                          // Implement OTP verification here
                          print("Sign Up clicked");
                        }
                      },
                    ),

                    const SizedBox(height: 10),

                    /// Terms and Conditions
                    Text(
                      'By Signing up you agree to our Terms and Conditions, and Privacy Policy',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 13, color: greyColor),
                    ),
                    TextButton(onPressed: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => Navigation(),));
                    }, child: Text("Go To Home", style: TextStyle(fontSize: 13, color: red),))
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
