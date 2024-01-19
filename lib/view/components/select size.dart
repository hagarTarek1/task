import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task/model/categorymodel.dart';
import 'package:task/view%20model/cubit/home-cubit.dart';
import 'package:task/view%20model/cubit/home_state.dart';

class SelectSize extends StatelessWidget {
  final index;
  Choose? choose;
  SelectSize({required this.index,required this.choose,Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var cubit=HomeCubit.get(context);
    return BlocConsumer<HomeCubit,HomeState>(builder: (context,state){
      return  ListView.separated(
        padding: EdgeInsets.zero,
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context,index){
              return InkWell(
                onTap: (){
                  cubit.onchangeSize(index);
                },
                child:
                    cubit.selectedIndixSize ==index?
                    Stack( children:[
                      Container(
                          padding: EdgeInsets.zero,
                          margin: EdgeInsets.zero,
                          width: 70.w,height: 60.h,
                          decoration: BoxDecoration(borderRadius: BorderRadius.circular(10.r),color: Colors.white),
                          child: Center(
                            child: Text(
                              '${choose?.size?[index] ??""}',style: const TextStyle(height: 0,fontWeight: FontWeight.bold,color: Colors.black54),),
                          )),
                       Padding(
                         padding: EdgeInsets.only(left: 20.w),
                         child: CircleAvatar(radius: 15.r,
                            backgroundColor: Colors.transparent,
                            child: Icon(Icons.check_circle_outline_outlined,color: Colors.red.shade700,),
                          ),
                       ),],):
                Container(
                    padding: EdgeInsets.zero,
                    margin: EdgeInsets.zero,
                    width: 70.w,height: 10.h,
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(10.r),color: Colors.white),
                child: Center(
                  child: Text(
                    '${choose?.size?[index] ??""}',style: const TextStyle(height: 0,fontWeight: FontWeight.bold,color: Colors.black54),),
                )),
              );
            }, separatorBuilder:  (context,index){ return SizedBox(width: 20.w,);},
            itemCount: choose?.size?.length ??0);
    }, listener: (context,state){});
  }
}
