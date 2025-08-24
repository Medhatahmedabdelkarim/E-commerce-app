
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:lottie/lottie.dart';

import '../../../constants/colors.dart';
import 'login_screen.dart';

class ResetPassword extends StatelessWidget {
  const ResetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(padding: EdgeInsets.all(12),
          child: Column(
            children: [
              Lottie.asset("assets/Images/Secure Login.json"),
              SizedBox(height: 16,),
              Text('Password Reset Email Sent',style: Theme.of(context).textTheme.headlineMedium,textAlign: TextAlign.center,),
              SizedBox(height: 12,),
              Text('we always provide second chances ',
                style: Theme.of(context).textTheme.labelLarge,textAlign: TextAlign.center,),
              SizedBox(height: 16,),

              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: EColors.primary,
                ),
                width: double.infinity,
                child: TextButton(
                  onPressed: (){
                    Get.to(()=>LoginScreen());
                  },
                  child: const Text('Done',style: TextStyle(color: Colors.white,fontWeight: FontWeight.w700),),
                ),
              ),               SizedBox(height: 12,),
              SizedBox(width: double.infinity,child: TextButton(onPressed: (){}, child: Text('Resend Email',style: TextStyle(color: Colors.black,fontWeight: FontWeight.w600),)),),
            ],
          ),
        ),
      ),
    );
  }
}