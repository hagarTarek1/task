import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:material_dialogs/dialogs.dart';
import 'package:task/view%20model/cubit/home-cubit.dart';
import 'package:task/view%20model/cubit/home_state.dart';
import 'package:task/view/screens/layoutS.dart';
import '../../model/categorymodel.dart';
import '../components/cart.dart';


class CartScreen extends StatelessWidget {
  final Cart? cart;
  CartScreen({Key? key,this.cart}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return
      BlocProvider.value(
        value: HomeCubit.get(context)..cartStream..fetchCartData()..fetchOrders()..calculateTotal(cart ?? Cart()),
        child: BlocConsumer<HomeCubit,HomeState>(
              builder: (context, state) {
                var cubit = HomeCubit.get(context);
                cubit.createInstance1();
                return
                state is FetchDataLoading?
                  Center(child: CircularProgressIndicator()):
                cubit.carts == null || cubit.carts!.isEmpty?
                        Scaffold(
                          body: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                          Center(child:Image.asset('assets/cart.png')),
                          SizedBox(height: 20.h,),
                            Text("Your cart is empty",style: GoogleFonts.poppins(
                            textStyle: TextStyle(
                                color: Colors.red.shade700,
                                fontSize: 20.sp,
                                fontWeight: FontWeight.w700),
                          ),),
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
                            reverse: true,
                              shrinkWrap: true,
                              itemBuilder: (context, index) {
                                return MyCart( cart:cubit.carts?[index] , cartIndex: index,);
                              },
                              separatorBuilder: (context, index) => Padding(
                                padding:
                                EdgeInsets.symmetric(horizontal: 20.w),
                                child: Divider(
                                  thickness: 2,
                                ),
                              ),
                              itemCount: cubit.carts?.length ?? 0),
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
                                Text("\$${cubit.subtotal??0}",style: GoogleFonts.poppins(
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
                                    cubit.moveCartToOrders();
                                    Dialogs.materialDialog(
                                        color: Colors.white,
                                        context: context,
                                        actions: [
                                          Column(children: [
                                            Image.asset('assets/circle_tick_check_mark_paint_brush_stroke.png',fit: BoxFit.fitWidth,),
                                            SizedBox(height: 20.h,),
                                            Text('Added to order Successfully',
                                              style: GoogleFonts.poppins(
                                                textStyle: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 12.sp,
                                                    fontWeight: FontWeight.w700),
                                              ),),
                                            SizedBox(height: 20.h,),
                                            ElevatedButton(
                                              style: ElevatedButton.styleFrom(backgroundColor:
                                              Colors.red[400],
                                                  elevation: 5,
                                                  maximumSize: Size(160.w, 60.h),
                                                  minimumSize: Size(150.w, 50.h)
                                              ),
                                              onPressed: (){
                                                Navigator.push(context,MaterialPageRoute(builder: (context)=> LayOutScreen()));
                                              }, child:  Text('     Back To \nHomeScreen',
                                              style: GoogleFonts.poppins(
                                                textStyle: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 12.sp,
                                                    fontWeight: FontWeight.w600),
                                              ),),),
                                          ],)
                                        ]
                                    );
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
                                      // SizedBox(width: 15.w,),
                                      Spacer(),
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
              listener: (context, state) {

              }),
      );
  }

}


