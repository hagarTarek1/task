import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:task/view%20model/cubit/home-cubit.dart';
import 'package:task/view%20model/cubit/home_state.dart';
import 'package:task/view/components/ALLCATEGORIESdETAILS.dart';
import 'package:task/view/components/allCategories.dart';

class AllCategories extends StatelessWidget {
  const AllCategories({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit,HomeState>(builder: (context,state){
      var cubit=HomeCubit.get(context);
      return Scaffold(
        backgroundColor: Colors.grey.shade100,
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
              children: [
            Padding(
              padding: EdgeInsets.only(left: 15.w,bottom: 20.h,top: 60),
              child: Text("All Categories",style: GoogleFonts.poppins(
                textStyle: TextStyle(
                    color: Colors.black,
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w700),
              ),),
            ),
            Row( crossAxisAlignment: CrossAxisAlignment.start,
              children: [
            SizedBox(
            height: 600.h,
            width: 120.w,
            child: ListView.separated(
            padding: EdgeInsets.only(left: 10.w),
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            itemBuilder: (context,index){
            return AllCategoriesDetails(allCategories: cubit.allCategories?[index],index:index);
            }, separatorBuilder: (context,index){
            return SizedBox(width: 15.w,);
            }, itemCount: cubit.allCategories?.length ?? 0)),
            // SizedBox(width: 20.w,),
              SizedBox(
                height: 700.h,
                width: 230.w,
                child: ListView.separated(
                  shrinkWrap: true,
                    itemBuilder: (context,index){

                  return
                    AllCategoriesContains(
                      beauty: cubit.beauty?[index],
                      furniture: cubit.furniture?[index],
                      clothes: cubit.clothes?[index],
                      ).animate()
                        .fade(duration: 500.ms)
                        .scale(delay: 500.ms);
                }, separatorBuilder:  (context,index){
                  return SizedBox(height: 25.h,);
                }, itemCount:
                    cubit.listIndex==0?
                cubit.beauty?.length ??0:
                        cubit.listIndex==1?
                        cubit.furniture?.length??0:
                            cubit.listIndex==2?
                cubit.clothes?.length ??0:
                                0

                )
              ),

            ],),
                ]),
        )
      );
    }, listener:  (context,state){});
  }
}
