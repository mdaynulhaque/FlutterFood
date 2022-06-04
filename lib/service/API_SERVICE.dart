import 'dart:convert';

import 'package:food_delivery/model/loginModel.dart';
import 'package:food_delivery/model/product_list.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';

class API_SERVICE{

  static String baseurl="https://mobarok.me/api/";
  Future<Produc_List> ProductList() async {
    Produc_List data;
    String apiUrl = baseurl + "product/";
    try {
      var url = Uri.parse(apiUrl);
      var response = await http.get(url);
      if (response != null) {
      //  Map<String, dynamic> user = json.decode(response.body);
        if (response.statusCode!=200) {
          print("not 200");
        } else {
          var parsed = json.decode(response.body);
          print(parsed);
          data = Produc_List.fromJson(parsed);
          return data;
        }
      } else {
        print( "Response Faild try Again Later.");
      }
    } on Exception {
      rethrow;
    }
    return ProductList();
  }

  Future<Category_List> CategoryList() async {
    Category_List data;
    String apiUrl = baseurl + "category";
    try {
      var url = Uri.parse(apiUrl);
      var response = await http.get(url);
      if (response != null) {
        //  Map<String, dynamic> user = json.decode(response.body);
        if (response.statusCode!=200) {
          print("not 200");
        } else {
          var parsed = json.decode(response.body);
          data = Category_List.fromJson(parsed);
          return data;
        }
      } else {
        print( "Response Faild try Again Later.");
      }
    } on Exception {
      rethrow;
    }
    return CategoryList();
  }

  Future<Produc_List> ProductDetailsInfo(int id) async {
    Produc_List data;
    String apiUrl = baseurl + "details/"+id.toString();
    try {
      var url = Uri.parse(apiUrl);
      var response = await http.get(url);
      if (response != null) {
        //  Map<String, dynamic> user = json.decode(response.body);
        if (response.statusCode!=200) {
          print("not 200");
        } else {
          var parsed = json.decode(response.body);
          data = Produc_List.fromJson(parsed);
          return data;
        }
      } else {
        print( "Response Faild try Again Later.");
      }
    } on Exception {
      rethrow;
    }
    return ProductDetailsInfo(id);
  }

  // Future<ResponseModel> loginNow(String email,String pasword) async {
  //   ResponseModel data1=new ResponseModel(userinfo: [], message: "", status: "");
  //   String apiUrl = baseurl + "loginuser";
  //   try {
  //     Map data = {
  //       'email': email,
  //       'password': pasword,
  //     };
  //     print(data);
  //     final header = {
  //       'Content-type': 'application/json',
  //     };
  //     var url = Uri.parse(apiUrl);
  //     var response = await http.post(url,body:jsonEncode(data),headers: header);
  //     var parsed = json.decode(response.body);
  //     print(parsed);
  //     if (response != null) {
  //
  //
  //       if (response.statusCode!=200) {
  //         print("not 200");
  //       } else {
  //         var parsed = json.decode(response.body);
  //          data1 = ResponseModel.fromJson(parsed);
  //          print(data1);
  //         return data1;
  //       }
  //     } else {
  //       print( "Response Faild try Again Later.");
  //     }
  //   } on Exception {
  //     rethrow;
  //   }
  //   return ResponseModel(userinfo: data1.userinfo, message: data1.message, status: data1.status);
  // }
  static Future<ResponseModel> loginNow(Map<String,dynamic> formBody) async{
    ResponseModel responseModel;
    http.Response response =  await http.post(Uri.parse(baseurl+"loginuser"),headers:<String,String>{'Content-Type': 'application/json; charset=UTF-8',} , body: jsonEncode(formBody));
    if(response.statusCode==200){
      var data = jsonDecode(response.body);
      if(data["statusCode"]=="200"){
        UserModel _user = UserModel.fromJSON(data["userinfo"]);
        SharedPreferences prefs = await SharedPreferences.getInstance();
        prefs.setInt('userid', _user.id);
        prefs.setString('name', _user.cust_name);
        prefs.setString('email', _user.email);
        prefs.setString('zip', _user.zipcode);
        prefs.setString('street', _user.street);
        responseModel = ResponseModel(status: 200, message: "Login Success");
      }else{
        responseModel = ResponseModel(status: 400, message: "failed to login");
      }
    }else{
      responseModel = ResponseModel(status: 500, message: "failed to connect");
    }

    return responseModel;
  }


  static Future<ResponseModel> registerNow(formBody) async{
    ResponseModel responseModel;
    http.Response response =  await http.post(Uri.parse(baseurl+"register"),headers:<String,String>{'Content-Type': 'application/json; charset=UTF-8',} , body: jsonEncode(formBody));
    var data = jsonDecode(response.body);
    print(data);
    if(response.statusCode==200){
      var data = jsonDecode(response.body);
      print(data);
      if(data["statusCode"]=="200"){

        responseModel = ResponseModel(status: 200, message: "Success");

      }else{
        responseModel = ResponseModel(status: 400, message: "Failed");

      }
    }else{
      responseModel = ResponseModel(status: 500, message: "Failed to connect");
    }
    return responseModel;
  }
}
