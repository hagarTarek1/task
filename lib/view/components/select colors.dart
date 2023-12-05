import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task/view%20model/cubit/home-cubit.dart';
import 'package:task/view%20model/cubit/home_state.dart';

class SelectedColor extends StatelessWidget {
  final index;
  const SelectedColor({required this.index,Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit,HomeState>(
    builder:(context,state){
      return
      // HomeCubit.get(context).onselected?
       CircleAvatar(radius: 20,
      backgroundColor: HomeCubit.get(context).colors[index]);
          // :
          // Stack(children: [
          //   CircleAvatar(radius: 20,
          //       backgroundColor: HomeCubit.get(context).colors[index]),
          //   Icon(Icons.check_circle_outline_outlined)
          // ],);
      }
    , listener: ( context,state) {},);}
  
  }

