import 'package:flutter/material.dart';

import 'package:hospital/constances/mycolor.dart';
import 'package:hospital/presntation/Screens/admin/show_info/widgets/show_buttons.dart';

class Show_Employee_Info extends StatelessWidget {
  const Show_Employee_Info({super.key});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
   return Scaffold(backgroundColor: MyColor.myBlue,
        body: Row(

          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Align(alignment: Alignment.topCenter,
                child: Image.asset('images/img_4.png',height: width/20,width: width/10,)),
            SizedBox(width: width/2.5,),

            Stack(alignment: Alignment.centerRight,

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
                Container(padding: EdgeInsets.only(right: width/35,),
                  child: const Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      ShowButton(index: 0,),
                      ShowButton(index: 1,),
                      ShowButton(index: 2,),
                      ShowButton(index: 3,),
                      ShowButton(index: 4,),
                      ShowButton(index: 0,),
                    ],
                  ),
                )
              ],
            ),
          ],

      ),
    );
  }
}

