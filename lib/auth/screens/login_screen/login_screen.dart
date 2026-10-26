import 'package:depi_final_project/core/app_images/app_images.dart';
import 'package:depi_final_project/core/widgets/custom_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../core/app_color/app_color.dart';
import '../../../core/widgets/custom_button.dart';
import '../../../core/widgets/header_auth.dart';
import '../../../core/widgets/password_field.dart';
import '../../../ui/home_screen/home_navigator.dart';
import '../../auth_cubit/auth_cubit.dart';
import '../../auth_cubit/auth_state.dart';
import '../forget_password_screen/forget_password_screen.dart';
import '../signup_screen/signup_screen.dart';
import '../verify_screen/verify_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool rememberMe = false;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthCubit(),
      child: Scaffold(
        backgroundColor: AppColor.background,
        appBar: AppBar(backgroundColor: AppColor.background),
        body: BlocConsumer<AuthCubit, AuthState>(
          listener: (context, state) {
            if (state is LogInSuccess) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  backgroundColor: Colors.green,
                  content: Text('LogIn Success'),
                ),
              );
            }
            if (state is LogInFailure) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  backgroundColor: Colors.red,
                  content: Text(state.msg),
                ),
              );
            }
            if (state is EmailNotVerified) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  backgroundColor: Colors.blue,
                  content: Text('Your Email Not Verified Yet'),
                ),
              );
              Duration(seconds: 3);
              Navigator.of(context).push(
                ////////////////////////////////////////////////////////
                MaterialPageRoute(builder: (_) => BlocProvider.value(
                  value: BlocProvider.of<AuthCubit>(context),
                  child: VerifyScreen(),
                )),
                ////////////////////////////////////////////////////////
              );
            }
          },
          builder: (context, state) {
            final cubit = BlocProvider.of<AuthCubit>(context);
            final loadingState = state is LogInLoading;

            return SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  spacing: 15,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    HeaderAuth(
                      image: AppImages.logo,
                      title: 'Welcome back',
                      subTitle: 'Your 14-day streak is waiting for you',
                    ),
              
                    CustomField(
                      controller: cubit.emailLogInController,
                      hintText: 'Email',
                      icon: Icons.email_outlined,
                    ),
              
                    PasswordField(
                      hintText: 'Password',
                      controller: cubit.passwordLogInController,
                    ),
              
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                SizedBox(
                                  width: 20,
                                  height: 20,
                                  child: Checkbox(
                                    value: rememberMe,
                                    onChanged: (value) =>
                                        setState(() => rememberMe = value!),
                                    fillColor: MaterialStateProperty.all(
                                      Colors.transparent,
                                    ),
                                    checkColor: AppColor.primary,
                                    side: const BorderSide(
                                      color: AppColor.primary,
                                      width: 3,
                                    ),
                                  ),
                                ),

                                const SizedBox(width: 8),

                                Text(
                                  'Remember me',
                                  style: GoogleFonts.bricolageGrotesque(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                    color: AppColor.primarytext,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),

                        GestureDetector(
                          onTap: () {
                            Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                builder: (context) => ForgetPasswordScreen(),
                              ),
                            );
                          },
                          child: Text(
                            'Forget password?',
                            style: GoogleFonts.bricolageGrotesque(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: AppColor.primary,
                            ),
                          ),
                        ),
                      ],
                    ),
              
                    CustomButton(
                      text: 'LogIn',
                      onPressed: () {
                        cubit.logIn();
                      },
                    ),
              
                    SizedBox(height: 5),
              
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'New to AI-lingo?',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: AppColor.gray1,
                          ),
                        ),

                        SizedBox(width: 5),

                        GestureDetector(
                          onTap: () {
                            Navigator.of(context).pushReplacement(
                              MaterialPageRoute(builder: (context) => SignupScreen()),
                            );
                          },
                          child: Text(
                            'Create account',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: AppColor.primary,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
