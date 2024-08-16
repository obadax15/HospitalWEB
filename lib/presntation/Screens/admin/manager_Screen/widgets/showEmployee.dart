import 'package:flutter/material.dart';
import 'package:hospital/constances/mycolor.dart';
import 'package:hospital/presntation/Screens/choose-labrotary-screen/choose-lab-rad-sc.dart';
import 'package:hospital/presntation/Screens/doctor/doctor_drawer_screen.dart';
import 'package:hospital/presntation/Screens/nurse_screens/show_nurse_screen.dart';

class ExpandableListEmployee extends StatefulWidget {
  @override
  _ExpandableListEmployeeState createState() => _ExpandableListEmployeeState();
}

class _ExpandableListEmployeeState extends State<ExpandableListEmployee> {
  late List<bool> _isExpanded;

  @override
  void initState() {
    super.initState();
    // Initialize the expanded state for each item in the list
    _isExpanded = List<bool>.generate(3, (index) => false);
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    List<String> people = ['موظف عام', 'الدكاترة', 'الممرضين'];
    List<String> pathofimages = [
      'images/img_1.png',
      'images/img_2.png',
      'images/img_3.png'
    ];
    return Padding(
      padding: const EdgeInsets.only(top: 50),
      child: Align(
        alignment: Alignment.topCenter,
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Row(
            children: List.generate(3, (index) {
              return Expanded(
                child: Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        boxShadow: MyColor.boxshadow,
                        borderRadius: const BorderRadius.all(
                          Radius.circular(12),
                        ),
                        color: Colors.white,
                      ),
                      margin: EdgeInsets.symmetric(horizontal: width / 15),
                      child: InkWell(
                        hoverColor: Colors.transparent,
                        child: Column(
                          children: [
                            Image.asset(
                              pathofimages[index],
                              height: height / 8,
                              width: width / 8,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(people[index]),
                                // Icon(
                                //   _isExpanded[index] ? Icons.expand_less : Icons.expand_more,
                                // ),
                              ],
                            )
                          ],
                        ),
                        // onTap: () {
                        //   setState(() {
                        //     _isExpanded[index] = !_isExpanded[index];
                        //   });
                        // },

                        onTap: () {
                          if (index == 0) {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (_) => ChooseLabRad_Screen()));
                          }
                          else if (index == 1) {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (_) => DoctorDrawerScreen()));
                          }
                          else if (index == 2) {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (_) => ShowNurseScreen()));
                          }
                        },
                      ),
                    ),
                    // if (_isExpanded[index])
                    //   Column(
                    //     children: _getSubItems(index),
                  ],
                ),
              );
            }),
          ),
        ),
      ),
    );
  }

// List<Widget> _getSubItems(int index) {
//   switch (index) {
//     case 0:
//       return [
//         ListOfSatff(
//             ['فني المخبر', 'فني عمليات', 'فني الاشغة'], ['images/img_1.png', 'images/img_2.png', 'images/img_3.png'])
//       ];
//     case 1:
//       return [
//         ListOfSatff(
//             ['فني المخبر', 'فني عمليات', 'فني الاشغة'], ['images/img_1.png', 'images/img_2.png', 'images/img_3.png'])
//       ];
//     case 2:
//       return [
//         ListOfSatff(
//             ['فني المخبر', 'فني عمليات', 'فني الاشغة'], ['images/img_1.png', 'images/img_2.png', 'images/img_3.png'])
//       ];
//
//     default:
//       return [];
//   }
// }
//
// Widget ListOfSatff(List<String> names, List<String> listOfImages) {
//   var height = MediaQuery.of(context).size.height;
//   var width = MediaQuery.of(context).size.width;
//   return ListView.builder(
//     shrinkWrap: true,
//     itemCount: names.length,
//     itemBuilder: (ctx, index) => Container(
//       padding: const EdgeInsets.all(10),
//       child: Column(
//         children: [
//           Container(
//               padding: const EdgeInsets.all(10),
//               decoration: BoxDecoration(
//                 boxShadow: MyColor.boxshadow,
//                 borderRadius: const BorderRadius.all(
//                   Radius.circular(12),
//                 ),
//                 color: Colors.white,
//               ),
//               child: Column(
//                 children: [
//                   Image.asset(
//                     listOfImages[index],
//                     height: height / 9,
//                     width: width / 9,
//                   ),
//                   Text(names[index]),
//                 ],
//               )),
//         ],
//       ),
//     ),
//   );
// }
}
