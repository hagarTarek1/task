import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task/view%20model/cubit/home-cubit.dart';
import 'package:task/view%20model/cubit/home_state.dart';

class SelectSize extends StatelessWidget {
  final index;
  const SelectSize({required this.index,Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit,HomeState>(builder: (context,state){
      return Container(
        padding: EdgeInsets.zero,
       margin: EdgeInsets.zero,
       
       width: 70,height: 1,
       decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),color: Colors.white),
        child: Center(child: Text(
            HomeCubit.get(context).sizes[index],style: TextStyle(height: 0,fontWeight: FontWeight.bold,color: Colors.black54),)),
      );
    }, listener: (context,state){});
  }
}
