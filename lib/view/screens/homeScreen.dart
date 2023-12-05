import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task/classes/carousel.dart';
import 'package:task/model/categorymodel.dart';
import 'package:task/view%20model/cubit/home-cubit.dart';
import 'package:task/view%20model/cubit/home_state.dart';

class HomeScreen extends StatelessWidget {
   HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var cubit=HomeCubit.get(context);
    BlocProvider.value(value: HomeCubit.get(context)..getData());
    return BlocConsumer<HomeCubit,HomeState>(builder: (context,state){
      return Scaffold(body:
          ListView(
            children: [
              CarouselSlider.builder(itemCount: cubit.categoriesModel?.ads?.length ?? 0,
        itemBuilder: (context,itemIndex, realIndex){
          return CarouselDetail(ads:

           cubit.categoriesModel?.ads?[itemIndex] ?? Ads()
          );


        }
          , options: CarouselOptions(
                  viewportFraction: 1
                  ,
                  autoPlayAnimationDuration: const Duration(milliseconds: 100),
                  autoPlay: false,
                  enlargeCenterPage: true,
                ),
              ),
        ],
          )
      );
    }, listener: (context,state){});
  }
}
