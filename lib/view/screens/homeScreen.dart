import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:task/classes/carousel.dart';
import 'package:task/model/categorymodel.dart';
import 'package:task/view%20model/cubit/home-cubit.dart';
import 'package:task/view%20model/cubit/home_state.dart';
import 'package:task/view/components/categories.dart';

import '../components/products.dart';


class HomeScreen extends StatelessWidget {
   HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var cubit=HomeCubit.get(context);
    return BlocConsumer<HomeCubit,HomeState>(builder: (context,state){
      return
      state is DataLoading?
        Center(child: CircularProgressIndicator(),):
        Scaffold(
          appBar: AppBar(elevation: 0,
          toolbarHeight: 40,
          automaticallyImplyLeading: false,
          actions: [Icon(Icons.mode_comment_outlined),
          SizedBox(width: 15.w,),
          Icon(Icons.notification_add_outlined),
            SizedBox(width: 10.w,),],),
          backgroundColor: Colors.grey[50],
          body:
          ListView(
            children: [
              Padding(
                padding: EdgeInsets.only(left: 15.w,bottom: 10.h),
                child: Text("Categories",style: GoogleFonts.poppins(
                  textStyle: TextStyle(
                      color: Colors.black,
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w700),
                ),),
              ),

              SizedBox(
                height: 120.h,
                  child: ListView.separated(
                  padding: EdgeInsets.only(left: 10.w),
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  itemBuilder: (context,index){
                    return CategoriesDetails(categories: cubit.categories?[index], index: index,);

                  }, separatorBuilder: (context,index){
                return SizedBox(width: 15.w,);
              }, itemCount: cubit.categories?.length ?? 0)),
              Padding(
                padding: EdgeInsets.only(left: 15.w),
                child: Text("Latest",style: GoogleFonts.poppins(
                  textStyle: TextStyle(
                      color: Colors.black,
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w700),
                ),),),
              CarouselSlider.builder(itemCount:
               cubit.adsList?.length ?? 0,
        itemBuilder: (context,itemIndex, realIndex){
          return CarouselDetail(ads:

           cubit.adsList?[itemIndex] ?? Ads()

          );


        }
          , options: CarouselOptions(
                  viewportFraction: 1
                  ,
                  autoPlayAnimationDuration: const Duration(milliseconds: 100),
                  autoPlay: true,
                  enlargeCenterPage: true,
                ),
              ),
              SizedBox(height: 20,),
              SizedBox(
                height: 180,
                child: ListView.separated(
                  padding: EdgeInsets.only(left: 10.w),
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    itemBuilder: (context,index){
                  return AllProducts(products: cubit.products?[index], index: index,);
                }, separatorBuilder: (context,index){
                  return SizedBox(width: 15.w,);
                }, itemCount: cubit.products?.length ?? 0)
              ),

        ],
          )
      );
    }, listener: (context,state){
    if (state is GetProductsLoading){
        Center(child: CircularProgressIndicator(),);}
    else if (
        state is GetProductsError){
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("something error")));
    }
    if (state is GetAdsLoading){
      Center(child: CircularProgressIndicator(),);}
    else if (
    state is GetAdsError){
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("something error")));
    }
    if (state is GetProductsLoading){
      Center(child: CircularProgressIndicator(),);}
    else if (
    state is GetProductsError){
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("something error")));
    }
    });
  }
}
