import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task/model/categorymodel.dart';
import 'package:task/view%20model/cubit/home_state.dart';
import 'package:task/view/screens/signup.dart';
import '../../view/screens/forgetpassword.dart';
import '../../view/screens/loginScreen.dart';

class HomeCubit extends Cubit<HomeState>{
  HomeCubit():super(InitState()) ;
  static HomeCubit get(context)=> BlocProvider.of<HomeCubit>(context);
  PageController controller=PageController();
  TextEditingController emailController= TextEditingController();
  TextEditingController passController= TextEditingController();
  TextEditingController userController= TextEditingController();
  List<Widget> list=<Widget>[
    LoginScreen(),
     Signup(),
    ForgetPassword()
  ];

  int current=0;

  onPageChanged (num){
    num=current;
    emit(OnChange());
    }
  CategoriesModel? categoriesModel;

  Future<void> getData()async{
    await Future.delayed(const Duration(seconds: 2));
       try{
    var response=await rootBundle.loadString('assets/data.json');
    var value=jsonDecode(response);
    categoriesModel=CategoriesModel.fromJson(value);
    print(categoriesModel);
    emit(DataSuccess()); }
    catch(e){
      print(e);
      emit(DataError());}}
}
//
