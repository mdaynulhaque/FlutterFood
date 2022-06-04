import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:food_delivery/pages/cart_details.dart';
import 'package:food_delivery/pages/home.dart';
import 'package:food_delivery/pages/login.dart';
import 'package:food_delivery/pages/profile.dart';
import 'package:food_delivery/theme/color.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyDrawer extends StatelessWidget {
  String name;
  MyDrawer({required this.name});
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        // Important: Remove any padding from the ListView.
        padding: EdgeInsets.zero,
        children: <Widget>[
          UserAccountsDrawerHeader(
            accountName: Text(name),
            accountEmail: Text("abhishekm977@gmail.com"),
            currentAccountPicture: CircleAvatar(
              backgroundColor: Colors.orange,
              child: Text(
                "A",
                style: TextStyle(fontSize: 40.0),
              ),
            ),
          ),
          ListTile(
            leading: Icon(FontAwesomeIcons.home), title: Text("Home"),
            onTap: () {
              Navigator.push(
                         context,
                         MaterialPageRoute(builder: (context) => HomePage()));
            },
          ),
          Divider(height: 0,),
          ListTile(
            leading: Icon(FontAwesomeIcons.shoppingBasket), title: Text("Cart Details"),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => CartDetails()));
            },
          ),
          Divider(height: 0,),
          ListTile(
            leading: Icon(FontAwesomeIcons.pen), title: Text("Profile "),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Profile()));
            },
          ),
          Divider(height: 0,),
          ListTile(
            leading: Icon(FontAwesomeIcons.signOutAlt), title: Text("Logout "),
            onTap: () async {
              SharedPreferences preferences = await SharedPreferences.getInstance();
              await preferences.clear();
              preferences.remove('name');
              Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LoginPage()));
            },
          ),
        ],
      ),
    );

  }
}

class CustomAppbar extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text("Food Delivery"),
      actions: [
        Container(
          padding: EdgeInsets.only(right: 20,top: 10),
          child: Badge(
            badgeContent: Text('3',style: TextStyle(fontSize: 15,color: Colors.white),),
            child: Icon(Icons.shopping_cart_outlined),
          ),
        )
      ],
      backgroundColor: primary,
    );
  }
}