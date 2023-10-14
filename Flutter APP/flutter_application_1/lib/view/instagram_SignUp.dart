// ignore: file_names
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/view/home.dart';
import 'package:flutter_application_1/view/instagram_SignIn.dart';
import 'package:flutter_svg/flutter_svg.dart';

class InstagramSignUp extends StatefulWidget {
  const InstagramSignUp({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _InstagramSignUpState createState() => _InstagramSignUpState();
}

class _InstagramSignUpState extends State<InstagramSignUp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Container(
          width: double.infinity,
          decoration: const BoxDecoration(
            color: Colors.white,
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                const Text(
                  'छिमेकी : तपाईंको सामाजिक मिडिया साथी',
                  style: TextStyle(
                    
                      fontFamily: 'Billabong',
                      color: Colors.black,
                      fontSize: 25),
                ),
                const SizedBox(
                  height: 30,
                ),
                Container(
                  height: 45,
                  decoration: BoxDecoration(
                      // border: Border(bottom: BorderSide(color: Colors.grey[700]))
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(10)),
                  child: const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: "Email Address or Phone number",
                        hintStyle: TextStyle(color: Colors.grey, fontSize: 15),
                        border: InputBorder.none,
                        // icon: Icon(Icons.email,color: Colors.grey,)
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 15),
                Container(
                  height: 55,
                  decoration: BoxDecoration(
                      // border: Border(bottom: BorderSide(color: Colors.grey[700]))
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(10)),
                  child: const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: TextField(
                      obscureText: true,
                      decoration: InputDecoration(
                        hintText: "Password",
                        hintStyle: TextStyle(color: Colors.grey, fontSize: 15),
                        border: InputBorder.none,
                        // icon: Icon(Icons.lock,color: Colors.grey,)
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Container(
                    height: 55,
                    width: double.infinity,

                    // margin: EdgeInsets.symmetric(horizontal: 50),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: const Color(0xFFa5caf3)),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Home()),
                        );
                      },
                      child: const Center(
                        child: Text(
                          "Sign Up",
                          style: TextStyle(
                              fontSize: 22,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    )),
                const SizedBox(height: 20),
                Text.rich(TextSpan(
                    text: "Forgot your META details ? ",
                    style: const TextStyle(
                      color: Colors.grey,
                      fontWeight: FontWeight.bold,
                      fontSize: 13,
                    ),
                    children: <InlineSpan>[
                      TextSpan(
                        text: 'Click here.',
                        style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF0b3d6f)),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            // Navigator.push(context,MaterialPageRoute(builder: (context) => TwitterSignIn()),);
                            // single tapped
                          },
                      ),
                    ])),
                const SizedBox(height: 20),
                Container(
                    height: 45,
                    width: 300,

                    // margin: EdgeInsets.symmetric(horizontal: 50),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: const Color(0xFF0480dc)),
                    child: GestureDetector(
                      onTap: () {
                        // Navigator.push(context,MaterialPageRoute(builder: (context) => FacebookSignUp()),);
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SvgPicture.asset(
                            "assets/images/icons-facebook.svg",
                            height: 25,
                            width: 25,
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          const Center(
                            child: Text(
                              "Continue with META",
                              style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                    )),
                const SizedBox(height: 20),
                Text.rich(TextSpan(
                    text: "Already have an account ? ",
                    style: const TextStyle(
                      color: Colors.grey,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                    children: <InlineSpan>[
                      TextSpan(
                        text: 'Sign In',
                        style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF0b3d6f)),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => InstagramSignIn()),
                            );
                            // single tapped
                          },
                      ),
                    ])),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
