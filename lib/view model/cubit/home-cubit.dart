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
List <Widget> images =[Image.network("https://contents.mediadecathlon.com/p2393865/k59e9499e49d170903fb3c71ddaf67c3a/sq/250x250/Mens-Running-Shoes-Jogflow-100.1-Red.jpg",width:double.infinity,fit: BoxFit.fitWidth),];
  List <Color> colors =[Colors.red,Colors.orange,Colors.blue,Colors.white,Colors.grey,Colors.black];
  List <String>sizes =["4.5","5.0","6.5","7.0","8.5"];
  List texts =['Product','Details','Reviews'];
int current=0;
bool onselected=false;
onchange(int index){
  onselected=!onselected;
  emit(OnChange());
}

  onPageChanged (num){
    num=current;
    emit(OnChange());
    }
  CategoriesModel? categoriesModel;

  Future<void> getData()async{
    // await Future.delayed(const Duration(seconds: 1));
       try{
         emit(DataLoading());
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
