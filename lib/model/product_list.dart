class Produc_List {
  List<ProductListResponse> datas;

  Produc_List({required this.datas});

  factory Produc_List.fromJson(Map<String, dynamic> json) {
    var list = json['datas'] as List;
    List<ProductListResponse> productL =
        list.map((data) => ProductListResponse.fromJson(data)).toList();
    return Produc_List(
      datas: productL,
    );
  }
}

class ProductListResponse {
  late String cat;
  late int id;
  late String product_name;
  late String iamge;
  late int price;
  late String description;
  late String restaurant;

  ProductListResponse(
      {required this.cat,
      required this.id,
      required this.description,
      required this.iamge,
      required this.price,
      required this.product_name,
      required this.restaurant});

  factory ProductListResponse.fromJson(Map<String, dynamic> json) {
    return ProductListResponse(
      id: json['id'] as int,
      cat: json['name'] as String,
      description: json['description'] as String,
      price: json['price'] as int,
      iamge: json['image_small'] as String,
      product_name: json['item_name'] as String,
      restaurant: json['res_name'] as String,
    );
  }
  static Map<String,dynamic> toJSON(ProductListResponse product){
    return {
      "id": product.id,
      "res_name": product.restaurant,
      "description": product.description,
      "price": product.price,
      "image_small": product.iamge,
      "cat_id": product.cat,
      "item_name": product.product_name,
    };
  }
}

class Category_List {
  List<CategoryListResponse> datas;

  Category_List({required this.datas});

  factory Category_List.fromJson(Map<String, dynamic> json) {
    var list = json['datas'] as List;
    List<CategoryListResponse> productL =
        list.map((data) => CategoryListResponse.fromJson(data)).toList();
    return Category_List(
      datas: productL,
    );
  }
}

class CategoryListResponse {
  late String cat;

  CategoryListResponse({required this.cat});

  factory CategoryListResponse.fromJson(Map<String, dynamic> json) {
    return CategoryListResponse(
      cat: json['name'] as String,
    );
  }
}
