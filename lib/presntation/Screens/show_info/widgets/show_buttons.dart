import 'package:flutter/material.dart';
import 'package:hospital/constances/mycolor.dart';
class ShowButton extends StatelessWidget {
  final int index;

  const ShowButton({super.key,  required this.index});

  @override
  Widget build(BuildContext context) {
    List listofimages=['images/img_5.png','images/img_6.png','images/img_7.png','images/img_8.png','images/img_9.png'];
    var width = MediaQuery.of(context).size.width;
    return Container(padding: const EdgeInsets.symmetric(vertical: 20),

      decoration:  BoxDecoration(shape: BoxShape.circle, color: MyColor.myBlue2,boxShadow: MyColor.boxshadow),
      child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: GestureDetector(child: Image.asset(listofimages[index],height: width/35,width: width/35,),)
      ),
    );
  }
}
