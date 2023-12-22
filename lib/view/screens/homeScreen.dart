import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task/classes/carousel.dart';
import 'package:task/model/categorymodel.dart';
import 'package:task/view%20model/cubit/home-cubit.dart';
import 'package:task/view%20model/cubit/home_state.dart';
import 'package:task/view/components/products.dart';

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
          backgroundColor: Colors.grey[300],
          body:
          ListView(
            children: [
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
              SizedBox( height: 170,
                child: ListView.separated(
                  padding: EdgeInsets.only(left: 10),
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    itemBuilder: (context,index){
                  return AllProducts(categories: cubit.categories?[index],);
                }, separatorBuilder: (context,index){
                  return SizedBox(width: 15,);
                }, itemCount: cubit.categories?.length ?? 0)
              ),

        ],
          )
      );
    }, listener: (context,state){

    });
  }
}
