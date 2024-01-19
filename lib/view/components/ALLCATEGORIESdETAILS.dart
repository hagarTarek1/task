import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:task/model/categorymodel.dart';
import 'package:task/view%20model/cubit/home-cubit.dart';
import 'package:task/view%20model/cubit/home_state.dart';

import '../../classes/customrow2.dart';

class AllCategoriesContains extends StatelessWidget {
  Clothes? clothes;
  Beauty? beauty;
  Furniture? furniture;

  AllCategoriesContains( {required this.clothes,required this.beauty,required this.furniture,Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit,HomeState>(builder: (context,state){
      var cubit=HomeCubit.get(context);
      return
        cubit.listIndex ==0?
        Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text( beauty?.kind ??"",
            style: GoogleFonts.poppins(
              textStyle: TextStyle(
                  color: Colors.black38,
                  fontSize: 15.sp,
                  fontWeight: FontWeight.w400),
            ),
          ),
          Container(
              padding: EdgeInsets.all(20.r),
               margin: EdgeInsets.only(top: 5.h),
              height: 180.h,
              width: 230.w,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15)
              ),
              child:
              ListView.separated(
                  shrinkWrap: true,
                  itemBuilder: (context,index){
                return  CustomRow2(text: beauty?.contains?[index] );
              }, separatorBuilder:  (context,index){ return Divider(color: Colors.grey.shade50,);}, itemCount: beauty?.contains?.length ??0).animate()
                  .fade(duration: 800.ms)
                  .scale(delay: 500.ms),),
        ],
      ):
            cubit.listIndex ==1?
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text( furniture?.kind ??"",
              style: GoogleFonts.poppins(
                textStyle: TextStyle(
                    color: Colors.black38,
                    fontSize: 15.sp,
                    fontWeight: FontWeight.w400),
              ),
            ),
            Container(
              padding: EdgeInsets.all(20.r),
              margin: EdgeInsets.only(top: 5.h),
              height: 180.h,
              width: 230.w,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15)
              ),
              child:
              ListView.separated(
                  shrinkWrap: true,
                  itemBuilder: (context,index){
                    return  CustomRow2(text: furniture?.contains?[index] );
                  }, separatorBuilder:  (context,index){ return Divider(color: Colors.grey.shade50,);}, itemCount: furniture?.contains?.length ??0).animate()
                  .fade(duration: 1000.ms)
                  .scale(delay: 500.ms),),
          ],
        ):
                cubit.listIndex==2?
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text( clothes?.kind ?? "",
                  style: GoogleFonts.poppins(
                    textStyle: TextStyle(
                        color: Colors.black38,
                        fontSize: 15.sp,
                        fontWeight: FontWeight.w400),
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(20.r),
                  margin: EdgeInsets.only(top: 5.h),
                  height: 180.h,
                  width: 230.w,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15)
                  ),
                  child:
                  ListView.separated(
                      shrinkWrap: true,
                      itemBuilder: (context,index){
                        return  CustomRow2(text: clothes?.contains?[index] ).animate()
                            .fade(duration: 500.ms)
                            .scale(delay: 500.ms);
                      }, separatorBuilder:  (context,index){ return Divider(color: Colors.grey.shade50,);}, itemCount: clothes?.contains?.length ??0).animate()
                      .fade(duration: 500.ms)
                      .scale(delay: 500.ms),),

              ],
            ):
                    Text("");

    }, listener: (context,state){});
  }
}
