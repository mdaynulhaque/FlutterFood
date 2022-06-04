import 'package:flutter/material.dart';
import 'package:food_delivery/model/cart_model.dart';
import 'package:food_delivery/model/product_list.dart';
import 'package:food_delivery/service/API_SERVICE.dart';
import 'package:food_delivery/service/shareedpref.dart';
import 'package:food_delivery/theme/color.dart';

class Product_details extends StatefulWidget {
  List<ProductListResponse> value;
  Product_details({required this.value});

  @override
  _Product_detailsState createState() => _Product_detailsState();
}

class _Product_detailsState extends State<Product_details> {
  int count=1;
  int total=0;
  API_SERVICE apiDashboard = API_SERVICE();
  //ProductListResponse product="" as ProductListResponse;
  bool inCart = false;
  @override
  void initState(){
    // TODO: implement initState
    super.initState();

  }

  // void checkCart() async{
  //   inCart = await SharedPrefManager.alreadyExist(pr);
  //   setState(() {
  //
  //   });
  // }


  @override
  Widget build(BuildContext context) {
    total=widget.value[0].price;
    int total1(){
      return total=total*count;
    }
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          color: Colors.white,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.network("https://mobarok.me/"+widget.value[0].iamge),
              SizedBox(height: 10,),
              Container(
                padding: EdgeInsets.all(20),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(widget.value[0].product_name,style: TextStyle(fontSize: 18,color: Colors.black),),
                    Text("৳ "+widget.value[0].price.toString(),style: TextStyle(fontSize: 18,color: primary),),
                  ],
                ),
              ),

              Container(
                padding: EdgeInsets.only(left: 15,right: 15),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Description",style: TextStyle(fontSize: 18,color: Colors.black54,fontWeight: FontWeight.bold),),
                    SizedBox(height: 10,),
                    Text(widget.value[0].description,style: TextStyle(fontSize: 14,color: Colors.black54)),
                  ],
                ),
              ),
              SizedBox(height: 15,),
              Container(
               padding: EdgeInsets.all(15),
               child: Row(
                 crossAxisAlignment: CrossAxisAlignment.center,
                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                 children: [
                   Text("Item No.",style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
                   Container(
                     child: Row(
                       children: [
                         Container(
                           padding: EdgeInsets.all(1),
                           child: SizedBox(
                             child: ElevatedButton(onPressed: (){
                               if(count>1){
                                 setState(() {
                                   count--;
                                 });
                               }
                             }, child: Text("-",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),),
                               style: ElevatedButton.styleFrom(
                                 primary: primary,
                                 shape: RoundedRectangleBorder(
                                   borderRadius: BorderRadius.circular(25),
                                 ),
                                 elevation: 15.0,
                               ),),
                           ),
                         ),
                         Container(
                           padding: EdgeInsets.all(1),
                           child: SizedBox(
                             child: ElevatedButton(onPressed: (){}, child: Text("$count"),
                               style: ElevatedButton.styleFrom(
                                 primary: primary,
                                 shape: RoundedRectangleBorder(
                                   borderRadius: BorderRadius.circular(25),
                                 ),
                                 elevation: 15.0,
                               ),),
                           ),
                         ),
                         Container(
                           padding: EdgeInsets.all(1),
                           child: SizedBox(
                             child: ElevatedButton(onPressed: (){
                               total=total*count;
                                 setState(() {
                                   total;
                                   count++;
                                 });
                             }, child: Text("+"),
                               style: ElevatedButton.styleFrom(
                                 primary: primary,
                                 shape: RoundedRectangleBorder(
                                   borderRadius: BorderRadius.circular(25),
                                 ),
                                 elevation: 15.0,
                               ),),
                           ),
                         ),
                       ],
                     ),
                   ),

                 ],
               ),
             ),
              SizedBox(height: 15,),
              Container(
                padding: EdgeInsets.all(15),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Total Price .",style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
                    Text("৳ "+total1().toString(),style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
                  ],
                ),
              ),
              SizedBox(height: 25,),
              Container(
                padding: EdgeInsets.all(15),
                child: SizedBox(
                  child: ElevatedButton(onPressed:(){
                  // inCart?null:(){
                    CartModel cartModel = CartModel(subTotal: total1(), total: total1(), quantity: count, product: widget.value[0]);
                    SharedPrefManager.addToCart(context,cartModel);
                    setState(() {
                      inCart = true;
                     });
                  },
                    child: Text("Add To Cart"),
                    style: ElevatedButton.styleFrom(
                      primary: primary,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25),
                      ),
                      elevation: 15.0,
                    ),),
                  width: MediaQuery.of(context).size.width,
                  height: 40,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

