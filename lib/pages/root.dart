//
// import 'package:flutter/material.dart';
// import 'package:food_delivery/pages/cart_details.dart';
// import 'package:food_delivery/pages/profile.dart';
// import 'package:food_delivery/theme/color.dart';
// import 'package:food_delivery/widgets/bottombar_item.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'home.dart';
//
// class RootApp extends StatefulWidget {
//   const RootApp({ Key? key }) : super(key: key);
//
//   @override
//   _RootAppState createState() => _RootAppState();
// }
//
// class _RootAppState extends State<RootApp> {
//   int activeTab = 0;
//   static String name="";
//   static int id=0;
//
//   @override
//   void initState() {
//     super.initState();
//     WidgetsBinding.instance?.addPostFrameCallback((timeStamp) {
//       getStringValuesSF();
//     });
//
//   }
//   List<IconData> tapIcons = [
//     Icons.home_rounded, Icons.explore_rounded,
//     Icons.shopping_cart_rounded, Icons.person_rounded
//   ];
//   List<Widget> pages = [
//     HomePage(), HomePage(), CartDetails(), Profile(name:name,id:id),
//   ];
//
//
//   void getStringValuesSF() async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     name = prefs.getString('name')!;
//     id = prefs.getInt('userid')!;
//
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return goHome();
//   }
//
//   goHome() {
//     return Scaffold(
//       backgroundColor: appBgColor,
//       bottomNavigationBar: getBottomBar(),
//       body: getBarPage()
//     );
//   }
//
//   Widget getBottomBar() {
//     return Container(
//       height: 75, width: double.infinity,
//       padding: EdgeInsets.only(bottom: 15),
//       decoration: BoxDecoration(
//         color: bottomBarColor,
//         borderRadius: BorderRadius.only(
//           topLeft: Radius.circular(25),
//           topRight: Radius.circular(25)
//         ),
//         boxShadow: [
//           BoxShadow(
//             color: shadowColor.withOpacity(0.1),
//             blurRadius: .5,
//             spreadRadius: .5,
//             offset: Offset(0, 1)
//           )
//         ]
//       ),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceAround,
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children:
//           List.generate(tapIcons.length,
//             (index) => BottomBarItem(tapIcons[index], "", isActive: activeTab == index, activeColor: primary,
//               onTap: () {
//                 setState(() {
//                   activeTab = index;
//                 });
//               },
//             )
//           )
//         ),
//     );
//   }
//
//   Widget getBarPage(){
//     return
//       IndexedStack(
//         index: activeTab,
//         children:
//           List.generate(tapIcons.length,
//             (index) => pages[index]
//           )
//       );
//   }
// }