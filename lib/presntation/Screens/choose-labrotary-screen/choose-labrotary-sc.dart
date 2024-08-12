import 'package:flutter/material.dart';
import 'package:hospital/constances/mycolor.dart';
import 'package:hospital/presntation/Screens/admin/add_Reception/Screens/showReception.dart';
import 'package:hospital/presntation/Screens/admin/manager_Screen/widgets/navigationDrawer.dart';
import 'package:hospital/presntation/Screens/admin/manager_Screen/widgets/showEmployee.dart';
import 'package:hospital/presntation/Screens/admin/patient_info.dart';
import 'package:hospital/presntation/Screens/admin/room_view.dart';
import 'package:hospital/presntation/Screens/choose-labrotary-screen/screen/show-labrotary.dart';
import 'package:hospital/presntation/Screens/choose-labrotary-screen/screen/show-radiograph.dart';

class ChooseLabRad_Screen extends StatefulWidget {
  const ChooseLabRad_Screen({super.key});

  @override
  State<ChooseLabRad_Screen> createState() => _ChooseLabRad_Screen();
}

class _ChooseLabRad_Screen extends State<ChooseLabRad_Screen> {
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
            currentIndex == 0 ? Expanded(child: Show_Labrotary()) :Expanded(child: Show_RadioGraph()),

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
          people: ['فني مخبري ','فني اشعة'],
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