import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:task/view%20model/cubit/home-cubit.dart';
import 'package:task/view%20model/cubit/home_state.dart';
import 'package:task/view/screens/details.dart';

import '../../model/categorymodel.dart';

class AllProducts extends StatelessWidget {
Categories? categories;
  AllProducts({required this.categories,Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeState>(
        builder: (context, state) {
          return SizedBox(
            width: 130.w,
            child: Card(
              color: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.r),
              ),
              elevation: 3,
              child: InkWell(
                onTap: () {
                  Navigator.push(context,MaterialPageRoute(builder: (context)=> ProductDetailsScreen()));
                },
                child: Padding(
                  padding:
                   EdgeInsets.only(top: 20.h, left: 20.w, right: 20.w),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Expanded( flex: 3,
                      //     child: Image.network("https://contents.mediadecathlon.com/p2393865/k59e9499e49d170903fb3c71ddaf67c3a/sq/250x250/Mens-Running-Shoes-Jogflow-100.1-Red.jpg")),
                      SizedBox(
                        height: 15.h,
                      ),
                      Expanded( flex: 1,
                        child: Text( categories?.title ?? "",
                          style: GoogleFonts.poppins(
                            textStyle: TextStyle(
                                color: Colors.black54,
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w700),
                          ),
                        ),
                      ),
                      Expanded( flex: 1,
                        child: Text(
                         categories?.description?? "",
                          style: GoogleFonts.poppins(
                            textStyle: TextStyle(
                                color: Colors.black54,
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                      ),


                    ],
                  ),
                ),
              ),
            ),
          );
        },
        listener: (context, state) {});
  }
}
