import 'package:flutter/material.dart';
import 'package:hospital/constances/mycolor.dart';
import 'package:hospital/presntation/Screens/admin/add_Reception/Screens/showReception.dart';
import 'package:hospital/presntation/Screens/admin/manager_Screen/widgets/navigationDrawer.dart';
import 'package:hospital/presntation/Screens/admin/manager_Screen/widgets/showEmployee.dart';
import 'package:hospital/presntation/Screens/reception/screens/addPatient/add_Patient.dart';
import 'package:hospital/presntation/Screens/reception/screens/addPatient/controller/addpatierntcontroller.dart';
import 'package:hospital/presntation/Screens/reception/screens/receptionscreens/widgets/receptionnavigation.dart';

class Reception_Screen extends StatefulWidget {
   Reception_Screen({super.key, this.newcurrentIndex});
   final  newcurrentIndex;
  @override
  State<Reception_Screen> createState() => _Manager_ScreenState();
}

class _Manager_ScreenState extends State<Reception_Screen> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    final Patient patient;
    return Scaffold(
      backgroundColor: MyColor.myBlue,
      body: Padding(
        padding: const EdgeInsets.all(14.0),
        child: Row(mainAxisAlignment: MainAxisAlignment.end,
          children: [
            // index1==1?Container(width: 20,height: 20,color: Colors.red,):Container(width: 20,height: 20,color: Colors.green,)
           widget.newcurrentIndex == 1 ? Expanded(child: ExpandableListEmployee()) :widget.newcurrentIndex==0?Expanded(child: Add_Patient()): Container(),

            buildDrawerInContianer(height, width,widget.newcurrentIndex),
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

  Container buildDrawerInContianer(double height, double width,index1) {
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
        Recption_Navigation(
          changeIndex: (index) {
            setState(() {
               index1=index;

            });
          },
          currentindex: index1  ,
        ),
      ]),
    );
  }
}