import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:task/view%20model/cubit/authCubit/authcubit.dart';
import 'package:task/view%20model/cubit/home-cubit.dart';
import 'package:task/view%20model/cubit/home_state.dart';
import 'package:task/view/screens/layout.dart';
import 'package:task/view/screens/layoutS.dart';

import '../../classes/CUSTOMDRAWER.dart';
class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var user=AuthCubit.get(context).emailController.text;
     // Future.delayed(Duration(seconds: 100));
    // FirebaseAuth.instance
    //     .authStateChanges()
    //     .listen((user) {
    //   if (user == null) {
    //     Navigator.push(context, MaterialPageRoute(builder: (context)=> LayOut()));
    //     print('User is currently signed out!');
    //   } else {
    //     Navigator.push(context, MaterialPageRoute(builder: (context)=> LayOutScreen()));
    //     print('User is signed in!');
    //  }
    // });
    return BlocConsumer<HomeCubit,HomeState>(
      builder: (context,state){
        return Scaffold(
          backgroundColor: Colors.grey[50],
          body:Column(
              children: [
          Stack(
          children: [
          CustomPaint(
          painter: AppBarPainter(),
          size: Size(500, 550),
        ),
        Padding(
        padding: const EdgeInsets.only(top: 70),
        child: Image.asset("assets/5906.png"),
        ),
        ],
        ),

        SizedBox(
        height: 30,
        ),
          // body: Center(child: Container(
          //   margin: EdgeInsets.all(25.r),
          //   height: 80.h,
          //   width: double.infinity,
          //   decoration: BoxDecoration(color: Colors.red.shade700,
          //     borderRadius: BorderRadius.circular(25.r),
          //   ),
          //   child: Center(
          //     child
        TextButton(
        // style: ElevatedButton.styleFrom(backgroundColor:
        // Colors.red.shade400,
        // elevation: 10,
        // shadowColor: Colors.red.shade400,
        // maximumSize: Size(400, 90),
        // minimumSize: Size(350, 90)
        // ),
        onPressed: (){
          FirebaseAuth.instance
              .authStateChanges()
              .listen((user) {
            if (user == null) {
              Navigator.push(context, MaterialPageRoute(builder: (context)=> LayOut()));
              print('User is currently signed out!');
            } else {
              Navigator.push(context, MaterialPageRoute(builder: (context)=> LayOutScreen()));
              print('User is signed in!');
           }
          });
        }, child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Start Your\n Shopping', style: GoogleFonts.poppins(
                                          textStyle: TextStyle(
                          color: Colors.red.shade700,
                          fontSize:20.sp,
                          fontWeight: FontWeight.bold),),),
            SizedBox(height: 20.h,),
            Icon(Icons.arrow_circle_right_outlined,color: Colors.orange,size: 50.r,)
          ],
        ),
                    ),
          //   ),),),
        ],),
        );
      }, listener: (BuildContext context, HomeState state) {},
    );
  }
}
