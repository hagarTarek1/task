import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:task/classes/textformfield.dart';
import 'package:task/view%20model/cubit/authCubit/authcubit.dart';
import 'package:task/view/screens/homeScreen.dart';
import 'package:task/view/screens/layoutS.dart';
import '../../view model/cubit/authCubit/authstate.dart';
import 'forgetpassword.dart';
class Signup extends StatelessWidget {
  const Signup({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit,AuthState>(builder: (context,state){
      var cubit =AuthCubit.get(context);
      return Scaffold( backgroundColor: Colors.grey[300],
          body: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding:  EdgeInsets.only(top: 50.h,left: 25.w),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(children: [
                      Text("Sign Up", style: GoogleFonts.poppins(
                        textStyle: TextStyle(
                            color: Colors.black,
                            fontSize:35.sp,
                            fontWeight: FontWeight.bold),),),
                      SizedBox(width: 32.w,),
                      Text("Log In", style: GoogleFonts.poppins(
                        textStyle: TextStyle(
                            color: Colors.black38,
                            fontSize:35.sp,
                            fontWeight: FontWeight.bold),),),
                      SizedBox(width: 32.w,),
                      InkWell(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>ForgetPassword()));
                        },
                        child: Text("Forget password", style: GoogleFonts.poppins(
                          textStyle: TextStyle(
                              color: Colors.black38,
                              fontSize:35.sp,
                              fontWeight: FontWeight.bold),),),
                      ),
                    ],),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 40.h,right: 20.w,left: 20.w),
                  height: 150.h,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15.r)
                  ),
                  child: Form(
                    key: AuthCubit.formState,
                    child: Column(children: [
                      CustomTextFormfield(Controllerr: cubit.emailController, hint: "Email", icon: Icons.email_outlined),
                      Divider(
                        color: Colors.grey[100],
                      ),
                      TextFormField(
                        obscureText: cubit.isObscure,
                      validator: (value) {
                if (value!.isEmpty) {
                return "please enter your Data";
                }
                return null;
                },
                  controller: cubit.passController,
                  scrollPadding: EdgeInsets.all(5.r),
                  decoration: InputDecoration(border: InputBorder.none,
                    prefixIcon: Icon(Icons.lock_outline_rounded,size: 30.r,color: Colors.black54,),
                    suffixIcon: IconButton(onPressed: (){cubit.showPassword();}, icon: Icon(cubit.isObscure? Icons.visibility:Icons.visibility_off)
                    ),
                    label: Text('Password'),
                    labelStyle: GoogleFonts.poppins(
                      textStyle: TextStyle(
                          color: Colors.grey[400],
                          fontSize: 15.sp,
                          fontWeight: FontWeight.w600),
                    ),),
                ),
                    ],),
                  ),),
                  // Container(
                  // margin: EdgeInsets.only(top: 20.h,right: 20.w,left: 20.w),
                  // height: 70.h,
                  // decoration: BoxDecoration(
                  // color: Colors.white,
                  // borderRadius: BorderRadius.circular(15.r)
                  // ),
                  // child:CustomTextFormfield(Controllerr: cubit.passController, hint: 'Password', icon: Icons.lock_outline_rounded,
                  // )),
                SizedBox(height: 30.h,),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(backgroundColor:
                    Colors.red[400],
                        elevation: 5,
                        maximumSize: Size(350, 600),
                        minimumSize: Size(280, 60)
                    ),
                    onPressed: (){
                      cubit.signUp();
                       Navigator.push(context, MaterialPageRoute(builder: (context)=>HomeScreen()));
                    }, child: Row(children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 110),
                    child: Text('sign up',
                      style: GoogleFonts.poppins(
                        textStyle: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.w600),
                      ),),
                  ),
                  Spacer(),
                  CircleAvatar(
                      radius: 16,
                      backgroundColor: Colors.white,
                      child: Icon(Icons.arrow_forward_ios,color: Colors.red[700],size: 25,))
            
                ],)),
                           SizedBox(height: 60,),
                Row( mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("By continuing you agree to our",style:
                    GoogleFonts.poppins(textStyle:
                    TextStyle(fontSize: 12,height: 1,color: Colors.black54,fontWeight: FontWeight.bold),)),
                    SizedBox(width: 5,),
                     ],),
                SizedBox(height: 5),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(width: 16),
                    TextButton(
                      style: TextButton.styleFrom(
                        padding: EdgeInsets.zero,
                        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        minimumSize: Size(10, 10),
                        maximumSize: Size(double.infinity, 20),
                      ),
                      onPressed: (){}, child: Text("Terms of service",style:
                    GoogleFonts.poppins(textStyle:
                    TextStyle(color: Colors.red[700],fontSize: 12,height: 1,fontWeight: FontWeight.w600),),),),
                    SizedBox(width: 5,),
                    Text("And",style:
                    GoogleFonts.poppins(textStyle:
                    TextStyle(fontSize: 12,color: Colors.black54,fontWeight: FontWeight.bold),)),
                    SizedBox(width: 5,),
                    TextButton(
                      style: TextButton.styleFrom(
                        padding: EdgeInsets.zero,
                        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        minimumSize: Size(10, 10),
                        maximumSize: Size(double.infinity, 20),
                      ),
                      onPressed: (){}, child: Text("Privacy policy",style:
                    GoogleFonts.poppins(textStyle:
                    TextStyle(color:Colors.red[700],fontSize: 12,fontWeight: FontWeight.w600),),),),
                  ],),
            
              ],),
          ));
    }, listener: (context,state){
      state is SignUpLoading?
      Center(child: CircularProgressIndicator(),):
      state is SignUpSuccess?
      Navigator.push(context, MaterialPageRoute(builder: (context)=>LayOutScreen())):
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Try again")));
      // QuickAlert.show(
      //   confirmBtnColor: Colors.red.shade700,
      //   textColor: Colors.white,
      //   context: context,
      //   type: QuickAlertType.error,
      //   title: 'Oops...',
      //   text: 'Sorry, something went wrong try again',
      // );
    });}}
