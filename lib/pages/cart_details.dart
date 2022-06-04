import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:food_delivery/theme/color.dart';
import 'package:food_delivery/widgets/category_item.dart';
import 'package:food_delivery/widgets/custom_image.dart';
import 'package:shared_preferences/shared_preferences.dart';


class CartDetails extends StatefulWidget {

  @override
  _CartDetailsState createState() => _CartDetailsState();
}

class _CartDetailsState extends State<CartDetails> {
  static String name="";
  int id=0;

  @override
  void initState() {
   getStringValuesSF();
    super.initState();
  }

  void getStringValuesSF() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    name = prefs.getString('name')!;
    id = prefs.getInt('userid')!;

  }

  int count=1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar:  PreferredSize(preferredSize: Size.fromHeight(50.0) ,child: CustomAppbar()),
      drawer:  PreferredSize(preferredSize: Size.fromHeight(50.0) ,child: MyDrawer(name:name)),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.only(left: 15, right: 15),
              child: listFeatured(),
            ),
            SizedBox(height: 20,),
            Container(
              padding: EdgeInsets.all(20),

              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Total Items:", style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),),
                      Text(" 10", style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),),
                    ],
                  ),
                  SizedBox(height: 10,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Sub Total Amount:", style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),),
                      Text("\$ 100 /-", style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),),
                    ],
                  ),
                  SizedBox(height: 10,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Total Amount:", style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),),
                      Text("\$ 100 /-", style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),),
                    ],
                  ),
                ],
              )
            ),
            Divider(height: 5,),
            Container(
              padding: EdgeInsets.all(15),
              child: SizedBox(
                child: ElevatedButton(onPressed: (){}, child: Text("Place To Order",style: TextStyle(fontSize: 18),),
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
    );
  }
}
listFeatured() {
  return Column(
    children: List.generate(
        4,
            (index) => GestureDetector(
          onTap: () async {
            // var response=await  apiDashboard.ProductDetailsInfo(list[index].id);
            //
            // Navigator.push(
            //   context,
            //   MaterialPageRoute(builder: (context) => Product_details(value:response.datas)),
            // );
          },
          child: Container(
            margin: EdgeInsets.only(bottom: 10),
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  color: shadowColor.withOpacity(0.1),
                  spreadRadius: 1,
                  blurRadius: 1,
                  offset: Offset(0, 1), // changes position of shadow
                ),
              ],
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CustomImage(
                  "images/home.jpg",
                  width: 60,
                  height: 60,
                  radius: 10,
                ),
                SizedBox(width: 15),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Burger food",
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.w600)),
                      SizedBox(
                        height: 3,
                      ),
                      Text("Teheri",
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              fontSize: 12, color: Colors.grey)),
                      SizedBox(
                        height: 4,
                      ),
                      Row(
                        children: [
                          Text("\$ 256"),
                          SizedBox(
                            width: 2,
                          ),
                          //Text(data["rate"] + " (" + data["rate_number"] + ")", style: TextStyle(fontSize: 12, color: primary)),
                        ],
                      ),
                      SizedBox(height: 20,),

                    ],
                  ),
                ),
                Column(
                  children: <Widget>[
                    SizedBox(
                      height: 10,
                    ),
                  ],
                ),
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(padding: EdgeInsets.all(0),child: IconButton(icon:Icon(FontAwesomeIcons.minus,color: primary,),onPressed: (){


                      },)),
                      Container(
                          padding: EdgeInsets.all(7),
                          decoration: BoxDecoration(
                            color: primary,
                            borderRadius: BorderRadius.circular(30)
                          ),
                          child: Text("1",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,color: Colors.white),),

                      ),
                      Container(padding: EdgeInsets.all(0),child: IconButton(icon:Icon(FontAwesomeIcons.plus,color: primary,),onPressed: (){
                        // if(count>1) {
                        //   setState(() {
                        //     total1();
                        //     count--;
                        //   });
                        // }
                      },)),

                    ],
                  ),
                ),
              ],
            ),
          ),
        )),
  );
}