import 'package:depi_final_project/core/app_images/app_images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/app_color/app_color.dart';
import '../../../core/widgets/custom_button.dart';
import '../../../core/widgets/custom_field.dart';
import '../../../core/widgets/header_auth.dart';
import '../../auth_cubit/auth_cubit.dart';
import '../../auth_cubit/auth_state.dart';
import '../login_screen/login_screen.dart';

class ForgetPasswordScreen extends StatelessWidget {
  const ForgetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthCubit(),
      child: Scaffold(
        backgroundColor: AppColor.background,
        appBar: AppBar(backgroundColor: AppColor.background),
        body: BlocConsumer<AuthCubit, AuthState>(
          listener: (context, state) {
            if (state is ForgetPasswordSuccess) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  backgroundColor: Colors.green,
                  content: Text('Password reset link sent successfully! Check your email.'),
                ),
              );
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                  builder: (_) => BlocProvider.value(
                    value: BlocProvider.of<AuthCubit>(context),
                    child: const LoginScreen(),
                  ),
                ),
              );
            }
            if (state is ForgetPasswordFailure) {
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
            final loadingState = state is ForgetPasswordLoading;

            return Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                spacing: 15,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  HeaderAuth(
                    image: AppImages.forgetPass,
                    title: 'Forgot password?',
                    subTitle: 'Enter the email linked to your account and we will send you a reset link.',
                  ),

                  CustomField(
                    controller: cubit.emailForgetController,
                    hintText: 'Email',
                    icon: Icons.email_outlined,
                  ),

                  CustomButton(
                    text: loadingState ? 'Sending...' : 'Send Reset Link',
                    onPressed: () {
                      cubit.forgetPassword();
                    },
                  ),

                  const Spacer(),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Remembered it?',
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
                            MaterialPageRoute(builder: (context) => const LoginScreen()),
                          );
                        },
                        child: Text(
                          'Back to Login',
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
            );
          },
        ),
      ),
    );
  }
}