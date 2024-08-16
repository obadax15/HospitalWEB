import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hospital/constances/mycolor.dart';
import 'package:hospital/presntation/Screens/admin/manager_Screen/managerScreen.dart';
import 'package:hospital/presntation/Screens/forms/make_forms/Screens/lab_form.dart';
import 'package:hospital/presntation/Screens/login/login_Screen.dart';
import 'package:hospital/presntation/Screens/reception/receptionscreen.dart';

class Start_Reception_Screen extends StatefulWidget {
  const Start_Reception_Screen({Key? key}) : super(key: key);

  @override
  State<Start_Reception_Screen> createState() => _Start_Reception_ScreenState();
}

class _Start_Reception_ScreenState extends State<Start_Reception_Screen> {
  @override
  Widget build(BuildContext context) {
    int currentindex=0;
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
          child: Stack(
        children: [
          Container(
              color: MyColor.mykhli,
              child: Align(
                alignment: Alignment.topLeft,
                child: Padding(
                  padding: EdgeInsets.only(left: width / 12, top: height / 9),
                  child: Image.asset(
                    'images/img_13.png',
                    height: height / 6,
                    width: width / 6,
                  ),
                ),
              )),
          Align(
            alignment: Alignment.centerRight,
            child: Container(
              width: width / 1.5,
              decoration: const BoxDecoration(
                color: MyColor.myGrey,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(35),
                  bottomLeft: Radius.circular(35),
                ),
              ),
              child: Center(
                child: Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Image.asset(
                      'images/img_4.png',
                      height: height / 6,
                      width: width / 6,
                    ),
                    BuildPushContainer('المرضى',(){Navigator.push(context, MaterialPageRoute(builder: (c)=>Reception_Screen()));},width),
                    BuildPushContainer('الموظفين',(){Navigator.push(context, MaterialPageRoute(builder: (c)=>Manager_Screen()));},width),
                    BuildPushContainer('تسجيل خروج',(){Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => const LoginScreen())) ;},width),
                  ],
                ),
              ),
            ),
          )
        ],
      )),
    );
  }

  Widget BuildPushContainer(String name, void Function ()onclick, double width) {
    return GestureDetector(
      onTap:onclick,
      child: Container(
        width: width / 4,
        height: 40,
        decoration: BoxDecoration(color: MyColor.mykhli, borderRadius: BorderRadius.all(Radius.circular(5))),
        child: Center (
          child: Text(
            name,
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500,color: Colors.white),
          ),
        ),
      ),
    );
  }
}
