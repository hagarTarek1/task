import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:task/view%20model/cubit/home-cubit.dart';
import 'package:task/view%20model/cubit/home_state.dart';
import 'package:task/view/components/orders.dart';

import '../../model/categorymodel.dart';



class OrderScreen extends StatelessWidget {
  AllOrder? allOrder;
  OrderScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return
      BlocConsumer<HomeCubit,HomeState>(
          builder: (context, state) {
            var cubit = HomeCubit.get(context);
            return
              state is OrdersLoading?
              Center(child: CircularProgressIndicator()):
              cubit.orders!.isEmpty?
              Scaffold(
                body: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Center(child:Image.asset('assets/4676727.png')),
                    SizedBox(height: 20.h,),
                    Padding(
                      padding: EdgeInsets.only(left: 40.w),
                      child: Text("Your don't have any     \n                 orders!",style: GoogleFonts.poppins(
                        textStyle: TextStyle(
                            color: Colors.red.shade700,
                            fontSize: 20.sp,
                            fontWeight: FontWeight.w700),
                      ),),
                    ),
                  ],),)
                  :Scaffold(
                backgroundColor: Colors.grey.shade200,
                appBar: AppBar(
                  elevation: 0,
                  toolbarHeight: 80,
                  backgroundColor:Colors.transparent,
                  actions: [Icon(Icons.mode_comment_outlined),
                    SizedBox(width: 15.w,),
                    Icon(Icons.notification_add_outlined),
                    SizedBox(width: 10.w,),],
                ),
                body: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 20.w),
                        child: Text("Orders",style: GoogleFonts.poppins(
                          textStyle: TextStyle(
                              color: Colors.black,
                              fontSize: 20.sp,
                              fontWeight: FontWeight.w700),
                        ),),
                      ),
                      SizedBox(
                        height: 460.h,
                        child: ListView.separated(
                            reverse: true,
                            shrinkWrap: true,
                            itemBuilder: (context, index) {
                               return MyOrders( orderIndex: index, orders:cubit.orders?[index],);
                            },
                            separatorBuilder: (context, index) => Padding(
                              padding:
                              EdgeInsets.symmetric(horizontal: 20.w),
                              child: Divider(
                                thickness: 2,
                              ),
                            ),
                            itemCount: cubit.orders?.length ?? 0),
                      ),
                      //SizedBox(height: 5.h,),

                    ],
                  ),
                ),
              );
          },
          listener: (context, state) {

          });
  }
}
