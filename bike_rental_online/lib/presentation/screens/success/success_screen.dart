import 'package:bike_rental_online/presentation/routes/app_routes.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SuccessScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(height: 16.0),
              Image.asset(
                "assets/images/icons8-ok-512.png",
                width: 200.0,
                height: 200.0,
              ),
              SizedBox(height: 16.0),
              Text(
                "Pay Success",
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 16.0),
              ElevatedButton(
                child: Text("Back to Home"),
                onPressed: () {
                  Get.offAllNamed(AppRoutes.Dashboard);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
