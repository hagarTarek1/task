import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:task/view%20model/cubit/home-cubit.dart';
import 'package:task/view%20model/cubit/home_state.dart';
import 'package:task/model/categorymodel.dart';
class CarouselDetail extends StatelessWidget {
  Ads? ads;
   CarouselDetail({required this.ads,Key? key,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var cubit=HomeCubit.get(context);
    return BlocConsumer<HomeCubit,HomeState>(
      builder: (context,state){
        return
       Padding(
        padding: const EdgeInsets.all(20),
        child: Stack(

          children: [
                        ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.network(
               ads?.image ?? "",height: 500,width: 400,fit: BoxFit.cover,),
            ),
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 20,right: 90),
                  child: Text(ads?.text ?? "", style: GoogleFonts.poppins(
                    textStyle: TextStyle(
                        color: Colors.black26,
                        fontSize:15,
                        fontWeight: FontWeight.bold),),),
                ),

                Padding(
                  padding: const EdgeInsets.only(top: 70,right: 100,left: 10),
                  child: ElevatedButton(

                      style: ElevatedButton.styleFrom(backgroundColor:
                      Colors.white,
                          elevation: 2,
                          maximumSize: Size(110, 200),
                          minimumSize: Size(50, 30)
                      ),
                      onPressed: (){}, child: Row(children: [
                    Text('see more',
                      style: GoogleFonts.poppins(
                        textStyle: TextStyle(
                            color: Colors.black54,
                            fontSize: 9,
                            fontWeight: FontWeight.bold), ),),
                    Spacer(),
                    CircleAvatar(
                        radius: 8,
                        backgroundColor: Colors.red[700],
                        child: Icon(Icons.arrow_forward_ios,color: Colors.white,size: 8,))

                  ],)),
                ),
              ],
            ),

          ],
        ),
      );},
          listener: (context,state){},
    );
  }
}
