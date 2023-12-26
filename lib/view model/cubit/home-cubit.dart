import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task/model/categorymodel.dart';
import 'package:task/view%20model/cubit/home_state.dart';
import 'package:task/view/screens/cart-page.dart';
import 'package:task/view/screens/homeScreen.dart';
import 'package:task/view/screens/profile-page.dart';
import 'package:task/view/screens/signup.dart';
import '../../view/screens/forgetpassword.dart';
import '../../view/screens/loginScreen.dart';

class HomeCubit extends Cubit<HomeState>{
  HomeCubit():super(InitState()) ;
  static HomeCubit get(context)=> BlocProvider.of<HomeCubit>(context);
  PageController controller=PageController();
  static var formState=GlobalKey<FormState>();
  static var formState2=GlobalKey<FormState>();
  TextEditingController emailController= TextEditingController();
  TextEditingController passController= TextEditingController();
  TextEditingController userController= TextEditingController();
  List<Color> colorsList=[
     Colors.orangeAccent,
    Colors.blueAccent,
     Colors.green,
  ];
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
int currentindex=0;
List pages=[HomeScreen(),CartScreen(),const Profile()];
changeCurrentIndex(i){
 i=currentindex;
 emit(ChangeSuccess());
}
bool onselected=false;
onchange(int index){
  onselected=!onselected;
  emit(OnChange());
}

  onPageChanged (num){
    num=current;
    emit(OnChange());
    }
    signUp() async {
      try{
        emit(SignUpLoading());
        UserCredential user =await FirebaseAuth.instance.createUserWithEmailAndPassword(email: emailController.text, password: passController.text,);
        emit(SignUpSuccess());
      } catch (e){
        print(e);
        emit(SignUpError());
      }
    }

    logIn() async {
      try{
        emit(LoginLoading());
        UserCredential user = await FirebaseAuth.instance.signInWithEmailAndPassword(email: emailController.text, password: passController.text);
        emit(LoginSuccess());
      }
      catch (e){
        print(e);
        emit(LoginError());
      }}
      logOut()  {
        UserCredential user =  FirebaseAuth.instance.signOut() as UserCredential;
      }

  CategoriesModel? categoriesModel;
  List<Categories>? categories =[];
  Future getDataCategory ()async {
    try{
      emit(GetCategoriesLoading());
      QuerySnapshot<Map<String,dynamic>> result=await FirebaseFirestore.instance.collection("categories").get();
    categories=List<Categories>.from(result.docs.map((e) => Categories.fromJson(e.data(),e.id)));
    emit(GetCategoriesSuccess());}
        catch(e){
      print(e.toString());
      emit(GetCategoriesError());
        }
  }
 
  // QuerySnapshot<Map<String,dynamic>> result=await FirebaseFirestore.instance.collection("categories").get();
  // categories=List<Categories>.from(result.docs.map((e) => Categories.fromJson(e.data(),e.id)));
  // emit(GetCategoriesSuccess());
  List<Ads>? adsList =[];
  Future getDataAds ()async {
    try{
      emit(GetAdsLoading());
  QuerySnapshot<Map<String,dynamic>> result=await FirebaseFirestore.instance.collection("ads").get();
  adsList=List<Ads>.from(result.docs.map((e) => Ads.fromJson(e.data(),e.id)));
  emit(GetAdsSuccess());}
        catch(e){
      print(e.toString());
      emit(GetAdsError());
        }
}
  List<Products>? products =[];
  Future getDataProducts ()async {
    try {
      emit(GetProductsLoading());
      QuerySnapshot<Map<String, dynamic>> result = await FirebaseFirestore
          .instance.collection("products").get();
      products = List<Products>.from(
          result.docs.map((e) => Products.fromJson(e.data(), e.id)));
      emit(GetProductsSuccess());
    }
    catch (e) {
      print(e.toString());
      emit(GetProductsError());
    }
  }
}


//   Future<void> getData()async{
//     // await Future.delayed(const Duration(seconds: 1));
//        try{
//          emit(DataLoading());
//     var response=await rootBundle.loadString('assets/data.json');
//     var value=jsonDecode(response);
//     categoriesModel=CategoriesModel.fromJson(value);
//     print(categoriesModel);
//     emit(DataSuccess()); }
//     catch(e){
//       print(e);
//       emit(DataError());}}
// }
//
