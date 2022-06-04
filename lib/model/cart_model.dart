import 'package:food_delivery/model/product_list.dart';
import 'package:food_delivery/model/product_model.dart';

class CartModel{
  int subTotal;
  int total;
  int quantity;
  ProductListResponse product;
  CartModel({required this.subTotal,required this.total, required this.quantity, required this.product});

  factory CartModel.fromJSON(data){
    return CartModel(
        subTotal: data["subTotal"],
        total: data["total"],
        quantity: data["quantity"],
        product: ProductListResponse.fromJson(data["product"])
    );
  }

  static Map<String,dynamic> toJSON(CartModel model){
    return {
      "subTotal":model.subTotal,
      "total":model.total,
      "quantity":model.quantity,
      "product":ProductListResponse.toJSON(model.product),
    };
  }

}