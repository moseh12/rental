import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rental/components/reusable_textfield.dart';
import 'package:rental/components/social_media_button.dart';
import 'package:rental/utils/colorscheme.dart';

import 'package:rental/widgets/custom_button.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SignIn extends StatelessWidget {
  const SignIn({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Color(0xfff3f3f4),
      statusBarIconBrightness: Brightness.dark,
      systemNavigationBarIconBrightness: Brightness.dark,
    ));

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          leading: Container(), systemOverlayStyle: SystemUiOverlayStyle.dark,
        ),
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
            child: Container(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
/*....................................Log Back into your Account.....................*/
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.03,
              ),
              const Text(
                'SIGN IN',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              const SizedBox(
                height: 5,
              ),
              const Text('Log Back Into Your Account'),
              Container(
                height: 5,
                width: 70,
                margin: const EdgeInsets.only(top: 10.0),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: primaryColor),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.07,
              ),
              const Text(
                'Email',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 5,
              ),
              reusableTextField(hint: 'Enter Email Address'),
              const SizedBox(
                height: 20,
              ),
              const Text(
                'Password',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 5,
              ),
              reusableTextField(hint: 'Enter Password'),
              const SizedBox(
                height: 25,
              ),
              Center(
                child: GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, 'ForgotPassword');
                  },
                  child: const Text(
                    'Forgot Password?',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.04,
              ),
              /* ..........................Sign In Now Button....................*/
              CustomButton(
                callback: () async {
                  Navigator.pushNamed(context, 'Dashboard');
                  SharedPreferences prefs =
                      await SharedPreferences.getInstance();
                  prefs.setBool("isLoggedIn", true);
                },
                title: 'Sign In Now',
              ),
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.03,
              ),
              const Center(
                child: Text(
                  'or Continue With',
                  style: TextStyle(color: Colors.grey),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              /*  ..........................Row of Two Containers.........................*/
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  socialMediaButton(
                      img: 'assets/icons/google.png',
                      callback: () {},
                      text: 'Google',
                      color: Colors.grey.shade200),
                  socialMediaButton(
                      img: 'assets/icons/fb.png',
                      callback: () {},
                      text: 'Facebook',
                      color: Colors.grey.shade200),
                ],
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.05),

              /*........................Row of Dont have an account text..................*/
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Don\'t have an Account? ',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, 'SignUp');
                      },
                      child: const Text(
                        'Sign Up',
                        style: TextStyle(
                            color: primaryColor,
                            fontWeight: FontWeight.bold,
                            decoration: TextDecoration.underline),
                      ))
                ],
              )
            ],
          ),
        )),
      ),
    );
  }
}
