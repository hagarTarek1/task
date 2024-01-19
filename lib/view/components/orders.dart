import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:task/view%20model/cubit/home-cubit.dart';
import 'package:task/view%20model/cubit/home_state.dart';
import '../../model/categorymodel.dart';

class MyOrders extends StatelessWidget {
 Orders? orders;
  final int orderIndex;
 MyOrders({required this.orders,required this.orderIndex, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return
      BlocConsumer<HomeCubit,HomeState>(
          builder: (context, state) {
            var cubit = HomeCubit.get(context);
            return Padding(
                padding: const EdgeInsets.all(10),
                child: Row(
                    children: [
                      Expanded(
                          flex: 2,
                          child: CircleAvatar(
                            radius: 60.r,
                            backgroundColor: Colors.transparent,
                            backgroundImage: Image.network(

                                orders?.image ??
                                    ""
                            ).image,
                          )),
                      SizedBox(
                        width:2.w,
                      ),
                      Expanded(
                        flex: 2,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Text(
                                    orders?.name ??
                                        "",
                                    style: GoogleFonts.poppins(
                                      textStyle: TextStyle(
                                          fontSize: 16.sp,
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold),
                                    )),

                                SizedBox(width: 5.h,),
                                CircleAvatar( radius: 15.r,
                                  backgroundColor: Color(orders?.selectColor ?? 4279308562),),

                            // SizedBox(width: 30.h,),

                            SizedBox(
                              height: 5.h,
                            ),

                          ],
                        ),
                           SizedBox(height: 5.h,),
                            Text("\$${orders?.price??""} ",
                                style: GoogleFonts.poppins(
                                  textStyle: TextStyle(
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.red),
                                )),
                      ]),
                      )]
            ));
          },
          listener: (context, state) {});
  }
}
