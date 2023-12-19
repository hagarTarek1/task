import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:task/view%20model/cubit/home-cubit.dart';
import 'package:task/view%20model/cubit/home_state.dart';
import 'package:task/view/screens/homeScreen.dart';
import 'package:task/view/screens/layout.dart';
class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var user=HomeCubit.get(context).emailController.text;
    Future.delayed(Duration(seconds: 2));
    FirebaseAuth.instance
        .authStateChanges()
        .listen((user) {
      if (user == null) {
        Navigator.push(context, MaterialPageRoute(builder: (context)=> LayOut()));
        print('User is currently signed out!');
      } else {
        Navigator.push(context, MaterialPageRoute(builder: (context)=> HomeScreen()));
        print('User is signed in!');
      }
    });
    return BlocConsumer<HomeCubit,HomeState>(
      builder: (context,state){
        return Scaffold(
          backgroundColor: Colors.grey[300],
          body: Center(child: Container(
            height: 100,
            width: double.infinity,
            decoration: BoxDecoration(color: Colors.red.shade700,
              borderRadius: BorderRadius.circular(25),
            ),
            child: Text('Welcome to our App', style: GoogleFonts.poppins(
              textStyle: TextStyle(
                  color: Colors.white,
                  fontSize:35,
                  fontWeight: FontWeight.bold),),),),),
        );
      }, listener: (BuildContext context, HomeState state) { },
    );
  }
}