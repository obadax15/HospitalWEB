import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hospital/constances/mycolor.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: MyColor.myBlue,
      body: Column(
        children: [
          SizedBox(height: height/6,),
          Align(
              alignment: Alignment.topCenter,
              child: Image.asset(
                'images/img_4.png',
                height: height / 10,
                width: width / 3,
              )),
          SizedBox(height: height/10,),

          Text(
            'تسجيل الدخول',
            style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: height/30,),

          SizedBox(height: height/18,width: width/3,
            child: TextFormField(

              decoration: InputDecoration(
              hintText: 'أدخل رمز ال PIN',
                hintStyle: TextStyle(fontSize: 12),
                hintTextDirection: TextDirection.rtl,
                fillColor: Colors.white,
                filled: true,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(13.0), // Customize borderRadius
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Color.fromRGBO(173, 173, 173, 1), width: 1.0),
                  borderRadius: BorderRadius.circular(13.0), // Customize borderRadius
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
