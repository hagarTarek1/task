import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:task/model/categorymodel.dart';
import 'package:task/view%20model/cubit/home-cubit.dart';
import 'package:task/view%20model/cubit/home_state.dart';

class MyCart extends StatelessWidget {
Products? product;
int? index;
  MyCart({required this.product,required this.index, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit,HomeState>(
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
                        backgroundImage: Image.network(
                          product?.image ?? ""
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
                        Text(product?.name ?? "",
                            style: GoogleFonts.poppins(
                              textStyle: TextStyle(
                                  fontSize: 16.sp,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            )),
                        Text("\$${product?.price ?? 0} ",
                            style: GoogleFonts.poppins(
                              textStyle: TextStyle(
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.red),
                            )),
                        SizedBox(
                          height: 10.h,
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            IconButton(
                              onPressed: () {

                              },
                                icon: Icon(Icons.minimize_outlined,shadows: [Shadow(color: Colors.black38,blurRadius: 5)])),
                            SizedBox(
                              width: 8.w,
                            ),
                            Center(
                                child: Text(
                                  '1',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold, fontSize: 18.sp),
                                )),
                            SizedBox(
                              width: 8.w,
                            ),
                            IconButton(
                                onPressed: () {
                                },
                                icon: Icon(Icons.add,shadows: [Shadow(color: Colors.black38,blurRadius: 5)],)
                                ),
                          ],
                        ),
                      ],
                    ),
                  ),
              ]));
        },
        listener: (context, state) {});
  }
}
