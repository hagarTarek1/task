import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:overlay_support/overlay_support.dart';
import 'package:task/view%20model/cubit/authCubit/authcubit.dart';
import 'package:task/view%20model/cubit/home-cubit.dart';
import 'package:task/view/screens/splashScreen.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(

      providers: [
        BlocProvider(create: (context) => HomeCubit()..getDataAds()..getDataCategory()..getDataProducts()..getDataAllCategories()..getDataClothes()..getDataBeauty()..getDataFurniture()..fetchOrders()),
        BlocProvider(create: (context) => AuthCubit()),
        ],
      child: ScreenUtilInit( designSize: const Size(360, 690),
    minTextAdapt: true,
    splitScreenMode: true,
    builder: (context , child) {
        return OverlaySupport.global(
            child:MaterialApp(
          debugShowCheckedModeBanner: false,
              home: SplashScreen(),
    ));}));
  }
}


