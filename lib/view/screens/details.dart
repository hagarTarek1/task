import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:material_dialogs/dialogs.dart';
import 'package:quickalert/models/quickalert_type.dart';
import 'package:quickalert/widgets/quickalert_dialog.dart';
import 'package:task/model/categorymodel.dart';
import 'package:task/view%20model/cubit/home-cubit.dart';
import 'package:task/view%20model/cubit/home_state.dart';
import 'package:task/view/screens/cart-page.dart';
import 'package:task/view/screens/homeScreen.dart';

import 'layoutS.dart';



class ProductDetailsScreen extends StatelessWidget {
  final void Function(int) selectedColorCallBack;
  final void Function(int) selectedSizeCallBack;
  final int index;
   Products? products;

   ProductDetailsScreen ({required this.selectedColorCallBack,required this.selectedSizeCallBack,required this.products,required this.index,Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var cubit=HomeCubit.get(context);
    cubit.createInstance();
    return BlocProvider.value(
        value: HomeCubit.get(context)..cartStream..fetchCartData(),
    child:
      BlocConsumer<HomeCubit,HomeState>(builder:(context,state){return
        Scaffold( backgroundColor: Colors.grey[100],
    extendBody: true,
    extendBodyBehindAppBar: true,
    appBar: AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      foregroundColor: Colors.black,
      centerTitle: true,
      title: Column(
        children: [
          Text( products?.name?? "",style: GoogleFonts.poppins(
          textStyle: TextStyle(
          color: Colors.black54,
              fontSize: 15.sp ,
              fontWeight: FontWeight.w700),
                ),
              ),
          Text( "\$${products?.price?? ""}",style: GoogleFonts.poppins(
            textStyle: TextStyle(
                color: Colors.red,
                fontSize: 15.sp ,
                fontWeight: FontWeight.w700),
          ),
          ),
        ],
      ),
      leading: Icon(Icons.arrow_back_ios,color: Colors.red.shade700,),
      actions: [
        Icon(Icons.shopping_cart),
        SizedBox(width: 10.w,)
      ],),
        body: Padding(
    padding:  EdgeInsets.only(left: 10.w,right: 10.w),
    child: ListView(children: [
      CachedNetworkImage( imageUrl: products?.image ?? "",
      progressIndicatorBuilder: (_,__,progress)=> Padding(
        padding: EdgeInsets.only(left:100.w,right: 100.w,),
          child: CircularProgressIndicator(
            color: Colors.red.shade700,
          )),),

          SizedBox( width: 200.w,
            height: 100.h,
            child: Center(
              child:
              ListView.separated(
                  padding: EdgeInsets.zero,
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  itemBuilder: (context,index){
                    return
                      TextButton(
                        onPressed: (){
                          cubit.onchange(index);
                        }, child:Text(cubit.texts[index],style: TextStyle(
                        color: cubit.selectedIndix == index?

                        Colors.red[700]:
                        Colors.black54,fontWeight: FontWeight.bold),));
                  }, separatorBuilder: (context,index)=>SizedBox(width: 10.w,), itemCount: cubit.texts.length),
            ),
          ),
          SizedBox(height: 10.h,),
      Text("Select Color",style: TextStyle(
          color:
          Colors.black54
          ,fontWeight: FontWeight.bold),),
          SizedBox( height: 70.h,
              child:
              ListView.separated(
                  padding: EdgeInsets.zero,
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context,index){
                    return  InkWell(
                        onTap:(){
                          cubit.onchangeColor(index);
                           selectedColorCallBack.call(products?.colorsSelect?[index] ??0);
                           cubit.updateSelectedColor(products?.colorsSelect?[index] ?? 0);
                            selectedColorCallBack.call(products?.colorsSelect?[index] ?? 0);
    },
                        child:
                        cubit.selectedIndixColor==index?
                        Padding(
                          padding: EdgeInsets.all(10.r),
                          child: Stack( children:[
                            CircleAvatar(radius: 20.r,
                              backgroundColor:Color(products?.colorsSelect?[index] ?? 4279308562 ),
                              child: CircleAvatar(radius: 25.r,
                                backgroundColor: Colors.transparent,
                                child: Icon(Icons.check_circle_outline_outlined,color: Colors.red,),
                              ),),],),
                        ):
                        CircleAvatar(radius: 20.r,
                            backgroundColor:
                            Color(products?.colorsSelect?[index] ?? 4279308562 ))

                    );
                  },
        separatorBuilder:  (context,index){ return SizedBox(width: 20.w,);},
                  itemCount: products?.colorsSelect?.length ??0),

          ),

      Text("Select Size",style: TextStyle(
          color:
          Colors.black54
         ,fontWeight: FontWeight.bold),),
      SizedBox(height: 20.h,),
          SizedBox( height: 30.h,
              child:
              ListView.separated(
                  padding: EdgeInsets.zero,
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context,index){
                    return InkWell(
                      onTap: (){
                        cubit.onchangeSize(index);
                        selectedSizeCallBack.call(products?.size?[index] ??0);
                        cubit.updateSelectedSize(products?.size?[index] ?? 0);
                          selectedSizeCallBack.call(products?.size?[index] ??0);
                      },
                      child:
                      // cubit.selectedIndixSize ==index?
                      //
                      // Stack( children:[
                      //   Container(
                      //       padding: EdgeInsets.zero,
                      //       margin: EdgeInsets.zero,
                      //       width: 70.w,height: 60.h,
                      //       decoration: BoxDecoration(borderRadius: BorderRadius.circular(10.r),color: Colors.white),
                      //       child: Center(
                      //         child: Text(
                      //           '${products?.size?[index] ??""}',style: const TextStyle(height: 0,fontWeight: FontWeight.bold,color: Colors.black54),),
                      //       )),
                      //   Padding(
                      //     padding: EdgeInsets.only(left: 20.w),
                      //     child: CircleAvatar(radius: 15.r,
                      //       backgroundColor: Colors.transparent,
                      //       child: Icon(Icons.check_circle_outline_outlined,color: Colors.black45,),
                      //     ),
                      //   ),],):
                      Container(
                          padding: EdgeInsets.zero,
                          margin: EdgeInsets.zero,
                          width: 70.w,height: 10.h,
                          decoration: BoxDecoration(borderRadius: BorderRadius.circular(10.r),color: Colors.white),
                          child: Center(
                            child: Text(
                              '${products?.size?[index] ??""}',style: const TextStyle(height: 0,fontWeight: FontWeight.bold,color: Colors.black54),),
                          )),
                    );
                  }, separatorBuilder:  (context,index){ return SizedBox(width: 20.w,);},
                  itemCount: products?.size?.length ??0),

          ),
      SizedBox(height: 40.h,),
      Row(children: [
        ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor:
            Colors.white,
                elevation: 2,
                maximumSize: Size(160.w, 60.h),
                minimumSize: Size(150.w, 50.h)
            ),
            onPressed: (){
            }, child: Row(children: [
          Text('Share this',
            style: GoogleFonts.poppins(
              textStyle: TextStyle(
                  color: Colors.black54,
                  fontSize: 12.sp,
                  fontWeight: FontWeight.bold),
            ),),
          Spacer(),
          CircleAvatar(
              radius: 12,
              backgroundColor: Colors.black54,
              child: Icon(Icons.arrow_upward,color: Colors.white,size: 10.r,))


        ],
        )),
        SizedBox(width: 15.w,),
        ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor:
            Colors.red[400],
                elevation: 5,
                maximumSize: Size(160.w, 60.h),
                minimumSize: Size(150.w, 50.h)
            ),
            onPressed: () {
              cubit.addToCart(index);
             Dialogs.materialDialog(
                color: Colors.white,
                  context: context,
                  actions: [
                     Column(children: [
                        Image.asset('assets/circle_tick_check_mark_paint_brush_stroke.png',fit: BoxFit.fitWidth,),
                       SizedBox(height: 20.h,),
                       Text('Added Successfully',
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
                // QuickAlert.show(
                //     context: context, type: QuickAlertType.success, title: "Added successfully" );
              
            }, child: Row(children: [
          Text('Add to cart',
            style: GoogleFonts.poppins(
              textStyle: TextStyle(
                  color: Colors.white,
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w600),
            ),),
          Spacer(),
          CircleAvatar(
              radius: 12.r,
              backgroundColor: Colors.white,
              child: Icon(Icons.arrow_forward_ios,color: Colors.red[700],size: 10.r,))


        ],
        )),
      ],)
    ],),
        ),



        );
        }, listener: (context,state){
    if (state is GetProductsLoading){
      Center(child: CircularProgressIndicator(),);}
    else if (
    state is GetProductsError){
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("something error")));
    }


        }));
  }
}
