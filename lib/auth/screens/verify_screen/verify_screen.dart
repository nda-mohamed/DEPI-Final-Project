import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/app_color/app_color.dart';
import '../../../core/app_images/app_images.dart';
import '../../../core/widgets/custom_button.dart';
import '../../../core/widgets/header_auth.dart';
import '../../../ui/home_screen/home_navigator.dart';
import '../../auth_cubit/auth_cubit.dart';
import '../../auth_cubit/auth_state.dart';

class VerifyScreen extends StatelessWidget {
  VerifyScreen({super.key});

  final String userEmail =
      FirebaseAuth.instance.currentUser?.email ?? 'your email';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.background,
      appBar: AppBar(
        backgroundColor: AppColor.background,
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: Colors.grey.shade300, width: 2),
            ),
            child: IconButton(
              icon: const Icon(Icons.arrow_back_ios_new, size: 16),
              color: AppColor.primary,
              onPressed: () => Navigator.pop(context),
            ),
          ),
        ),
      ),
      body: BlocConsumer<AuthCubit, AuthState>(
        listener: (BuildContext context, state) {
          if (state is EmailSuccessVerification) {
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (context) => HomeNavigator()),
            );
          }
          if (state is ResendEmailSuccessVerification) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                backgroundColor: Colors.green,
                content: Text('Code Resend Successfully, Check Your Email'),
              ),
            );
          }
          if (state is EmailFailureVerification) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(backgroundColor: Colors.red, content: Text(state.msg)),
            );
          }
        },
        builder: (BuildContext context, state) {
          final cubit = BlocProvider.of<AuthCubit>(context);
          final loadingState = state is EmailLoadingVerification;

          return Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              spacing: 15,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                HeaderAuth(
                  image: AppImages.check,
                  title: 'Check your inbox',
                  subTitle: 'We send code to : ',
                ),

                Text(
                  '$userEmail',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w500,
                    color: AppColor.gray1,
                    decoration: TextDecoration.underline,
                  ),
                ),

                SizedBox(height: 20),

                CustomButton(
                  text: loadingState
                      ? 'Checking...'
                      : 'I have verified, Continue',
                  onPressed: () {
                    cubit.verifyEmail();
                  },
                ),

                TextButton(
                  onPressed: loadingState
                      ? null
                      : () {
                          cubit.verifyEmail();
                        },
                  child: const Text(
                    'Resend Verification Email',
                    style: TextStyle(
                      color: AppColor.primary,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
