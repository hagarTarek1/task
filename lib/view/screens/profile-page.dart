import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:task/classes/customrow.dart';
import 'package:task/view%20model/cubit/authCubit/authcubit.dart';
import 'package:task/view%20model/cubit/home-cubit.dart';
import 'package:task/view%20model/cubit/home_state.dart';

class Profile extends StatelessWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit,HomeState>(builder: (context,state){
      var cubit=HomeCubit.get(context);
      var cubit2=AuthCubit.get(context);
      return Scaffold(
        backgroundColor: Colors.grey.shade100,
        appBar: AppBar(elevation: 0,
          backgroundColor: Colors.transparent,
          toolbarHeight: 40,
          automaticallyImplyLeading: false,
          actions: [Icon(Icons.mode_comment_outlined),
            SizedBox(width: 15.w,),
            Icon(Icons.notification_add_outlined),
            SizedBox(width: 10.w,),],),
        body: ListView(children: [
          Row(
          children: [
          Expanded(
          flex: 2,
              child: CircleAvatar(
                radius: 60.r,
                backgroundImage: Image.network(
                   ""
                ).image,
              )),
          SizedBox(
            width: 10.w,
          ),
          Expanded(
            flex: 3,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(cubit2.userController.text,
                    style: GoogleFonts.poppins(
                      textStyle: TextStyle(
                          fontSize: 16.sp,
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                    )),
                Text(cubit2.emailController.text,
                    style: GoogleFonts.poppins(
                      textStyle: TextStyle(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.bold,
                          color: Colors.red),
                    )),
                SizedBox(
                  height: 10.h,
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(backgroundColor:
                  Colors.white,
                      elevation: 2,
                      side: BorderSide(
                        width: 2.0,
                        color: Colors.grey.shade500,
                      ),
                      maximumSize: Size(140.w, 35.h),
                      minimumSize: Size(120.w, 35.h)
                  ),
                  onPressed: (){
                  }, child: Text('EDIT PROFILE',
                    style: GoogleFonts.poppins(
                      textStyle: TextStyle(
                          color: Colors.grey.shade500,
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w500),
                    ),),
          ),
            ],
          )
          ),],),
      Container(
        padding: EdgeInsets.all(20.r),
          margin: EdgeInsets.only(top: 30.h,right: 20.w,left: 20.w),
          height: 220.h,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15)
          ),
          child:Column(children: [
            CustomRow(text: "All My orders", icon: Icons.line_weight_sharp),
            SizedBox(height: 10.h,),
            Divider(color: Colors.grey.shade50,),
            CustomRow(text: "Pending Shipment", icon: Icons.pending),
            SizedBox(height: 10.h,),
            Divider(color: Colors.grey.shade50,),
            CustomRow(text: "finished orders", icon: Icons.cloud_done_outlined),
            SizedBox(height: 10.h,),
            Divider(color: Colors.grey.shade50,),
            CustomRow(text: "Pending Payments", icon: Icons.payment_outlined),
          ],)),
          Container(
              padding: EdgeInsets.all(20.r),
              margin: EdgeInsets.only(top: 20.h,right: 20.w,left: 20.w),
              height: 220.h,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15)
              ),
              child:Column(children: [
                CustomRow(text: "Invite Friends", icon: Icons.insert_invitation_outlined),
                SizedBox(height: 10.h,),
                Divider(color: Colors.grey.shade50,),
                CustomRow(text: "Custom Support", icon: Icons.support_agent_outlined),
                SizedBox(height: 10.h,),
                Divider(color: Colors.grey.shade50,),
                CustomRow(text: "Rate out App", icon: Icons.star_rate_outlined),
                SizedBox(height: 10.h,),
                Divider(color: Colors.grey.shade50,),
                CustomRow(text: "Make a suggestion", icon: Icons.wallet_membership_sharp),
              ],)),

          Padding(
            padding: EdgeInsets.all(20.r),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: Colors.white,
              elevation: 0),
                onPressed: (){
              cubit2.logOut();
            }, child: Text("LogOut",style: GoogleFonts.poppins(
                  textStyle: TextStyle(
                  color: Colors.red,
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w600),))),
          )
        ]));
    }, listener: (context,state){});
  }
}
