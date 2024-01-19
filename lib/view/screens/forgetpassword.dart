import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:task/classes/textformfield.dart';
import 'package:task/view%20model/cubit/authCubit/authcubit.dart';
import 'package:task/view%20model/cubit/authCubit/authstate.dart';

import '../../view model/cubit/home_state.dart';

class ForgetPassword extends StatelessWidget {
  const ForgetPassword({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit,AuthState>(builder: (context,state){
      return Scaffold(
        backgroundColor: Colors.grey[300],
        body: SingleChildScrollView(
          child: Column(children: [
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Padding(
                padding: const EdgeInsets.only(top: 50,left: 25),
                child: Row(children: [
                  Text("Forget Password", style: GoogleFonts.poppins(
                    textStyle: TextStyle(
                        color: Colors.black,
                        fontSize:35,
                        fontWeight: FontWeight.bold),),),
                  SizedBox(width: 32,),
                  Text("Sign Up", style: GoogleFonts.poppins(
                    textStyle: TextStyle(
                        color: Colors.black38,
                        fontSize:35,
                        fontWeight: FontWeight.bold),),),
                  SizedBox(width: 32,),
                ],),
              ),
            ),
          
            Padding(
              padding: const EdgeInsets.all(30),
              child: Text("Enter the Email address you used to create your account and we will email you a link to reset the password",
                textAlign: TextAlign.center,
                style: GoogleFonts.poppins(
                  textStyle: TextStyle(
                      color: Colors.black26,
                      fontSize:15,
                      fontWeight: FontWeight.w600
                  ),),),
            ),
            Container(
              margin: EdgeInsets.only(top: 20,right: 20,left: 20),
              height: 70,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15)
              ),
              child:
              CustomTextFormfield(Controllerr: AuthCubit.get(context).emailController,
              hint: "EMAIL",
              icon: Icons.email_outlined,),),
            SizedBox(height: 30,),
            ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor:
                Colors.red[400],
                    elevation: 5,
                    maximumSize: Size(350, 600),
                    minimumSize: Size(280, 60)
                ),
                onPressed: (){
               AuthCubit.get(context).resetPassword(AuthCubit.get(context).emailController.text);
                }, child: Row(children: [
              Padding(
                padding: const EdgeInsets.only(left: 80),
                child: Text('Send Email',
                  style: GoogleFonts.poppins(
                    textStyle: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.w600),
                  ),),
              ),
              Spacer(),
              CircleAvatar(
                  radius: 15,
                  backgroundColor: Colors.white,
                  child: Icon(Icons.arrow_forward_ios,color: Colors.red[700],size: 25,))
          
            ],)),
          ],),
        ),
      );
    }, listener: (context,state){
    if(state is PasswordResetLoading) {
    CircularProgressIndicator()
    ;}
    if (state is PasswordResetSuccess) {
    ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(content: Text('Password reset email sent successfully',style: GoogleFonts.poppins(
    textStyle: TextStyle(
    color: Colors.white,
        fontSize: 20,
        fontWeight: FontWeight.w600),)),
    ));
    } else if (state is PasswordResetError) {
    ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(content: Text('Error',style: GoogleFonts.poppins(
      textStyle: TextStyle(
          color: Colors.white,
          fontSize: 20,
          fontWeight: FontWeight.w600),))),
    );
    }
    });
  }
}

