import 'package:flutter/material.dart';
import 'package:hospital/presntation/Screens/doctor/show_doctor_floor_screen.dart';
import 'package:hospital/presntation/Screens/doctor/show_doctor_screen.dart';
import 'package:hospital/presntation/Screens/doctor/show_spelciaist_doctor.dart';

import '../../../constances/mycolor.dart';
import '../admin/manager_Screen/widgets/navigationDrawer.dart';

class DoctorDrawerScreen extends StatefulWidget {
  const DoctorDrawerScreen({super.key});

  @override
  State<DoctorDrawerScreen> createState() => _DoctorDrawerScreenState();
}

class _DoctorDrawerScreenState extends State<DoctorDrawerScreen> {
  int currentIndex = 0;
  int index1 = 0;
  bool onclick = false;
  bool isClicked = false;

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: MyColor.myBlue,
      body: Padding(
        padding: const EdgeInsets.all(14.0),
        child: Row(mainAxisAlignment: MainAxisAlignment.end,
          children: [
            // index1==1?Container(width: 20,height: 20,color: Colors.red,):Container(width: 20,height: 20,color: Colors.green,)
            currentIndex == 0 ? const Expanded(child: ShowDoctorScreen()) : currentIndex == 1 ? const Expanded(child: ShowDoctorFloorScreen()):const Expanded(child: ShowSpelciaistDoctor()),

            buildDrawerInContianer(height, width),
            Container(
              width: width / 40,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(topRight: Radius.circular(25), bottomRight: Radius.circular(25)),
                color: MyColor.mykhli,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Container buildDrawerInContianer(double height, double width) {
    return Container(
      decoration:  BoxDecoration(
        boxShadow: MyColor.boxshadow,
        borderRadius: const BorderRadius.only(topLeft: Radius.circular(25), bottomLeft: Radius.circular(25)),
        color: Colors.white,
      ),
      height: height,
      width: width / 8,
      child: Column(children: [
        SizedBox(
          height: height / 12,
        ),
        const Divider(
          color: Colors.black,
        ),
        Navigation_Drawer(
          people: ['عرض الدكاترة' , 'عرض دكاترة الطابق' , 'عرض دكاترة الاختصاص'],
          changeIndex: (index) {
            setState(() {
              currentIndex = index;
            });
          },
          currentindex: currentIndex,
        ),
      ]),
    );
  }
}
