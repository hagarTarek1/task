import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:task/view%20model/cubit/home-cubit.dart';
import 'package:task/view%20model/cubit/home_state.dart';
import 'package:task/view/screens/all-categories.dart';

class SeeAll extends StatelessWidget {

  SeeAll({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var cubit=HomeCubit.get(context);
    return BlocConsumer<HomeCubit,HomeState>(builder: (context,state){
      return InkWell( onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context)=> AllCategories()));
      },
        child: Column(children: [
          Stack(children: [
            Card(
              elevation: 5,
              shadowColor: Colors.white,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
              child: Container(height: 70.h,
                width: 70.h,
                decoration: BoxDecoration(shape: BoxShape.circle,
                  color: Colors.white

                ),),
            ),
            Padding(
              padding:  EdgeInsets.only(left: 30.w,top: 25.h),
              child: Center(child: Icon(Icons.arrow_forward_ios_outlined,color: Colors.red.shade700,size: 28.r,)),
            ),
          ],),
          SizedBox(height: 10.h,),
          Text( "See All",
            style: GoogleFonts.poppins(
              textStyle: TextStyle(
                  color: Colors.black45,
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w500),
            ),
          ),
        ],),
      );
    }, listener: (context,state){});
  }
}

