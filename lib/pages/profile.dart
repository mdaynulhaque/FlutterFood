import 'package:flutter/material.dart';
import 'package:food_delivery/pages/login.dart';
import 'package:food_delivery/theme/color.dart';
import 'package:food_delivery/widgets/category_item.dart';
import 'package:food_delivery/widgets/notification_box.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Profile extends StatefulWidget {
  const Profile({ Key? key }) : super(key: key);

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {

  static String name="";
  static int id=0;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance?.addPostFrameCallback((timeStamp) {
      getStringValuesSF();
    });
  }
  @override
  void setState(VoidCallback fn) {
    name;
    super.setState(fn);
  }
  void getStringValuesSF() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    name = prefs.getString('name')!;
    id = prefs.getInt('userid')!;

  }


  @override
  Widget build(BuildContext context) {
   return Scaffold(
     appBar:  PreferredSize(preferredSize: Size.fromHeight(50.0) ,child: CustomAppbar()),
     drawer:  PreferredSize(preferredSize: Size.fromHeight(50.0) ,child: MyDrawer(name:name)),
     body:Container(
       padding: EdgeInsets.all(20),
       child: Column(
         children: [
           Container(
             height: 100,
             width: 100,
             child: CircleAvatar(backgroundImage: NetworkImage("https://images.unsplash.com/photo-1504674900247-0877df9cc836?ixid=MXwxMjA3fDB8MHxzZWFyY2h8MTF8fHByb2ZpbGV8ZW58MHx8MHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=60"),),
           ),
           SizedBox(height: 2,),
           Text( name,style: TextStyle(fontSize: 20),),
           Text( id.toString(),style: TextStyle(fontSize: 20),),
           SizedBox(height: 20,),
           InkWell(
             onTap: (){

             },
             child: Container(
               margin: EdgeInsets.only(bottom: 10),
               padding: const EdgeInsets.all(10),
               decoration: BoxDecoration(
                 color: Colors.white,
                 borderRadius: BorderRadius.circular(15),
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
                   Container(
                     child: CircleAvatar(backgroundColor: Colors.lightBlue,child: Icon(Icons.monetization_on,color: Colors.white,),),
                   ),
                   SizedBox(width: 15),
                   Expanded(
                     child: Column(
                       crossAxisAlignment: CrossAxisAlignment.start,
                       children: [
                         Text("Payment",  maxLines: 1, overflow: TextOverflow.ellipsis, style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600)),
                       ],
                     ),
                   ),
                   Column(
                     children: <Widget>[
                       Icon(Icons.arrow_forward_ios_sharp),


                     ],
                   ),
                 ],
               ),
             ),
           ),
           InkWell(
             onTap: (){

             },
             child: Container(
               margin: EdgeInsets.only(bottom: 10),
               padding: const EdgeInsets.all(10),
               decoration: BoxDecoration(
                 color: Colors.white,
                 borderRadius: BorderRadius.circular(15),
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
                   Container(
                     child: CircleAvatar(backgroundColor: Colors.lightBlue,child: Icon(Icons.directions_bike_sharp,color: Colors.white,),),
                   ),
                   SizedBox(width: 15),
                   Expanded(
                     child: Column(
                       crossAxisAlignment: CrossAxisAlignment.start,
                       children: [
                         Text("My Orders",  maxLines: 1, overflow: TextOverflow.ellipsis, style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600)),
                       ],
                     ),
                   ),
                   Column(
                     children: <Widget>[
                       Icon(Icons.arrow_forward_ios_sharp),


                     ],
                   ),
                 ],
               ),
             ),
           ),
           InkWell(
             onTap: (){

             },
             child: Container(
               margin: EdgeInsets.only(bottom: 10),
               padding: const EdgeInsets.all(10),
               decoration: BoxDecoration(
                 color: Colors.white,
                 borderRadius: BorderRadius.circular(15),
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
                   Container(
                     child: CircleAvatar(backgroundColor: Colors.lightBlue,child: Icon(Icons.lock,color: Colors.white,),),
                   ),
                   SizedBox(width: 15),
                   Expanded(
                     child: Column(
                       crossAxisAlignment: CrossAxisAlignment.start,
                       children: [
                         Text("Changed Password",  maxLines: 1, overflow: TextOverflow.ellipsis, style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600)),
                       ],
                     ),
                   ),
                   Column(
                     children: <Widget>[
                       Icon(Icons.arrow_forward_ios_sharp),


                     ],
                   ),
                 ],
               ),
             ),
           ),
           InkWell(
             onTap: () async {
               SharedPreferences preferences = await SharedPreferences.getInstance();
               await preferences.clear();
               preferences.remove('name');
               Navigator.push(
                   context,
                   MaterialPageRoute(builder: (context) => LoginPage()));
             },
             child: Container(
               margin: EdgeInsets.only(bottom: 10),
               padding: const EdgeInsets.all(10),
               decoration: BoxDecoration(
                 color: Colors.white,
                 borderRadius: BorderRadius.circular(15),
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
                   Container(
                     child: CircleAvatar(backgroundColor: Colors.lightBlue,child: Icon(Icons.logout,color: Colors.white,),),
                   ),
                   SizedBox(width: 15),
                   Expanded(
                     child: Column(
                       crossAxisAlignment: CrossAxisAlignment.start,
                       children: [
                         Text("Logout",  maxLines: 1, overflow: TextOverflow.ellipsis, style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600)),
                       ],
                     ),
                   ),
                   Column(
                     children: <Widget>[
                       Icon(Icons.arrow_forward_ios_sharp),


                     ],
                   ),
                 ],
               ),
             ),
           )
         ],
       ),
     ),
   );
  }
}