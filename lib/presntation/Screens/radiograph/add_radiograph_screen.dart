import 'package:flutter/material.dart';
import 'package:hospital/presntation/Screens/radiograph/show_radiograph_notification_screen.dart';
import 'package:hospital/presntation/Screens/radiograph/show_radiograph_screen.dart';

import '../../../constances/mycolor.dart';

class AddRadiographScreen extends StatefulWidget {
  const AddRadiographScreen({super.key});

  @override
  State<AddRadiographScreen> createState() => _AddRadiographScreenState();
}

class _AddRadiographScreenState extends State<AddRadiographScreen> {
  int currentIndex = 0;

  List listOfImages = [
    'images/img_5.png',
    'images/img_6.png',
  ];

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: MyColor.myBlue,
      body: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Expanded(
            flex: 11,
            child: Column(
              children: [
                Align(
                    alignment: Alignment.topCenter,
                    child: Image.asset(
                      'images/img_4.png',
                      height: width / 20,
                      width: width / 10,
                    )),
                SizedBox(
                  width: width / 2.5,
                ),
                currentIndex == 0 ? const ShowRadiographScreen() : currentIndex == 1 ? const ShowRadiographNotificationScreen() : Container(),
              ],
            ),
          ),
          // const Expanded(child: )) ,
          Expanded(
            child: Container(
              child: Stack(
                alignment: Alignment.centerRight,
                children: <Widget>[
                  Positioned(
                    child: Container(
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          bottomLeft: Radius.circular(20),
                        ),
                        color: MyColor.mykhli,
                      ),
                      width: width / 23, // Adjust the width as needed
                    ),
                  ),
                  Container(
                    width: 100,
                    padding: EdgeInsets.only(
                      right: width / 35,
                    ),
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: listOfImages.length,
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () {
                            setState(() {
                              currentIndex = index;
                            });
                          },
                          child: Container(
                            padding: const EdgeInsets.symmetric(vertical: 20),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: MyColor.myBlue2,
                              boxShadow: MyColor.boxshadow,
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Image.asset(
                                listOfImages[index],
                                height: width / 35,
                                width: width / 35,
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
