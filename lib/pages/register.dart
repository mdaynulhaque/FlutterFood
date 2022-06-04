import 'package:flutter/material.dart';
import 'package:food_delivery/model/loginModel.dart';
import 'package:food_delivery/pages/login.dart';
import 'package:food_delivery/service/API_SERVICE.dart';
import 'package:food_delivery/theme/color.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController
  firstName = TextEditingController(),
      zipcode = TextEditingController(),
      fulladdress = TextEditingController(),
      email = TextEditingController(),
      phone= TextEditingController(),
      password= TextEditingController();

  bool loading = false;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    String defaultFontFamily = 'Roboto-Light.ttf';
    double defaultFontSize = 14;
    double defaultIconSize = 17;

    return Scaffold(
      body: loading?Center(
        child: CircularProgressIndicator(
          color: mainColor,
        ),
      ):
      SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.only(left: 20, right: 20, top: 35, bottom: 30),
          width: double.infinity,
          height: MediaQuery.of(context).size.height,
          color: Colors.white70,
          child: Column(
            children: <Widget>[
              Flexible(
                flex: 1,
                child: InkWell(
                  child: const Align(
                    alignment: Alignment.topLeft,
                    child: Icon(Icons.close),
                  ),
                  onTap: (){
                    Navigator.pop(context);
                  },
                ),
              ),
              Form(
                key: formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      width: 130,
                      height: 120,
                      alignment: Alignment.center,
                      child: Image.asset("images/index.png"),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Row(
                      children: <Widget>[
                        Flexible(
                          flex: 1,
                          child: TextFormField(
                            showCursor: true,
                            validator: (str){
                              if(str!.isEmpty){
                                return "required";
                              }else{
                                return null;
                              }
                            },
                            controller: firstName,
                            decoration: InputDecoration(
                              border: const OutlineInputBorder(
                                borderRadius:
                                BorderRadius.all(Radius.circular(10.0)),
                                borderSide: BorderSide(
                                  width: 0,
                                  style: BorderStyle.none,
                                ),
                              ),
                              filled: true,
                              fillColor: const Color(0xFFF2F3F5),
                              hintStyle: TextStyle(
                                color: const Color(0xFF666666),
                                fontFamily: defaultFontFamily,
                                fontSize: defaultFontSize,
                              ),
                              hintText: "Your Name",
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Flexible(
                          flex: 1,
                          child: TextFormField(
                            showCursor: true,
                            validator: (str){
                              if(str!.isEmpty){
                                return "required";
                              }else{
                                return null;
                              }
                            },
                            controller: zipcode,
                            decoration: InputDecoration(
                              border: const OutlineInputBorder(
                                borderRadius:
                                BorderRadius.all(Radius.circular(10.0)),
                                borderSide: BorderSide(
                                  width: 0,
                                  style: BorderStyle.none,
                                ),
                              ),
                              filled: true,
                              fillColor: const Color(0xFFF2F3F5),
                              hintStyle: TextStyle(
                                color: const Color(0xFF666666),
                                fontFamily: defaultFontFamily,
                                fontSize: defaultFontSize,
                              ),
                              hintText: "Zip Code",
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    TextFormField(
                      showCursor: true,
                      validator: (str){
                        if(str!.isEmpty){
                          return "required";
                        }else{
                          return null;
                        }
                      },
                      keyboardType: TextInputType.phone,
                      controller: phone,
                      decoration: InputDecoration(
                        border: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                          borderSide: BorderSide(
                            width: 0,
                            style: BorderStyle.none,
                          ),
                        ),
                        filled: true,
                        prefixIcon: Icon(
                          Icons.phone,
                          color: const Color(0xFF666666),
                          size: defaultIconSize,
                        ),
                        fillColor: const Color(0xFFF2F3F5),
                        hintStyle: TextStyle(
                            color: const Color(0xFF666666),
                            fontFamily: defaultFontFamily,
                            fontSize: defaultFontSize),
                        hintText: "Phone Number",
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    TextFormField(
                      showCursor: true,
                      validator: (str){
                        if(str!.isEmpty){
                          return "required";
                        }else{
                          return null;
                        }
                      },
                      controller: email,
                      decoration: InputDecoration(
                        border: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                          borderSide: BorderSide(
                            width: 0,
                            style: BorderStyle.none,
                          ),
                        ),
                        filled: true,
                        prefixIcon: Icon(
                          Icons.email_outlined,
                          color: const Color(0xFF666666),
                          size: defaultIconSize,
                        ),
                        fillColor: const Color(0xFFF2F3F5),
                        hintStyle: TextStyle(
                          color: const Color(0xFF666666),
                          fontFamily: defaultFontFamily,
                          fontSize: defaultFontSize,
                        ),
                        hintText: "Email",
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      showCursor: true,
                      validator: (str){
                        if(str!.isEmpty){
                          return "required";
                        }else{
                          return null;
                        }
                      },
                      controller: fulladdress,
                      decoration: InputDecoration(
                        border: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                          borderSide: BorderSide(
                            width: 0,
                            style: BorderStyle.none,
                          ),
                        ),
                        filled: true,
                        prefixIcon: Icon(
                          Icons.location_on,
                          color: const Color(0xFF666666),
                          size: defaultIconSize,
                        ),
                        fillColor: const Color(0xFFF2F3F5),
                        hintStyle: TextStyle(
                          color: const Color(0xFF666666),
                          fontFamily: defaultFontFamily,
                          fontSize: defaultFontSize,
                        ),
                        hintText: "Full Address",
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      showCursor: true,
                      validator: (str){
                        if(str!.isEmpty){
                          return "required";
                        }else{
                          return null;
                        }
                      },
                      controller: password,
                      obscureText: true,
                      decoration: InputDecoration(
                        border: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                          borderSide: BorderSide(
                            width: 0,
                            style: BorderStyle.none,
                          ),
                        ),
                        filled: true,
                        prefixIcon: Icon(
                          Icons.lock_open,
                          color: const Color(0xFF666666),
                          size: defaultIconSize,
                        ),
                        fillColor: const Color(0xFFF2F3F5),
                        hintStyle: TextStyle(
                          color: const Color(0xFF666666),
                          fontFamily: defaultFontFamily,
                          fontSize: defaultFontSize,
                        ),
                        hintText: "Password",
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),

                    Container(
                      width: double.infinity,
                      child: RaisedButton(
                        padding: const EdgeInsets.all(17.0),
                        onPressed: () {
                          if(formKey.currentState!.validate()){
                            register();
                          }
                        },
                        child: const Text(
                          "Sign Up",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontFamily: 'Poppins-Medium.ttf',
                          ),
                          textAlign: TextAlign.center,
                        ),
                        color: mainColor,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15.0),
                            side: BorderSide(color: mainColor)),
                      ),
                      decoration: const BoxDecoration(
                          shape: BoxShape.circle, color: Color(0xFFF2F3F7)),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                  ],
                ),
              ),
              Flexible(
                flex: 1,
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        "Already have an account? ",
                        style: TextStyle(
                          color: const Color(0xFF666666),
                          fontFamily: defaultFontFamily,
                          fontSize: defaultFontSize,
                          fontStyle: FontStyle.normal,
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                            context, MaterialPageRoute(builder: (context) => const LoginPage()),
                          );
                        },
                        child: Text(
                          "Sign In",
                          style: TextStyle(
                            color: const Color(0xFFAC252B),
                            fontFamily: defaultFontFamily,
                            fontSize: defaultFontSize,
                            fontStyle: FontStyle.normal,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  void register() async{
    setState(() {
      loading = true;
    });
    Map<String,String> formData = {
      "cust_name":firstName.text.toString(),
      "zipcode":zipcode.text.toString(),
      "phone_no":phone.text.toString(),
      "email":email.text.toString(),
      "password":password.text.toString(),
      "street_address":fulladdress.text.toString(),
      "thana_id":"2",
      "district_id":"2",
    };
    ResponseModel responseModel = await API_SERVICE.registerNow(formData);
    setState(() {
      loading = false;
    });
    if(responseModel.status == 200){
      ScaffoldMessenger.of(context).showSnackBar( SnackBar(content: const Text("Registration Success, Please Login"),backgroundColor: Colors.green[900],));
      Navigator.pop(context);
    }else{
      ScaffoldMessenger.of(context).showSnackBar( SnackBar(content: const Text("Failed to register check your data "),backgroundColor: Colors.red[900],));
    }
  }
}