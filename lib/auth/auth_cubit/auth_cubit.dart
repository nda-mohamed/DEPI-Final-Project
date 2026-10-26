import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());

  final fireAuth = FirebaseAuth.instance;

  //////////////signup////////////////////////

  TextEditingController nameSignUpController = TextEditingController();
  TextEditingController emailSignUpController = TextEditingController();
  TextEditingController passwordSignUpController = TextEditingController();

  Future<void> signUp() async {
    emit(SignUpLoading());

    try {
      final data = await fireAuth.createUserWithEmailAndPassword(
        email: emailSignUpController.text,
        password: passwordSignUpController.text,
      );

      await data.user?.updateDisplayName(nameSignUpController.text.trim());

      final user = data.user;

      if (user == null) {
        emit(SignUpFailure('FireAuth Exception'));
        return;
      }

      await user?.sendEmailVerification();

      emit(SignUpSuccess());
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        emit(SignUpFailure('The password provided is too weak.'));
      } else if (e.code == 'email-already-in-use') {
        emit(SignUpFailure('The account already exists for that email.'));
      } else {
        emit(SignUpFailure('FireAuth Exception'));
      }
    } catch (E) {
      emit(SignUpFailure(E.toString()));
    }
  }

  //////////////login////////////////////////

  TextEditingController emailLogInController = TextEditingController();
  TextEditingController passwordLogInController = TextEditingController();
  TextEditingController confirmPasswordLogInController = TextEditingController();

  Future<void> logIn() async {
    emit(LogInLoading());

    try {
      final data = await fireAuth.signInWithEmailAndPassword(
        email: emailLogInController.text,
        password: passwordLogInController.text,
      );

      final user = data.user;

      if (user == null) {
        emit(LogInFailure('FireAuth Exception'));
        return;
      }

      await user.reload();

      final updatedUser = fireAuth.currentUser;

      if (updatedUser != null && updatedUser.emailVerified) {
        emit(LogInSuccess());
      } else {
        emit(EmailNotVerified());
      }

    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        emit(LogInFailure('No user found for that email.'));
      } else if (e.code == 'wrong-password') {
        emit(LogInFailure('Wrong password provided for that user.'));
      } else if (e.code == 'invalid-email') {
        emit(LogInFailure('password or mail is incorrect.'));
      } else {
        emit(LogInFailure('FireAuth Exception'));
      }
    } catch (E) {
      emit(LogInFailure(E.toString()));
    }
  }

  //////////////mail////////////////////////

  Future<void> verifyEmail() async {
    emit(EmailLoadingVerification());

    try {
      final user = fireAuth.currentUser;

      if (user == null) {
        emit(EmailFailureVerification('Pleasa SignIn to Continue'));
        return;
      }

      await user.reload();

      final updatedUser = fireAuth.currentUser;

      if (updatedUser == null) {
        emit(EmailFailureVerification('No User Found'));
        return;
      }

      if (updatedUser.emailVerified) {
        emit(EmailSuccessVerification());
        return;
      }

      await updatedUser.sendEmailVerification();

      emit(ResendEmailSuccessVerification());
    } on FirebaseAuthException catch (e) {
      emit(EmailFailureVerification(e.code));
    } catch (E) {
      emit(EmailFailureVerification(E.toString()));
    }
  }

//////////////forget pass////////////////////////

  TextEditingController emailForgetController = TextEditingController();


  Future<void> forgetPassword() async {
    emit(ForgetPasswordLoading());
    try {
      await fireAuth.sendPasswordResetEmail(
        email: emailForgetController.text.trim(),
      );
      emit(ForgetPasswordSuccess());
    } on FirebaseAuthException catch (e) {
      emit(ForgetPasswordFailure(e.code));
    } catch (e) {
      emit(ForgetPasswordFailure(e.toString()));
    }
  }



}
