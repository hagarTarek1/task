import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:task/view%20model/cubit/home-cubit.dart';
import 'package:task/view%20model/cubit/home_state.dart';
import '../../model/categorymodel.dart';

class MyCart extends StatelessWidget {
  CartItem? cart;
final int cartIndex;
  MyCart({required this.cart,required this.cartIndex, Key? key}) : super(key: key);

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

                           cart?.image ??
                              ""
                        ).image,
                      )),
                  SizedBox(
                    width: 10.w,
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
                                cart?.name ??
                                "",
                                style: GoogleFonts.poppins(
                                  textStyle: TextStyle(
                                      fontSize: 16.sp,
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold),
                                )),
                            SizedBox(width: 5.h,),

                            CircleAvatar( radius: 15.r,
                              backgroundColor: Color(cart?.selectColor ?? 4279308562),)
                          ],
                        ),
                        Text("\$${cart?.price??""} ",
                            style: GoogleFonts.poppins(
                              textStyle: TextStyle(
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.red),
                            )),
                        // SizedBox(width: 30.h,),
                        Text("Size: ${ cart?.selectSize ??""} ",
                            style: GoogleFonts.poppins(
                              textStyle: TextStyle(
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black45),
                            )),
                        SizedBox(
                          height: 5.h,
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
                  SizedBox(width: 30.w,),
                  Expanded(
                    flex: 1,
                    child: IconButton(onPressed: (){
                      cubit.deleteCartItem(cartIndex);
                    }, icon: Icon(Icons.delete_outline,color: Colors.red,)),
                  )
              ]));
        },
        listener: (context, state) {});
  }
}
