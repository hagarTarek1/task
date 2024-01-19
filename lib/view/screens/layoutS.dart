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
          bottomNavigationBar: ClipRRect(
          borderRadius: BorderRadius.only(
          topLeft: Radius.circular(25.r),
      topRight: Radius.circular(25.r),
      ),
      child: BottomNavigationBar(
      currentIndex: cubit.currentindex,
      onTap: (i) {
      cubit.changeCurrentIndex(i);
      },
      backgroundColor: Colors.grey.shade50,
      type: BottomNavigationBarType.fixed,
      selectedIconTheme: IconThemeData(color: Colors.red.shade700),
      unselectedFontSize: 18,
      unselectedItemColor: Colors.black38,
        unselectedIconTheme: IconThemeData(color: Colors.black45),
      unselectedLabelStyle:
      TextStyle(color: Colors.black38, fontSize: 14.sp),
      selectedItemColor:Colors.red.shade700,

          items: [
            BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
              ),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.shopping_cart,
              ),
              label: 'cart',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.outbound_outlined,
              ),
              label: 'orders',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.person,
              ),
              label: 'profile',
            ),
          ],),
      ));
    }, listener:(context,state){});
  }
}
