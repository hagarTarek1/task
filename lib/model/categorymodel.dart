class CategoriesModel {
  List<Products>? products;
  List<Categories>? categories;
  List<Ads>? ads=[];

  CategoriesModel({this.products, this.categories, this.ads});

  CategoriesModel.fromJson(Map<String, dynamic> json, String id) {

  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (products != null) {
      data['products'] = products!.map((v) => v.toJson()).toList();
    }
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
  int? prict;
  int? quantity;

  Products(
      {this.id,
        this.name,
        this.categoryId,
        this.description,
        this.prict,
        this.quantity,
      this.image});

  Products.fromJson(Map<String, dynamic> json, String docId) {
    id = docId;
    name = json['name'];
    image = json['image'];
    categoryId = json['categoryId'];
    description = json['description'];
    prict = json['prict'];
    quantity = json['quantity'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['image'] = image;
    data['name'] = name;
    data['categoryId'] = categoryId;
    data['description'] = description;
    data['prict'] = prict;
    data['quantity'] = quantity;
    return data;
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