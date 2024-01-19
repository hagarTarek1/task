import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task/view%20model/cubit/home-cubit.dart';
import 'package:task/view%20model/cubit/home_state.dart';

import '../../model/categorymodel.dart';

// class  SelectedColor  extends StatelessWidget {
//   Choose? choose;
//   final int index;
//   final void Function(int) selectedColorCallBack;
//    SelectedColor ({ required this.selectedColorCallBack,
//      required this.choose,required this.index,Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return BlocConsumer<HomeCubit,HomeState>(builder: (context,state){
//       var cubit=HomeCubit.get(context);
//       return ListView.separated(
//           padding: EdgeInsets.zero,
//           shrinkWrap: true,
//           scrollDirection: Axis.horizontal,
//           itemBuilder: (context,index){
//             return  InkWell(
//               onTap:(){
//             cubit.onchangeColor(index);
//             selectedColorCallBack.call(cubit.chooses?[0].colors?[cubit.selectedIndixColor]);
//             print("selectedColor<<<$int");},
//               child:
//                   cubit.selectedIndixColor==index?
//                   Padding(
//                     padding: EdgeInsets.all(10.r),
//                     child: Stack( children:[
//                       CircleAvatar(radius: 20.r,
//                         backgroundColor:Color(choose?.colors?[index] ?? 4279308562 ),
//                         child: CircleAvatar(radius: 25.r,
//                           backgroundColor: Colors.transparent,
//                           child: Icon(Icons.check_circle_outline_outlined,color: Colors.red.shade700,),
//                         ),),],),
//                   ):
//               CircleAvatar(radius: 20.r,
//                   backgroundColor:
//                   Color(choose?.colors?[index] ?? 4279308562 ))
//
//             );
//           }, separatorBuilder:  (context,index){ return SizedBox(width: 20.w,);},
//           itemCount: choose?.colors?.length ??0);
//
//     }, listener: (context,state){});
//   }
// }

class  SelectedColor  extends StatelessWidget {
  Products? products;
  final int index;
  final void Function(int) selectedColorCallBack;
  SelectedColor ({ required this.selectedColorCallBack,
    required this.products,required this.index,Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit,HomeState>(builder: (context,state){
      var cubit=HomeCubit.get(context);
      return ListView.separated(
          padding: EdgeInsets.zero,
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context,index){
            return  InkWell(
                onTap:(){
                  cubit.onchangeColor(index);
                  // selectedColorCallBack.call(products?.colorsSelect?[index] ??0);
                  print("selectedColor<<<$int");},
                child:
                cubit.selectedIndixColor==index?
                Padding(
                  padding: EdgeInsets.all(10.r),
                  child: Stack( children:[
                    CircleAvatar(radius: 20.r,
                      backgroundColor:Color(products?.colorsSelect?[index] ?? 4279308562 ),
                      child: CircleAvatar(radius: 25.r,
                        backgroundColor: Colors.transparent,
                        child: Icon(Icons.check_circle_outline_outlined,color: Colors.red.shade700,),
                      ),),],),
                ):
                CircleAvatar(radius: 20.r,
                    backgroundColor:
                    Color(products?.colorsSelect?[index] ?? 4279308562 ))

            );
          }, separatorBuilder:  (context,index){ return SizedBox(width: 20.w,);},
          itemCount: products?.colorsSelect?.length ??0);

    }, listener: (context,state){});
  }
}



