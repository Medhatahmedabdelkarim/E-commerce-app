
import 'package:demo_app/presentation/sign_in/screens/reset_password.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../constants/colors.dart';

class ForgetPassword extends StatelessWidget {
  const ForgetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding:EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Forget password',style: Theme.of(context).textTheme.headlineMedium,),
            SizedBox(height: 12,),
            Text('passwords are tricky we know ',style: TextStyle(color: EColors.primary,fontWeight: FontWeight.w700),),
            SizedBox(height: 32,),
            TextFormField(
              decoration: InputDecoration(
                  labelText: 'E-mail',
                  prefixIcon: Icon(Icons.email)
              ),
            ),
            SizedBox(height: 12,),

            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: EColors.primary,
              ),
              width: double.infinity,
              child: TextButton(
                onPressed: (){
                  Get.to(()=>ResetPassword());
                },
                child: const Text('Submit',style: TextStyle(color: Colors.white,fontWeight: FontWeight.w700),),
              ),
            ),
          ],
        ),
      ),
    );
  }
}