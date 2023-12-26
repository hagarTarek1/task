import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:task/view%20model/cubit/home-cubit.dart';
import 'package:task/view%20model/cubit/home_state.dart';

import '../components/cart.dart';


class CartScreen extends StatelessWidget {
  CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit,HomeState>(
            builder: (context, state) {
              var cubit = HomeCubit.get(context);
              return Scaffold(
                backgroundColor: Colors.grey.shade200,
                appBar: AppBar(
                  elevation: 0,
                  toolbarHeight: 80,
                  backgroundColor:Colors.grey.shade200,
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
                        child: Text("Cart",style: GoogleFonts.poppins(
                          textStyle: TextStyle(
                              color: Colors.black,
                              fontSize: 20.sp,
                              fontWeight: FontWeight.w700),
                        ),),
                      ),
                      SizedBox(
                        height: 460.h,
                        child: ListView.separated(
                            shrinkWrap: true,
                            itemBuilder: (context, index) {
                              return MyCart(index: index, product: cubit.products?[index],);
                            },
                            separatorBuilder: (context, index) => Padding(
                              padding:
                              EdgeInsets.symmetric(horizontal: 20.w),
                              child: Divider(
                                thickness: 2,
                              ),
                            ),
                            itemCount: cubit.products?.length ?? 0),
                      ),
                      //SizedBox(height: 5.h,),
                      Padding(
                        padding: EdgeInsets.all(12.w),
                        child: Row(
                          children: [
                            Expanded(child: Column(children: [
                              Text("Total",style: GoogleFonts.poppins(
                                textStyle: TextStyle(
                                    color: Colors.black38,
                                    fontSize: 18.sp,
                                    fontWeight: FontWeight.w700),
                              ),),
                              SizedBox(height: 5.h,),
                              Text("\$125",style: GoogleFonts.poppins(
                                textStyle: TextStyle(
                                    color: Colors.black,
                                    fontSize: 20.sp,
                                    fontWeight: FontWeight.w700),
                              ),),
                            ],)),
                            Expanded(
                              flex: 2,
                              child:
                              ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(25.r),
                                  ),
                                  minimumSize: Size(100.w, 50.h),
                                  maximumSize: Size(100.w, 50.h),
                                  backgroundColor: Colors.red.shade700,
                                ),
                                onPressed: () {

                                },
                                child:  Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                                    Text("Checkout",
                                        style: GoogleFonts.poppins(
                                          textStyle: TextStyle(
                                            color: Colors.white,
                                              fontSize: 15.sp,
                                            ),
                                        )),
                                    SizedBox(width: 15.w,),
                                    CircleAvatar(
                                        radius: 12.r,
                                        backgroundColor: Colors.white,
                                        child: Icon(Icons.arrow_forward_ios,color: Colors.red[700],size: 10.r,))
                                  ],
                                ),
                              ),

                          ),
                        ],),
                      )
                    ],
                  ),
                ),
              );
            },
            listener: (context, state) {});
  }
}