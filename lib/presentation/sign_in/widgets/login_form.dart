import 'package:demo_app/constants/colors.dart';
import 'package:demo_app/presentation/sign_in/screens/forget_password.dart';
import 'package:demo_app/presentation/sign_in/screens/sign_up_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

import '../../naviagation/screens/navigation_menu.dart';
import '../manager/auth_bloc.dart';

class LoginForm extends StatefulWidget {
  LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _emailController = TextEditingController();

  final _passwordController = TextEditingController();
  bool isChecked=false;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is AuthSuccess) {
          Get.offAll(() => NavigationMenu());
        } else if (state is AuthFailure) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(state.error)));
        }
      },
      builder: (context, state) {
        if (state is AuthLoading) {
          return const Center(child: CircularProgressIndicator());
        }

        return Form(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 16),
            child: Column(
              children: [
                TextFormField(
                  controller: _emailController,
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.email),
                    labelText: 'E-mail',
                  ),
                ),
                const SizedBox(height: 20),
                TextFormField(
                  controller: _passwordController,
                  obscureText: true,
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.lock),
                    labelText: 'Password',
                    suffixIcon: Icon(Icons.visibility_off),

                  ),
                ),
                const SizedBox(height: 12),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Checkbox(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(4),
                          ),
                          activeColor: Colors.white,
                          checkColor: EColors.primary,
                          side: WidgetStateBorderSide.resolveWith(
                                (states) => const BorderSide(color: Colors.black,width: 1.5),
                          ),
                          value: isChecked,
                          onChanged: (value) {
                            setState(() {
                              isChecked = !isChecked;
                            });
                          },
                        ),
                        const Text('Remember Me'),
                      ],
                    ),
                    TextButton(
                      onPressed: () {
                        Get.to(()=>ForgetPassword());
                      },
                      child: const Text('Forget Password',style: TextStyle(color: EColors.primary,fontWeight: FontWeight.w400),),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: EColors.primary,
                  ),
                  width: double.infinity,
                  child: TextButton(
                    onPressed: () {
                      final email = _emailController.text.trim();
                      final password = _passwordController.text.trim();

                      context.read<AuthBloc>().add(
                        LoginRequested(email, password),
                      );
                    },
                    child: const Text('Sign in',style: TextStyle(color: Colors.white,fontWeight: FontWeight.w700),),
                  ),
                ),
                const SizedBox(height: 16),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: EColors.primary,
                  ),
                  width: double.infinity,
                  child: TextButton(
                    onPressed: (){
                      Get.to(()=>SignupScreen());
                    },
                    child: const Text('Create Account',style: TextStyle(color: Colors.white,fontWeight: FontWeight.w700),),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
