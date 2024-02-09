import 'package:flutter/material.dart';
import 'package:rental/components/horizontal_line.dart';
import 'package:rental/components/reusable_textfield.dart';
import 'package:rental/utils/constants.dart';
import 'package:rental/widgets/custom_button.dart';

class ForgotPassword extends StatelessWidget {
  const ForgotPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.1,
              ),
              const Text(
                'FORGOT PASSWORD',
                style: kh1,
              ),
              const SizedBox(height: 8),
              const Text(
                'Please Enter Your Email Address or Phone Number to Reset Your Password',
                style: TextStyle(color: Colors.black87),
              ),
              horizontalLine(),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.1,
              ),
              const Text(
                'Email or Phone',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 10,
              ),
              reusableTextField(hint: 'Email,Address or Phone Number'),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.05,
              ),
             CustomButton(
               title: 'Send Now',
               callback: (){
                 Navigator.pushNamed(context,'OtpScreen');
               },
             ),
              const SizedBox(
                height: 20,
              ),
              const Center(child: Text('Cancel',style: TextStyle(color:Colors.grey,fontWeight: FontWeight.bold ),))
            ],
          ),
        ),
      ),
    ));
  }
}
