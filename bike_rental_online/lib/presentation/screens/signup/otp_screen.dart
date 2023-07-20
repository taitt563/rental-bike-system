import 'dart:developer';

import 'package:bike_rental_online/presentation/controllers/otp_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class OTPScreen extends StatefulWidget {
  OTPScreen({super.key});

  @override
  State<OTPScreen> createState() => _OTPScreenState();
}

class _OTPScreenState extends State<OTPScreen> {
  var otp;
  final TextEditingController _otpText = TextEditingController();
  final OTPController otpController = Get.find<OTPController>();
  String phoneNumber = Get.arguments as String;
  @override
  void initState() {
    super.initState();
    otpController
        .startResendTimer(); // Start the resend timer when the OTP screen is initialized
  }

  @override
  void dispose() {
    otpController
        .stopResendTimer(); // Stop the resend timer when the OTP screen is disposed
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final OTPController _otpController = Get.put(OTPController());

    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          physics: NeverScrollableScrollPhysics(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'CO\nDE',
                style: GoogleFonts.montserrat(
                  fontSize: 80,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 16.0),
              Text(
                'Verification'.toUpperCase(),
                style: Theme.of(context).textTheme.headline6!.copyWith(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
              ),
              SizedBox(height: 40.0),
              Text(
                'Enter the verification code sent at $phoneNumber',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyText1!.copyWith(
                      color: Colors.black.withOpacity(0.6),
                    ),
              ),
              SizedBox(height: 20.0),
              OtpTextField(
                numberOfFields: 6,
                fillColor: Colors.black.withOpacity(0.1),
                filled: true,
                keyboardType: TextInputType.number,
                onSubmit: (code) {
                  log(code);

                  otp = code;
                  _otpController.verifyOTP(otp);
                },
              ),
              SizedBox(height: 20.0),
              SizedBox(
                width: 285,
                child: ElevatedButton(
                  onPressed: () {
                    _otpController.verifyOTP(otp);
                  },
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4.0),
                    ),
                    elevation: 2.0,
                    primary: Color(0xFFFF7643),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Text(
                      'Tiếp tục',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
              Column(
                children: [
                  // Các widget khác...
                  Obx(
                    () {
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Resend Code in ',
                            style: TextStyle(
                              color: Colors.black.withOpacity(0.6),
                            ),
                          ),
                          Text(
                            '${_otpController.countdown.value} seconds',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                  SizedBox(height: 16.0),
                  Obx(
                    () => SizedBox(
                      width: 285,
                      child: ElevatedButton(
                        onPressed: _otpController.canResend.value
                            ? () => _otpController.resendOTP(phoneNumber)
                            : null,
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(4.0),
                          ),
                          elevation: 2.0,
                          primary: Color(0xFFFF7643),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Text(
                            'Gữi lại mã',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
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
