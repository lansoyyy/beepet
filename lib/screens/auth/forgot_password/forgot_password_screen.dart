import 'package:beepet/screens/auth/forgot_password/forgot_password_screen_2.dart';
import 'package:beepet/utils/colors.dart';
import 'package:beepet/widgets/text_widget.dart';
import 'package:flutter/material.dart';

import '../../../widgets/button_widget.dart';
import '../../../widgets/textfield_widget.dart';

class ForgotPasswordScreen extends StatelessWidget {
  final numberController = TextEditingController();

  ForgotPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/images/back1.png'), fit: BoxFit.cover),
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                width: double.infinity,
                height: 180,
                color: primary,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Image.asset('assets/images/logo.png', height: 150),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            TextBold(
                                text: 'Online',
                                fontSize: 24,
                                color: Colors.blue),
                            TextBold(
                                text: 'PetLoc',
                                fontSize: 28,
                                color: Colors.green),
                          ],
                        )
                      ],
                    ),
                    TextBold(
                        text: 'Online Vets loved by Pets',
                        fontSize: 14,
                        color: Colors.black),
                  ],
                ),
              ),
              const SizedBox(
                height: 80,
              ),
              TextBold(
                  text: 'Forgot Password', fontSize: 24, color: Colors.black),
              const SizedBox(
                height: 50,
              ),
              Center(
                  child: TextFieldWidget(
                      labelColor: Colors.black,
                      label: 'Enter Contact Number',
                      controller: numberController)),
              const SizedBox(
                height: 30,
              ),
              Center(
                  child: ButtonWidget(
                      radius: 100,
                      color: Colors.teal[600]!.withOpacity(0.5),
                      label: 'Forgot Password',
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => ForgotPasswordScreen2()));
                      })),
            ],
          ),
        ),
      ),
    );
  }
}
