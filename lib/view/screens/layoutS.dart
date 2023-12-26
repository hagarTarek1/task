import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task/view%20model/cubit/home-cubit.dart';
import 'package:task/view%20model/cubit/home_state.dart';
class LayOutScreen extends StatelessWidget {
  const LayOutScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit,HomeState>(builder: (context,state){
      var cubit = HomeCubit.get(context);
      return Scaffold(
        body: cubit.pages[cubit.currentindex],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex:cubit.currentindex,
          onTap: (i) {
            cubit.changeCurrentIndex(i);
          },
          backgroundColor: Colors.grey.shade200,
          type: BottomNavigationBarType.fixed,
          selectedIconTheme: IconThemeData(color: Colors.red.shade700),
          unselectedFontSize: 18,
          unselectedItemColor: Colors.black,
          unselectedLabelStyle:
          TextStyle(color: Colors.black, fontSize: 14.sp),
          selectedItemColor:Colors.red.shade700,
          items: [
            BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
                color: Colors.black,
              ),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.shopping_cart,
                color: Colors.black,
              ),
              label: 'cart',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.person,
                color: Colors.black,
              ),
              label: 'profile',
            ),
          ],),
      );
    }, listener:(context,state){});
  }
}
