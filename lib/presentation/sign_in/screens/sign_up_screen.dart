
import 'package:demo_app/presentation/sign_in/screens/success_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../constants/colors.dart';

class SignupScreen extends StatelessWidget {
  SignupScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final dark= Theme.of(context).brightness==Brightness.dark;
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(padding: EdgeInsets.all(12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Lets create your account',style: Theme.of(context).textTheme.headlineMedium,),
              SizedBox(height: 16,),

              Form(
                  child:Column(
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: TextFormField(
                              validator: (value){
                                if (value!.isEmpty){
                                  return 'please enter a valid username';

                                }
                              },
                              expands: false,
                              decoration: InputDecoration(
                                  labelText: 'First Name',
                                  prefixIcon: Icon(Icons.person)
                              ),
                            ),
                          ),
                          SizedBox(width: 12,),
                          Expanded(
                            child: TextFormField(
                              expands: false,
                              validator: (value){
                                if (value!.isEmpty){
                                  return 'please enter a valid username';

                                }
                              },
                              decoration: InputDecoration(
                                  labelText: 'Last Name',
                                  prefixIcon: Icon(Icons.person)
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 12,),
                      TextFormField(
                        validator: (value){
                          if (value!.isEmpty){
                            return 'please enter a valid username';

                          }
                        },
                        expands: false,
                        decoration: InputDecoration(
                            labelText: 'Username',
                            prefixIcon: Icon(Icons.verified_user)
                        ),
                      ),
                      SizedBox(height: 12,),
                      TextFormField(
                        validator: (value){
                          if (value!.isEmpty){
                            return 'please enter a valid username';

                          }
                        },
                        expands: false,
                        decoration: InputDecoration(
                            labelText: 'E-mail',
                            prefixIcon: Icon(Icons.email)
                        ),
                      ),
                      SizedBox(height:12,),
                            TextFormField(
                              validator: (value){
                                if (value!.isEmpty){
                                  return 'please enter a valid username';

                                }
                              },
                              expands: false,
                              obscureText: true,
                              decoration: InputDecoration(
                                labelText: 'Password',
                                prefixIcon: Icon(Icons.password_outlined),
                              ),
                            ),
                      SizedBox(height:12,),

                      Row(
                        children: [
                          SizedBox(width: 12,),
                          Text.rich(TextSpan(children: [
                            TextSpan(text: 'I agree to ',style:Theme.of(context).textTheme.bodySmall ),
                            TextSpan(text: 'Privacy Policy ',style:Theme.of(context).textTheme.bodyMedium!.apply(
                              decoration: TextDecoration.underline,
                            ) ),
                            TextSpan(text: 'and ',style:Theme.of(context).textTheme.bodySmall ),
                            TextSpan(text: 'Terms Of use ',style:Theme.of(context).textTheme.bodyMedium!.apply(
                              decoration: TextDecoration.underline,
                            ) ),


                          ]))

                        ],
                      ),
                      SizedBox(height:16,),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: EColors.primary,
                        ),
                        width: double.infinity,
                        child: TextButton(
                          onPressed: (){
                            Get.to(()=>SuccessScreen());
                          },
                          child: const Text('Create Account',style: TextStyle(color: Colors.white,fontWeight: FontWeight.w700),),
                        ),
                      ),                    ],
                  )
              ),
              SizedBox(height: 12,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Flexible(
                    child: Divider(
                      thickness: 0.5,
                      indent: 60,
                      endIndent: 5,
                    ),
                  ),
                  Text('Or Sign Up With',style: Theme.of(context).textTheme.labelMedium,),
                  Flexible(
                    child: Divider(
                      thickness: 0.5,
                      indent: 5,
                      endIndent: 60,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 12,),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width:40,
                    height:40,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        border: Border.all(color: Colors.grey)


                    ),
                    child:Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: InkWell(onTap: (){},child:Center(child:Image(image: AssetImage("assets/Images/googleIcon2.png"),fit: BoxFit.cover,)
                        ,)),
                    ),

                  ),
                  SizedBox(width: 12,),
                  Container(
                    width:40,
                    height:40,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        border: Border.all(color: Colors.grey)

                    ),
                    child:Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: InkWell(onTap: (){},child:Center(child:Image(image: AssetImage("assets/Images/facebookIcons.png"),fit: BoxFit.cover,)
                        ,)),
                    ),

                  ),
                ],
              )
            ],

          ),
        ),
      ),
    );

  }
}