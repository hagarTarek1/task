
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:task/model/categorymodel.dart';
import 'package:task/view%20model/cubit/home_state.dart';
import 'package:task/view/screens/cart-page.dart';
import 'package:task/view/screens/homeScreen.dart';
import 'package:task/view/screens/orders.dart';
import 'package:task/view/screens/profile-page.dart';
import 'package:task/view/screens/signup.dart';
import '../../view/screens/forgetpassword.dart';
import '../../view/screens/loginScreen.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() :super(InitState());

  static HomeCubit get(context) => BlocProvider.of<HomeCubit>(context);
  PageController controller = PageController();

  List<Color> colorsList = [
    Colors.orangeAccent,
    Colors.blueAccent,
    Colors.green,
  ];
  List<Color> colorsListAll = [
    Colors.orangeAccent,
    Colors.blueAccent,
    Colors.green,
    Colors.purpleAccent,
    Colors.yellow,
  ];
  List<Widget> list = <Widget>[
    LoginScreen(),
    Signup(),
    ForgetPassword()
  ];
  List <Widget> images = [
    Image.network(
        "https://contents.mediadecathlon.com/p2393865/k59e9499e49d170903fb3c71ddaf67c3a/sq/250x250/Mens-Running-Shoes-Jogflow-100.1-Red.jpg",
        width: double.infinity, fit: BoxFit.fitWidth),
  ];

  List <int> colorsStore = [];

  // List <String>sizes =["4.5","5.0","6.5","7.0","8.5"];
  List texts = ['Product', 'Details', 'Reviews'];
  int current = 0;
  int currentindex = 0;
  List pages = [HomeScreen(), CartScreen(),OrderScreen(), const Profile()];
  int listIndex = 0;

  bool slowAnimations = false;

  changeCurrentIndex(i) {
    currentindex = i;
    emit(ChangeSuccess());
  }

  bool onselected = false;
  bool onselectedSize = false;
  int selectedIndix = 0;
  int selectedIndixColor = 0;
  int selectedIndixSize = 0;

  onchange(index) {
    selectedIndix = index;
    onselected = !onselected;
    emit(OnChange());
  }

  onchangeColor(index) {
    selectedIndixColor = index;
    onselected = !onselected;
    emit(OnChange());
  }

  onchangeSize(index) {
    selectedIndixSize = index;
    onselectedSize = !onselectedSize;
    emit(OnChange());
  }

  onPageChanged(num) {
    num = current;
    emit(OnChange());
  }

  changeCurrentIndexOfCategory(i) {
    listIndex = i;
    emit(ChangeSuccess());
  }

  updateSelectedColor(int color) {
    selectedIndixColor = color;
    emit(OnChange());
  }

  updateSelectedSize(int size) {
    selectedIndixSize = size;
    emit(OnChange());
  }

  CategoriesModel? categoriesModel;
  List<Categories>? categories = [];

  Future getDataCategory() async {
    try {
      emit(GetCategoriesLoading());
      QuerySnapshot<Map<String, dynamic>> result = await FirebaseFirestore
          .instance.collection("categories").get();
      categories = List<Categories>.from(
          result.docs.map((e) => Categories.fromJson(e.data(), e.id)));
      emit(GetCategoriesSuccess());
    }
    catch (e) {
      print(e.toString());
      emit(GetCategoriesError());
    }
  }

  List<AllCategories>? allCategories = [];

  Future getDataAllCategories() async {
    try {
      emit(GetAllCategoriesLoading());
      QuerySnapshot<Map<String, dynamic>> result = await FirebaseFirestore
          .instance.collection("allCategories").get();
      allCategories = List<AllCategories>.from(
          result.docs.map((e) => AllCategories.fromJson(e.data(), e.id)));
      emit(GetAllCategoriesSuccess());
    }
    catch (e) {
      print(e.toString());
      emit(GetAllCategoriesError());
    }
  }

  List <Clothes>? clothes = [];

  Future getDataClothes() async {
    try {
      emit(GetAllCategoriesLoading());
      QuerySnapshot<Map<String, dynamic>> result = await FirebaseFirestore
          .instance.collection("allCategories")
          .doc('H9H54C1KKsO1fCLceiHv')
          .collection('clothes')
          .get();
      clothes = List<Clothes>.from(
          result.docs.map((e) => Clothes.fromJson(e.data(), e.id)));
      emit(GetAllCategoriesSuccess());
    }
    catch (e) {
      print(e.toString());
      emit(GetAllCategoriesError());
    }
  }

  List <Beauty>? beauty = [];

  Future getDataBeauty() async {
    try {
      emit(GetAllCategoriesLoading());
      QuerySnapshot<Map<String, dynamic>> result = await FirebaseFirestore
          .instance.collection("allCategories")
          .doc('6n2dQyLPGL5Is0Dyvo7D')
          .collection('beauty')
          .get();
      beauty = List<Beauty>.from(
          result.docs.map((e) => Beauty.fromJson(e.data(), e.id)));
      emit(GetAllCategoriesSuccess());
    }
    catch (e) {
      print(e.toString());
      emit(GetAllCategoriesError());
    }
  }

  List <Furniture>? furniture = [];

  Future getDataFurniture() async {
    try {
      emit(GetAllCategoriesLoading());
      QuerySnapshot<Map<String, dynamic>> result = await FirebaseFirestore
          .instance.collection("allCategories")
          .doc('FVpcG6RbyiK4xYJwpbkQ')
          .collection('furniture')
          .get();
      furniture = List<Furniture>.from(
          result.docs.map((e) => Furniture.fromJson(e.data(), e.id)));
      emit(GetAllCategoriesSuccess());
    }
    catch (e) {
      print(e.toString());
      emit(GetAllCategoriesError());
    }
  }

  List<Ads>? adsList = [];

  Future getDataAds() async {
    try {
      emit(GetAdsLoading());
      QuerySnapshot<Map<String, dynamic>> result = await FirebaseFirestore
          .instance.collection("ads").get();
      adsList =
      List<Ads>.from(result.docs.map((e) => Ads.fromJson(e.data(), e.id)));
      emit(GetAdsSuccess());
    }
    catch (e) {
      print(e.toString());
      emit(GetAdsError());
    }
  }

  List<Products>? products = [];

  Future getDataProducts() async {
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

  Cart? cart;

  void createInstance() {
    cart = Cart();
    emit(CreateSuccess());
  }


  Future<void> addToCart(int i) async {
    try {
      emit(AddCartLoading());
      var result = await FirebaseFirestore.instance
          .collection("cart")
          .doc(FirebaseAuth.instance.currentUser?.email ?? "")
          .get();

      if (result.exists) {
        await FirebaseFirestore.instance
            .collection("cart")
            .doc(FirebaseAuth.instance.currentUser?.email ?? "")
            .update({
          'items': FieldValue.arrayUnion([
            {
              'image': products?[i].image,
              'name': products?[i].name,
              'price': products?[i].price,
              'quantity': 1,
              'selectColor': selectedIndixColor,
              'selectSize': selectedIndixSize,
              'productId': products?[i].id,
            }
          ])
        });
      } else {
        await FirebaseFirestore.instance
            .collection("cart")
            .doc(FirebaseAuth.instance.currentUser?.email ?? "")
            .set({
          'items': [
            {
              'image': products?[i].image,
              'name': products?[i].name,
              'price': products?[i].price,
              'quantity': 1,
              'selectColor': selectedIndixColor,
              'selectSize': selectedIndixSize,
              'productId': products?[i].id,
            }
          ]
        });
      }
      emit(AddCartSuccess());
    } catch (e) {
      print(e.toString());
      emit(AddCartError());
    }
  }

  List<CartItem>? carts;

  Future<void> fetchCartData() async {
    try {
      emit(FetchDataLoading());
      var result = await FirebaseFirestore.instance
          .collection("cart")
          .doc(FirebaseAuth.instance.currentUser?.email ?? "")
          .get();

      if (result.exists) {
        var data = result.data();
        if (data != null) {
          List<dynamic> items = data['items'] ?? [];
          carts = items.map((item) => CartItem.fromJson(item)).toList();
        }
      } else {
        carts = [];
      }

      if (carts != null) {
        emit(FetchDataSuccess());
      } else {
        emit(FetchDataEmpty());
      }
    } catch (e) {
      print("Error fetching cart data: $e");
      emit(FetchDataError());
    }
  }

  Stream<DocumentSnapshot<Map<String, dynamic>>> get cartStream =>
      FirebaseFirestore.instance
          .collection('cart')
          .doc(FirebaseAuth.instance.currentUser?.email ?? '')
          .snapshots();


  Future<void> deleteCartItem(int index) async {
    try {
      emit(DeleteCartItemLoading());

      if (carts != null && index >= 0 && index < carts!.length) {
        carts!.removeAt(index);
        emit(OnChange());
      }
      var result = await FirebaseFirestore.instance
          .collection("cart")
          .doc(FirebaseAuth.instance.currentUser?.email ?? "")
          .get();
      if (result.exists) {
        List<dynamic> items = result.data()?['items'] ?? [];
        items.removeAt(index);
        await FirebaseFirestore.instance
            .collection("cart")
            .doc(FirebaseAuth.instance.currentUser?.email ?? "")
            .update({
          'items': items,
        });
        emit(DeleteCartItemSuccess());
      }
    } catch (e) {
      print("Error deleting cart item: $e");
      emit(DeleteCartItemError());
    }
  }
  AllOrder? allOrder;

  void createInstance1() {
    allOrder=AllOrder();
    emit(CreateSuccess());
  }

  List<Orders>? orders;
  Future<void> moveCartToOrders() async {
    try {
      emit(OrderListLoading());
      var result = await FirebaseFirestore.instance
          .collection("cart")
          .doc(FirebaseAuth.instance.currentUser?.email ?? "")
          .get();

      if (result.exists) {
        var data = result.data();
        if (data != null) {
          List<dynamic> items = data['items'] ?? [];
          await FirebaseFirestore.instance
              .collection("cart")
              .doc(FirebaseAuth.instance.currentUser?.email ?? "")
              .update({
            'items': [],
          });

          await FirebaseFirestore.instance
              .collection("orders")
              .doc(FirebaseAuth.instance.currentUser?.email ?? "")
              .set({
            'orders': FieldValue.arrayUnion(items),
          });

          emit(OrderListSuccess());
        } else {
          emit(OrderListError());
        }
      } else {
        emit(OrderListError());
      }
    } catch (e) {
      print("Error moving cart items to orders: $e");
      emit(OrderListError());
    }
  }
  Future<void> fetchOrders() async {
    try {
      emit(OrdersLoading());
      var result = await FirebaseFirestore.instance
          .collection("orders")
          .doc(FirebaseAuth.instance.currentUser?.email ?? "")
          .get();

      if (result.exists) {
        var data = result.data();
        if (data != null) {
          List<dynamic> order = data['orders'] ?? [];
          orders = order.map((item) => Orders.fromJson(item)).toList();
        }
      } else {
        orders = [];
      }

      if (orders != null) {
        emit(OrdersSuccess());
      } else {
        emit(FetchDataEmpty());
      }
    } catch (e) {
      print("Error fetching cart data: $e");
      emit(OrdersError());
    }
  }

  double subtotal = 0.0;

  // Future<void> calculateTotal(Cart cart) async {
  //   if (products == null || products!.isEmpty) {
  //     emit(TotalCalculated());
  //     return;
  //   }
  //
  //   for (var item in cart.items!) {
  //     var product = products!.firstWhere(
  //           (product) => product.id == item.productId,
  //       orElse: () => Products(id: "", price: 0),
  //     );
  //
  //     subtotal += (product.price ?? 0) * (item.quantity ?? 0);
  //   }

    // emit(TotalCalculated());
  // }
  double calculateTotal(Cart cart) {
    double subtotal = 0;
    for (var item in cart.items!) {
      if (products?.isEmpty ?? true) return 0; // Return 0 if products is null or empty
      var product =
      products!.firstWhere((product) => product.id == item.productId,
          orElse: () => Products(id: "", price: 0));
      subtotal += (product.price ?? 0) * (item.quantity ?? 0);
    }
    return subtotal;
  }
}


