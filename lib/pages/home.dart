
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:food_delivery/model/product_list.dart';
import 'package:food_delivery/pages/details_product.dart';
import 'package:food_delivery/service/API_SERVICE.dart';
import 'package:food_delivery/theme/color.dart';
import 'package:food_delivery/utils/data.dart';
import 'package:food_delivery/widgets/category_item.dart';
import 'package:food_delivery/widgets/custom_image.dart';
import 'package:food_delivery/widgets/custom_textbox.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  API_SERVICE apiDashboard = API_SERVICE();
  List<ProductListResponse> list = [];
  List<CategoryListResponse> list2 = [];
   final bool seleted=true;
   late  String name="";
  int a = 0;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance?.addPostFrameCallback((timeStamp) {
      getDataFromServer();
      getShere();
    });
  }
  getShere() async {
   SharedPreferences prefs = await SharedPreferences.getInstance();
   name = prefs.getString("name")!;
  }

  getDataFromServer() async {
    var response = await apiDashboard.ProductList();
    var response2 = await apiDashboard.CategoryList();
    list = response.datas;
    list2 = response2.datas;

    if (this.mounted) {
      // check whether the state object is in tree
      setState(() {
        // make changes here
      });
    }
  }

  String baseurl = "https://mobarok.me/";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(preferredSize: Size.fromHeight(50.0) ,child: CustomAppbar()),
      drawer: PreferredSize(preferredSize: Size.fromHeight(400.0) ,child: MyDrawer(name:name)),
      body: getBody(),
    );
  }

  getBody() {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.only(left: 15, right: 15),
            child: Text(
              "Find Your Best Food Here.....",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
              margin: EdgeInsets.only(left: 15, right: 15),
              child: CustomTextBox(
                  hint: "Search",
                  prefix: Icon(Icons.search, color: darker),
                  suffix: Icon(Icons.filter_list_outlined, color: primary))),
          SizedBox(
            height: 25,
          ),
          Container(
            margin: EdgeInsets.only(left: 15, right: 15),
            height: 150,
            decoration: BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.circular(15),
                image: DecorationImage(
                    fit: BoxFit.cover, image: AssetImage("images/home.jpg"))),
          ),
          SizedBox(
            height: 25,
          ),
          Container(
            margin: EdgeInsets.only(left: 0),
            child: list2.isEmpty
                ? Center(
                    child: Container(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height,
                        child: Center(child: CircularProgressIndicator())))
                : listCategories(),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            margin: EdgeInsets.only(left: 15, right: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Popular",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                Text(
                  "See all",
                  style: TextStyle(fontSize: 14, color: darker),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Container(
            child: list.isEmpty?Center(child: Text("Loading...."),) :listPopulars(),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            margin: EdgeInsets.only(left: 15, right: 15),
            child: Text(
              "Featured",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            margin: EdgeInsets.only(left: 15, right: 15),
            child: list.isEmpty?Center(child: Text("Loading...."),):listFeatured(),
          ),
          SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }

  listCategories() {
    List<Widget> lists = List.generate(
        list2.length,
        (index) => GestureDetector(
              onTap: () {},
              child: Container(
                padding: EdgeInsets.all(10),
                margin: EdgeInsets.only(right: 10),
                width: 90,
                decoration: BoxDecoration(
                  color: seleted ? primary : cardColor,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: shadowColor.withOpacity(0.05),
                      spreadRadius: .5,
                      blurRadius: .5,
                      offset: Offset(0, 1), // changes position of shadow
                    ),
                  ],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(FontAwesomeIcons.cloudMeatball,
                        size: 17, color: seleted ? Colors.white : darker),
                    SizedBox(
                      width: 7,
                    ),
                    Text(
                      list2[index].cat,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          fontSize: 13, color: seleted ? Colors.white : darker),
                    )
                  ],
                ),
              ),
            ));

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      padding: EdgeInsets.only(bottom: 5, left: 15),
      child: Row(children: lists),
    );
  }

  listPopulars() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      padding: EdgeInsets.only(left: 15),
      child: Row(
        children: List.generate(
            list.length,
            (index) => Container(
                  margin: EdgeInsets.only(right: 15),
                  height: 170, width: 220,
                  // color: secondary,
                  child: Stack(
                    children: [
                      Positioned(
                        top: 10,
                        child: Container(
                          height: 120,
                          width: 220,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            image: DecorationImage(
                                fit: BoxFit.cover,
                                image: NetworkImage(
                                    "https://mobarok.me/" + list[index].iamge)),
                          ),
                        ),
                      ),
                      Positioned(
                        top: 140,
                        child: Container(
                            width: 220,
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Expanded(
                                          child: Text(
                                        list[index].product_name,
                                        style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w600),
                                      )),
                                      SizedBox(
                                        width: 5,
                                      ),
                                      Text(
                                        list[index].price.toString(),
                                        style: TextStyle(
                                            fontSize: 14,
                                            color: primary,
                                            fontWeight: FontWeight.w600),
                                      ),
                                    ],
                                  ),
                                ])),
                      )
                    ],
                  ),
                )),
      ),
    );
  }

  listFeatured() {
    return Column(
      children: List.generate(
          featured.length,
          (index) => GestureDetector(
                onTap: () async {
                  var response=await  apiDashboard.ProductDetailsInfo(list[index].id);

                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Product_details(value:response.datas)),
                  );
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
                        baseurl + list[index].iamge,
                        width: 60,
                        height: 60,
                        radius: 10,
                      ),
                      SizedBox(width: 15),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(list[index].product_name,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                    fontSize: 14, fontWeight: FontWeight.w600)),
                            SizedBox(
                              height: 3,
                            ),
                            Text(list[index].cat,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                    fontSize: 12, color: Colors.grey)),
                            SizedBox(
                              height: 4,
                            ),
                            Row(
                              children: [
                                Icon(
                                  Icons.star_rounded,
                                  size: 14,
                                  color: primary,
                                ),
                                SizedBox(
                                  width: 2,
                                ),
                                //Text(data["rate"] + " (" + data["rate_number"] + ")", style: TextStyle(fontSize: 12, color: primary)),
                              ],
                            )
                          ],
                        ),
                      ),
                      Column(
                        children: <Widget>[
                          Text(list[index].price.toString(),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  color: primary)),
                          SizedBox(
                            height: 10,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              )),
    );
  }
}
