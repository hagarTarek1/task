import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:task/view%20model/cubit/home-cubit.dart';
import 'package:task/view%20model/cubit/home_state.dart';
import 'package:task/view/components/select%20size.dart';

import '../components/select colors.dart';


class ProductDetailsScreen extends StatelessWidget {
  const ProductDetailsScreen ({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var cubit=HomeCubit.get(context);
    return BlocConsumer<HomeCubit,HomeState>(builder:(context,state){return
    Scaffold( backgroundColor: Colors.grey[100],
      extendBody: true,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: Colors.black,
        centerTitle: true,
        title: Text('Faux Sued Ankle Boots',style: GoogleFonts.poppins(
        textStyle: TextStyle(
        color: Colors.black54,
            fontSize: 15 ,
            fontWeight: FontWeight.w700),
      ),
    ),
        leading: Icon(Icons.arrow_back_ios,color: Colors.red.shade700,),
        actions: [
          Icon(Icons.shopping_cart),
          SizedBox(width: 10,)
        ],),
    body: Padding(
      padding: const EdgeInsets.only(left: 10),
      child: ListView(children: [
      CarouselSlider(
      options: CarouselOptions(
      autoPlay: true,
        enlargeCenterPage: true,
        viewportFraction: .9,
      ),
        items: HomeCubit.get(context).images,),
        // Row(crossAxisAlignment: CrossAxisAlignment.center,
        // mainAxisAlignment: MainAxisAlignment.center,
        // children: [
        //   TextButton(
        //       onPressed: (){}, child:Text('Product')),
        //   TextButton(onPressed: (){}, child:Text('Details')),
        //   TextButton(onPressed: (){}, child:Text('Reviews'))
        // ],)
        SizedBox( width: 200,
          height: 100,
          child: Center(
            child: ListView.separated(
              padding: EdgeInsets.zero,
              scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                itemBuilder: (context,index){
              return  TextButton(
                  onPressed: (){
                    cubit.onchange(index);
              }, child:Text(cubit.texts[index],style: TextStyle(
                  color:
                      cubit.onselected?
                  Colors.black54:
                  Colors.red[700],fontWeight: FontWeight.bold),));
            }, separatorBuilder: (context,index)=>SizedBox(width: 10,), itemCount: cubit.texts.length),
          ),
        ),
        Text("Select Color",style: GoogleFonts.poppins(
      textStyle: TextStyle(
      color: Colors.black26,
      fontSize: 18 ,
      fontWeight: FontWeight.w600),)),
        SizedBox( height: 100,
            child: ListView.separated(
                padding: EdgeInsets.only(left: 10),
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                itemBuilder: (context,index){
                  return InkWell( onTap: (){
                    cubit.onchange(index);
                  },
                      child: SelectedColor(index: index));
                }, separatorBuilder: (context,index){
              return SizedBox(width: 20,);
            }, itemCount: cubit.colors.length)
        ),
        Text("Select Size",style: GoogleFonts.poppins(
          textStyle: TextStyle(
              color: Colors.black26,
              fontSize: 18 ,
              fontWeight: FontWeight.w600),)),
        SizedBox(height: 10,),
        SizedBox( height: 40,
            child: ListView.separated(
                padding: EdgeInsets.only(left: 10),
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                itemBuilder: (context,index){
                  return InkWell( onTap: (){
                    cubit.onchange(index);
                  },
                      child: SelectSize(index: index,));
                }, separatorBuilder: (context,index){
              return SizedBox(width: 20,);
            }, itemCount: cubit.sizes.length)
        ),
        SizedBox(height: 50,),
        Row(children: [
          ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor:
              Colors.white,
                  elevation: 2,
                  maximumSize: Size(180, 60),
                  minimumSize: Size(150, 50)
              ),
              onPressed: (){
              }, child: Row(children: [
            Text('Share this',
              style: GoogleFonts.poppins(
                textStyle: TextStyle(
                    color: Colors.black54,
                    fontSize: 17,
                    fontWeight: FontWeight.bold),
              ),),
            Spacer(),
            CircleAvatar(
                radius: 16,
                backgroundColor: Colors.black54,
                child: Icon(Icons.arrow_upward,color: Colors.white,size: 25,))


          ],
          )),
          SizedBox(width: 15,),
          ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor:
              Colors.red[400],
                  elevation: 5,
                  maximumSize: Size(180, 60),
                  minimumSize: Size(150, 50)
              ),
              onPressed: (){
              }, child: Row(children: [
            Text('Add to cart',
              style: GoogleFonts.poppins(
                textStyle: TextStyle(
                    color: Colors.white,
                    fontSize: 17,
                    fontWeight: FontWeight.w600),
              ),),
            Spacer(),
            CircleAvatar(
                radius: 15,
                backgroundColor: Colors.white,
                child: Icon(Icons.arrow_forward_ios,color: Colors.red[700],size: 22,))


          ],
          )),
        ],)
      ],),
    ),



    );
    }, listener: (context,state){});
  }
}
