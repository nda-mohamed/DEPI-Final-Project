import 'package:depi_final_project/core/app_color/app_color.dart';
import 'package:depi_final_project/core/app_images/app_images.dart';
import 'package:depi_final_project/ui/home_screen/home_navigator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/widgets/custom_button.dart';
import '../../../core/widgets/custom_field.dart';
import '../../../core/widgets/header_auth.dart';
import '../../../core/widgets/password_field.dart';
import '../../auth_cubit/auth_cubit.dart';
import '../../auth_cubit/auth_state.dart';
import '../login_screen/login_screen.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthCubit(),
      child: Scaffold(
        backgroundColor: AppColor.background,
        appBar: AppBar(backgroundColor: AppColor.background),
        body: BlocConsumer<AuthCubit, AuthState>(
          listener: (context, state) {
            if (state is SignUpSuccess) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  backgroundColor: Colors.green,
                  content: Text('SignUp Success'),
                ),
              );
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                  builder: (_) => BlocProvider.value(
                    value: BlocProvider.of<AuthCubit>(context),
                    child:  LoginScreen(),
                  ),
                ),
              );
            }
            if (state is SignUpFailure) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  backgroundColor: Colors.red,
                  content: Text(state.msg),
                ),
              );
            }
          },
          builder: (context, state) {
            final cubit = BlocProvider.of<AuthCubit>(context);
            final loadingState = state is SignUpLoading;

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
                      title: 'Create acoount',
                      subTitle: 'Start your first conversation in under a minute',
                    ),

                    CustomField(
                      controller: cubit.nameSignUpController,
                      hintText: 'Full Name',
                      icon: Icons.person_outline_rounded,
                    ),

                    CustomField(
                      controller: cubit.emailSignUpController,
                      hintText: 'Email',
                      icon: Icons.email_outlined,
                    ),

                    PasswordField(
                      hintText: 'Password',
                      controller: cubit.passwordSignUpController,
                    ),

                    PasswordField(
                      hintText: 'Confirm Password',
                      controller: cubit.confirmPasswordLogInController,
                    ),

                    CustomButton(
                      text: 'SignUp',
                      isLoading: loadingState,
                      onPressed: () {
                        cubit.signUp();
                      },
                    ),

                    SizedBox(height: 5),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Already have an account?',
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
                              MaterialPageRoute(builder: (context) => LoginScreen()),
                            );
                          },
                          child: Text(
                            'Log in',
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
