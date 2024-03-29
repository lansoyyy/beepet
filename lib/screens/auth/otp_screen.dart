import 'package:beepet/screens/auth/verified_screen.dart';
import 'package:beepet/widgets/button_widget.dart';
import 'package:beepet/widgets/text_widget.dart';
import 'package:beepet/widgets/textfield_widget.dart';
import 'package:beepet/widgets/toast_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class OTPScreen extends StatelessWidget {
  final otpController = TextEditingController();

  String num;
  String verId;

  OTPScreen({super.key, required this.num, required this.verId});

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
                height: 50,
              ),
              Center(
                child: TextBold(
                    text: 'An OTP has been sent\n      to your number',
                    fontSize: 18,
                    color: Colors.grey),
              ),
              const SizedBox(
                height: 30,
              ),
              Center(
                  child: TextFieldWidget(
                      label: 'Enter OTP', controller: otpController)),
              const SizedBox(
                height: 30,
              ),
              Center(
                  child: ButtonWidget(
                      radius: 100,
                      color: Colors.teal[600]!.withOpacity(0.5),
                      label: 'Continue',
                      onPressed: () async {
                        PhoneAuthCredential credential =
                            PhoneAuthProvider.credential(
                                verificationId: verId,
                                smsCode: otpController.text);
                        try {
                          await FirebaseAuth.instance
                              .signInWithCredential(credential);

                          Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                  builder: (context) => VerifiedScreen()));
                        } catch (e) {
                          print(e.toString());
                          showToast('Invalied OTP Code');
                        }
                      })),
            ],
          ),
        ),
      ),
    );
  }
}
