import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:task/view%20model/cubit/home-cubit.dart';

import '../../view model/cubit/home_state.dart';

class LayOut extends StatelessWidget {
  const LayOut({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit,HomeState>(builder: (context,state){
      return Scaffold(
        body: PageView(
          scrollDirection: Axis.horizontal,
          physics: const BouncingScrollPhysics(),
          controller: HomeCubit.get(context).controller,
          onPageChanged: HomeCubit.get(context).onPageChanged(num),
          children:
          HomeCubit.get(context).list,
        ),
      );
    }, listener: (context,state){});
  }
}
