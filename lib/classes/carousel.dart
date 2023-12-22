import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:task/view%20model/cubit/home-cubit.dart';
import 'package:task/view%20model/cubit/home_state.dart';
import 'package:task/model/categorymodel.dart';
class CarouselDetail extends StatelessWidget {
  Ads? ads;
   CarouselDetail({required this.ads,Key? key,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var cubit=HomeCubit.get(context);
    return BlocConsumer<HomeCubit,HomeState>(
      builder: (context,state){
        return
       Padding(
        padding: EdgeInsets.only(left:20.w,right: 20.w,top: 10.h),
        child: Stack(

          children: [
                        ClipRRect(
              borderRadius: BorderRadius.circular(20.r),
              child: Image.network(
               ads?.image ?? "",height: 500.h,width: 400.w,fit: BoxFit.cover,),
            ),
            Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 10.h,right: 80.w),
                  child: Text(ads?.text ?? "", style: GoogleFonts.poppins(
                    textStyle: TextStyle(
                        color: Colors.black26,
                        fontSize:15.sp,
                        fontWeight: FontWeight.bold),),),
                ),

                Padding(
                  padding:  EdgeInsets.only(top: 40.h,right: 100.w,left: 10.w),
                  child: ElevatedButton(

                      style: ElevatedButton.styleFrom(backgroundColor:
                      Colors.white,
                          elevation: 2,
                          maximumSize: Size(110.h, 200.w),
                          minimumSize: Size(50.h, 30.w)
                      ),
                      onPressed: (){}, child: Row(children: [
                    Text('see more',
                      style: GoogleFonts.poppins(
                        textStyle: TextStyle(
                            color: Colors.black54,
                            fontSize: 9.sp,
                            fontWeight: FontWeight.bold), ),),
                    Spacer(),
                    CircleAvatar(
                        radius: 8,
                        backgroundColor: Colors.red[700],
                        child: Icon(Icons.arrow_forward_ios,color: Colors.white,size: 8.r,))

                  ],)),
                ),
              ],
            ),

          ],
        ),
      );},
          listener: (context,state){},
    );
  }
}
