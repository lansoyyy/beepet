import 'package:beepet/screens/auth/forgot_password/forgot_password_screen.dart';
import 'package:beepet/screens/auth/signup_screen.dart';
import 'package:beepet/screens/home_screen.dart';
import 'package:beepet/utils/colors.dart';
import 'package:beepet/widgets/button_widget.dart';
import 'package:beepet/widgets/text_widget.dart';
import 'package:beepet/widgets/textfield_widget.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';

import '../../widgets/toast_widget.dart';

class LoginScreen extends StatelessWidget {
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  LoginScreen({super.key});

  final box = GetStorage();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/images/back.png'), fit: BoxFit.cover),
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 180,
                ),
                TextBold(
                    text: 'Welcome to\n BeePet!',
                    fontSize: 36,
                    color: Colors.grey),
                const SizedBox(
                  height: 30,
                ),
                Center(
                    child: TextFieldWidget(
                        label: 'Username', controller: usernameController)),
                const SizedBox(
                  height: 20,
                ),
                Center(
                    child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    TextFieldWidget(
                        label: 'Password', controller: passwordController),
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => ForgotPasswordScreen()));
                      },
                      child: TextBold(
                          text: 'Forgot Password?',
                          fontSize: 12,
                          color: Colors.grey),
                    ),
                  ],
                )),
                const SizedBox(
                  height: 30,
                ),
                Center(
                    child: ButtonWidget(
                        radius: 100,
                        color: solid,
                        label: 'Login',
                        onPressed: () {
                          if (usernameController.text == box.read('username') &&
                              passwordController.text == box.read('password')) {
                            showToast('Logged in succesfully!');
                            Navigator.of(context).pushReplacement(
                                MaterialPageRoute(
                                    builder: (context) => const HomeScreen()));
                          } else {
                            showToast('Invalid account! Please try again');
                          }
                        })),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(
                      width: 125,
                      child: Divider(
                        color: Colors.grey,
                        thickness: 1,
                      ),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    TextBold(text: 'or', fontSize: 14, color: Colors.grey),
                    const SizedBox(
                      width: 20,
                    ),
                    const SizedBox(
                      width: 125,
                      child: Divider(
                        color: Colors.grey,
                        thickness: 1,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Center(
                    child: ButtonWidget(
                        radius: 100,
                        color: secondarySolid.withOpacity(0.5),
                        label: 'Signup',
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => SignupScreen()));
                        })),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
