

class CategoriesModel {
  List<Products>? products;
  List<Categories>? categories;
  List<Ads>? ads=[];
  List <AllCategories>? allCategories;

  CategoriesModel({this.products, this.categories, this.ads,this.allCategories});

  CategoriesModel.fromJson(Map<String, dynamic> json, String id) {

  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (categories != null) {
      data['categories'] = categories!.map((v) => v.toJson()).toList();
    }
    data['ads'] = ads!.map((v) => v.toJson()).toList();
      return data;
  }
}

class Products {
  String? id;
  String? image;
  String? name;
  String? categoryId;
  String? description;
  int? price;
  int? quantity;
  List<Choose>? choose;
  List? colorsSelect=[];
  List? size=[];


  Products(
      {this.id,
        this.name,
        this.categoryId,
        this.description,
        this.price,
        this.quantity,
        this.choose,
        this.colorsSelect,
        this.size,
      this.image});

  Products.fromJson(Map<String, dynamic> json, String docId) {
    id = docId;
    name = json['name'];
    image = json['image'];
    categoryId = json['categoryId'];
    description = json['description'];
    price = json['price'];
    quantity = json['quantity'];
    choose = json['choose'];
    colorsSelect=json['colorsSelect'];
    size=json['size'];

  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['image'] = image;
    data['name'] = name;
    data['categoryId'] = categoryId;
    data['description'] = description;
    data['price'] = price;
    data['quantity'] = quantity;
    data['choose'] = choose;
    data['colorsSelect'] = colorsSelect;
    data['size'] = size;

return data;
  }
}
class Choose {
  String? id;
  List? colors;
  List? size;
  Choose({this.id, this.size, this.colors});


  Choose.fromJson(Map<String, dynamic> json, String docId) {
    id = docId;
    size = json['size'];
   colors = json['colors'];
  }

}

class Categories {
  String? id;
  String? image;
  String? title;
  String? description;

  Categories({this.id, this.title, this.description,this.image});

  Categories.fromJson(Map<String, dynamic> json, String docId) {
    id = docId;
    image=json['image'];
    title = json['title'];
    description = json['description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['image'] = image;
    data['title'] = title;
    data['description'] = description;
    return data;
  }
}
class AllCategories {
  String? id;
  String? image;
  String? name;
  List <Clothes>? clothes;
  List <Beauty>? beauty;
  List <Furniture>? furniture;


  AllCategories({this.id, this.name, this.image,this.clothes,this.beauty,this.furniture});

  AllCategories.fromJson(Map<String, dynamic> json, String docId) {
    id = docId;
    image=json['image'];
    name = json['name'];
    clothes=json['clothes'];

  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['image'] = image;
    data['name'] = name;
    data['clothes'] = clothes;

    return data;
  }
}
class Clothes {
  String? id;
  String? kind;
  List ?contains = [];

  Clothes({this.id, this.kind, this.contains});


  Clothes.fromJson(Map<String, dynamic> json, String docId) {
    id = docId;
    kind = json['kind'];
    contains = json['contains'];
  }
}
  class Beauty {
  String? id;
  List ?contains=[];
  String? kind;
  Beauty({this.id,this.contains,this.kind});


  Beauty.fromJson(Map<String, dynamic> json, String docId) {
  id = docId;
  contains=json['contains'];
  kind = json['kind'];

  }

  Map<String, dynamic> toJson() {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['id'] = id;
  data['contains'] = contains;
  data['kind'] = kind;

  return data;
  }
  }
class Furniture {
  String? id;
  List ?contains=[];
  String? kind;
 Furniture({this.id, this.contains,this.kind});


 Furniture.fromJson(Map<String, dynamic> json, String docId) {
    id = docId;
    contains=json['contains'];
    kind = json['kind'];

  } }


class Ads {
  String? id;
  String? image;
  String? text;

  Ads({this.id, this.image, this.text});

  Ads.fromJson(Map<String, dynamic> json, String docId) {
    id = docId;
    image = json['image'];
    text = json['text'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['image'] = image;
    data['text'] = text;
    return data;
  }
}
class Cart {
List<CartItem>? items=[];

Cart();

Cart.fromJson(Map<String, dynamic> data) {
items = data['items'] != null
? List.from(data['items'].map((e) => CartItem.fromJson(e)))
    : [];
}

Map<String, dynamic> toJson() => {
  "items": items?.map((e) => e.toJson()),
};
}

class CartItem {
  // String? itemId;
  String? name;
  String? image;
  String? productId;
  int? quantity;
  int? price;
  int? selectColor;
  int? selectSize;

  CartItem(this.name,this.image,this.quantity,this.price);

  CartItem.fromJson(Map<String, dynamic> data,) {
    // itemId = data['itemId'];
    image = data['image'];
    productId = data['productId'];
    quantity = data['quantity'];
    selectColor = data['selectColor'];
    selectSize = data['selectSize'];
    price = data['price'];
    name = data['name'];

  }

  Map<String, dynamic> toJson() => {
    // "itemId": itemId,
    "productId": productId,
    "quantity": quantity,
    "selectSize": selectSize,
    "selectColor": selectColor,
    "image": image,
    "price": price,
    "name": name,
  };
}
class AllOrder {
  List<Orders>? orders=[];

  AllOrder();

  AllOrder.fromJson(Map<String, dynamic> data) {
    orders = data['orders'] != null
        ? List.from(data['orders'].map((e) => Orders.fromJson(e)))
        : null;
  }

  Map<String, dynamic> toJson() => {
    "orders": orders?.map((e) => e.toJson()).toList(),
  };
}

class Orders {
  String? name;
  String? image;
  int? price;
  int? selectColor;
  int? selectSize;


  Orders(this.name, this.image, this.price);

  Orders.fromJson(Map<String, dynamic> data) {
    image = data['image'];
    price = data['price'];
    name = data['name'];
    selectColor = data['selectColor'];
    selectSize = data['selectSize'];
  }

  Map<String, dynamic> toJson() => {
    "image": image,
    "price": price,
    "name": name,
    "selectSize": selectSize,
    "selectColor": selectColor,
  };
}