import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:task/view%20model/cubit/home-cubit.dart';
import 'package:task/view%20model/cubit/home_state.dart';

import '../../model/categorymodel.dart';
import '../screens/details.dart';

class AllProducts extends StatelessWidget {
  final int index;
  Products? products;
  AllProducts({required this.products,required this.index,Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeState>(
        builder: (context, state) {
          return SizedBox(
            width: 110.w,
            child: Card(
              color: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.r),
              ),
              elevation: 5,
              child: InkWell(
                onTap: () {
                  Navigator.push(context,MaterialPageRoute(builder: (context)=> ProductDetailsScreen(products: HomeCubit.get(context).products?[index], index: index, selectedColorCallBack: (int ) {
                    print(int);
                  }, selectedSizeCallBack: (int ) {   print(int); },)));
                },
                child: Container(
                  width: 110.w,
                  decoration: BoxDecoration(color: Colors.white,borderRadius:  BorderRadius.circular(15.r)),

                  child: Padding(
                    padding:
                     EdgeInsets.only(top: 20.h, left: 10.w, right: 10.w),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded( flex: 3,
                          child: Image.network(products?.image ?? "",height: 80.h,fit: BoxFit.fitHeight,)),
                        SizedBox(
                          height: 15.h,
                        ),
                        Expanded( flex: 1,
                          child: Text( products?.name ?? "",
                            style: GoogleFonts.poppins(
                              textStyle: TextStyle(
                                  color: Colors.black38,
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.w700),
                            ),
                          ),
                        ),
                        Expanded( flex: 1,
                          child: Text(
                           products?.description?? "",
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
            ),
          );
        },
        listener: (context, state) {});
  }
}
