import 'package:flutter/material.dart';
import 'package:hospital/constances/mycolor.dart';
import 'package:hospital/presntation/Screens/admin/add_Reception/Screens/showReception.dart';
import 'package:hospital/presntation/Screens/admin/manager_Screen/widgets/navigationDrawer.dart';
import 'package:hospital/presntation/Screens/admin/manager_Screen/widgets/showEmployee.dart';
import 'package:hospital/presntation/Screens/admin/patient_info.dart';
import 'package:hospital/presntation/Screens/admin/room_view.dart';

class Manager_Screen extends StatefulWidget {
  const Manager_Screen({super.key});

  @override
  State<Manager_Screen> createState() => _Manager_ScreenState();
}

class _Manager_ScreenState extends State<Manager_Screen> {
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
            currentIndex == 0 ? Expanded(child: ExpandableListEmployee()) :currentIndex==1?Expanded(child: ShowReception()):Container(),

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
                people: ['معلومات الموظفين','معلومات السكرتارية'],
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
