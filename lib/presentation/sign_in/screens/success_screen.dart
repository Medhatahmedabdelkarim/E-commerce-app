
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:lottie/lottie.dart';

import '../../../constants/colors.dart';
import 'login_screen.dart';

class SuccessScreen extends StatelessWidget {
  const SuccessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
          child:Padding(padding: EdgeInsets.only(
            top: 12,
            left: 8,
            bottom: 8,
            right: 8,
          ),
            child:Column(
              children: [
                Lottie.asset("assets/Images/shopping cart.json"),
                Text('Your account has been created!',style: Theme.of(context).textTheme.headlineMedium,textAlign: TextAlign.center,),
                SizedBox(height: 12,),
                Text('Congratulations! Your account awaits. Verify your email address to start shopping and explore our unique collection of items ',
                  style: Theme.of(context).textTheme.labelLarge,textAlign: TextAlign.center,),
                SizedBox(height: 12,),

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
                    child: const Text('Continue',style: TextStyle(color: Colors.white,fontWeight: FontWeight.w700),),
                  ),
                ),                ],
            ) ,
          )
      ),
    );
  }
}