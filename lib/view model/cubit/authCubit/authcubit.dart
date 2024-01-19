import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task/view%20model/cubit/authCubit/authstate.dart';
import 'package:flutter/material.dart';

class AuthCubit extends Cubit<AuthState>{
  AuthCubit():super(InitState());
  static AuthCubit get(context)=> BlocProvider.of<AuthCubit>(context);
  static var formState=GlobalKey<FormState>();
  static var formState2=GlobalKey<FormState>();
  TextEditingController emailController= TextEditingController();
  TextEditingController passController= TextEditingController();
  TextEditingController userController= TextEditingController();
  bool isObscure=true;
  showPassword(){
    isObscure =! isObscure;
    emit(ShowPasswordSuccess());
  }
  signUp() async {
    try{
      emit(SignUpLoading());
      UserCredential user =await FirebaseAuth.instance.createUserWithEmailAndPassword(email: emailController.text, password: passController.text,);
      emit(SignUpSuccess());
    } catch (e){
      print(e);
      emit(SignUpError());
    }
  }


  logIn() async {
    try{
      emit(LoginLoading());
      UserCredential user = await FirebaseAuth.instance.signInWithEmailAndPassword(email: emailController.text, password: passController.text);
      emit(LoginSuccess());
    }
    catch (e){
      print(e);
      emit(LoginError());
    }}
  logOut()  {
    UserCredential user =  FirebaseAuth.instance.signOut() as UserCredential;
  }
  Future<void> resetPassword(String email) async {
    emit(PasswordResetLoading());

    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
      emit(PasswordResetSuccess());
    } catch (e) {
      emit(PasswordResetError());
    }
  }
}