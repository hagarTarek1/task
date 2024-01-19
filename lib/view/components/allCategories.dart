import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:task/model/categorymodel.dart';
import 'package:task/view%20model/cubit/home-cubit.dart';
import 'package:task/view%20model/cubit/home_state.dart';

class AllCategoriesDetails extends StatelessWidget {
  AllCategories? allCategories;
  final index;
  AllCategoriesDetails({required this.allCategories,required this.index,Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var cubit=HomeCubit.get(context);
    return BlocConsumer<HomeCubit,HomeState>(builder: (context,state){
      return InkWell( onTap: () async {
               cubit.changeCurrentIndexOfCategory(index);
      },
        child: Column(children: [
          Stack(children: [
            Card(
              elevation: 15,
              shadowColor: cubit.colorsListAll[index],
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
              child: Container(height: 70.h,
                width: 70.h,
                decoration: BoxDecoration(shape: BoxShape.circle,
                  gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,

                      colors:[
                        Colors.white,
                        cubit.colorsListAll[index],]
                  ),
                ),),
            ),
            Padding(
              padding:  EdgeInsets.only(left: 18.w,top: 15.h),
              child: Image.network(allCategories?.image?? "",height: 45.h,fit: BoxFit.fitHeight,color: Colors.white,),
            ),
          ],),
          SizedBox(height: 10.h,),
          Text( allCategories?.name ?? "",
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
