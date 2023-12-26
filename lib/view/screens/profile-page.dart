import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:task/classes/customrow.dart';
import 'package:task/view%20model/cubit/home-cubit.dart';

class Profile extends StatelessWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer(builder: (context,state){
      return Scaffold(
        appBar: AppBar(elevation: 0,
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
                Text(HomeCubit.get(context).userController.text,
                    style: GoogleFonts.poppins(
                      textStyle: TextStyle(
                          fontSize: 16.sp,
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                    )),
                Text(HomeCubit.get(context).emailController.text,
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
                      maximumSize: Size(160.w, 60.h),
                      minimumSize: Size(150.w, 50.h)
                  ),
                  onPressed: (){
                  }, child: Text('Edit profile',
                    style: GoogleFonts.poppins(
                      textStyle: TextStyle(
                          color: Colors.black54,
                          fontSize: 12.sp,
                          fontWeight: FontWeight.bold),
                    ),),
          ),
            ],
          )
          ),],),
      Container(
          margin: EdgeInsets.only(top: 40.h,right: 20.w,left: 20.w),
          height: 300.h,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15)
          ),
          child:Column(children: [
            CustomRow(text: "All My orders", icon: Icons.line_weight_sharp),
            SizedBox(height: 20,),
            CustomRow(text: "pending shipment", icon: Icons.pending),
            SizedBox(height: 20,),
            CustomRow(text: "finished orders", icon: Icons.cloud_done_outlined),
          ],)),
        ]));
    }, listener: (context,state){});
  }
}
