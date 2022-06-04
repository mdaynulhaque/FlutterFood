// class ResponseModel {
//   String  status;
//   String message;
//   List<UserModel> userinfo;
//
//   ResponseModel({required this.userinfo,required this.message,required this.status});
//
//   factory ResponseModel.fromJson(Map<String, dynamic> json) {
//     var list = json['userinfo'] as List;
//     List<UserModel> productL =
//     list.map((data) => UserModel.fromJson(data)).toList();
//     return ResponseModel(
//       userinfo: productL,
//       status: json["statusCode"] as String,
//       message: json["Message"] as String,
//     );
//   }
//
// }

class ResponseModel{
  int status;
  String message;
  dynamic data;
  ResponseModel({required this.status,required this.message,this.data});
}

class UserModel{
  int id;
  String cust_name;
  String phone_no;
  String zipcode;
  String email;
  String street;
  UserModel({required this.id, required this.cust_name, required this.phone_no, required this.zipcode, required this.email,required this.street});

  factory UserModel.fromJSON(Map data){
    return UserModel(
        id: data["id"] as int,
        cust_name: data["cust_name"] as String,
        phone_no: data["phone_no"] as String,
        zipcode: data["zipcode"] as String,
        email: data["email"] as String,
        street: data["street_address"] as String
    );
  }

  // factory UserModel.fromJson(Map<String, dynamic> json) {
  //   return UserModel(
  //       id: json["id"] as int,
  //       cust_name: json["cust_name"] as String,
  //       phone_no: json["phone_no"] as String,
  //       zipcode: json["zipcode"] as String,
  //       email: json["email"] as String,
  //       street: json["street_address"] as String
  //   );
  // }


}
