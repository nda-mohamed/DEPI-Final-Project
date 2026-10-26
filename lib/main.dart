import 'package:depi_final_project/auth/screens/verify_screen/verify_screen.dart';
import 'package:depi_final_project/ui/home_screen/home_navigator.dart';
import 'package:depi_final_project/ui/onboarding_screen/onboarding_screen.dart';
import 'package:depi_final_project/ui/splash_screen/splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'auth/auth_cubit/auth_cubit.dart';
import 'auth/screens/forget_password_screen/forget_password_screen.dart';
import 'auth/screens/login_screen/login_screen.dart';
import 'auth/screens/signup_screen/signup_screen.dart';
import 'core/routes/app_routes.dart';
import 'firebase_options.dart';

void main() async {

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthCubit(),
      child: MaterialApp(
        title: 'AI_Longo',
          debugShowCheckedModeBanner: false,
          home: SplashScreen(),
          // initialRoute: AppRoutes.SplashScreen.name,
          // routes: {
          //   AppRoutes.SplashScreen.name: (context) => const SplashScreen(),
          //   AppRoutes.OnBoardingScreen.name: (context) => const OnBoardingScreen(),
          //   AppRoutes.LoginScreen.name: (context) => const LoginScreen(),
          //   AppRoutes.SignupScreen.name: (context) => const SignupScreen(),
          //   AppRoutes.ForgetPasswordScreen.name: (context) => const ForgetPasswordScreen(),
          //   AppRoutes.VerifyScreen.name: (context) => const VerifyScreen(),
          //   AppRoutes.HomeNavigator.name: (context) => const HomeNavigator(),
          // }
      ),
    );
  }
}