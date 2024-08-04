import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hospital/bussines_logic/login_cubit/login_cubit.dart';
import 'package:hospital/constances/mycolor.dart';
import 'package:hospital/constances/role.dart';
import 'package:hospital/presntation/Screens/admin/add_Reception/Screens/editReception.dart';
import 'package:hospital/presntation/Screens/reception/screens/startreceptopn_screen/start_reception_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final password = TextEditingController();

  final sp = TextEditingController();

  final type = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: MyColor.myBlue,
      body: Column(
        children: [
          SizedBox(
            height: height / 6,
          ),
          Align(
              alignment: Alignment.topCenter,
              child: Image.asset(
                'images/img_4.png',
                height: height / 10,
                width: width / 3,
              )),
          SizedBox(
            height: height / 10,
          ),
          Text(
            'تسجيل الدخول',
            style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: height / 30,
          ),
          SizedBox(
            height: height / 18,
            width: width / 3,
            child: TextFormField(
              controller: password,
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
          ),
          SizedBox(
            height: height / 30,
          ),
          SizedBox(
            height: height / 18,
            width: width / 3,
            child: TextFormField(
              controller: sp,
              decoration: InputDecoration(
                hintText: 'spicelist',
                hintStyle: const TextStyle(fontSize: 12),
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
          ),
          SizedBox(
            height: height / 30,
          ),
          SizedBox(
            height: height / 18,
            width: width / 3,
            child: TextFormField(
              controller: type,
              decoration: InputDecoration(
                hintText: 'type',
                hintStyle: const TextStyle(fontSize: 12),
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
          ),
          SizedBox(
            height: height / 30,
          ),
          BlocConsumer<LoginCubit, LoginState>(
            listener: (context , state) {
              if (state.loginStatus == LoginStatus.success) {
                if (Role.role == "ss") {
                  Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_) =>  EditReception(isediting: false
                  ))) ;
                }
              }
            },
            builder: (context, state) {
              if (state.loginStatus == LoginStatus.loading) {
                return SizedBox(
                  height: height / 18,
                  width: width / 3,
                  child: Container(
                    alignment: Alignment.center,
                    child: const CircularProgressIndicator(
                      color: MyColor.mykhli,
                    ),
                  ),
                );
              }
              return InkWell(
                onTap: () async {
                  await BlocProvider.of<LoginCubit>(context).login(password.text, int.parse(sp.text), type.text);
                },
                child: SizedBox(
                  height: height / 18,
                  width: width / 3,
                  child: Container(
                    color: MyColor.mykhli,
                    alignment: Alignment.center,
                    child: const Text(
                      'login',
                      style: TextStyle(color: Colors.white, fontWeight: FontWeight.w400, fontSize: 18),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
