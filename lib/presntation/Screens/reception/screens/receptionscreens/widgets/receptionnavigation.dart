import 'package:flutter/material.dart';
import 'package:hospital/constances/mycolor.dart';


// ignore: must_be_immutable
class Recption_Navigation extends StatefulWidget {
  Recption_Navigation({super.key, required this.changeIndex, required this.currentindex});

  List<String> people = ['مرضى المستشفى', 'المرضى الموجودين', 'رؤية الغرف' , 'تحليل بيانات'];
  final int currentindex;
  final Function(int index) changeIndex;

  @override
  State<Recption_Navigation> createState() => _Navigation_DrawerState();
}

class _Navigation_DrawerState extends State<Recption_Navigation> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return ListView.builder(
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      itemCount: 4,
      itemBuilder: (context, index) {
        return InkWell(
          onTap: () => widget.changeIndex(index),
          child: Column(
            children: [
              const SizedBox(height: 20,),
              Padding(
                padding: const EdgeInsets.only(left: 8.0,right: 3,top: 8,
                    bottom: 8),
                child: Container(
                  height: width/50,
                  color: index == widget.currentindex ? MyColor.myBlue2 : Colors.transparent,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Padding(
                        padding:  EdgeInsets.only(left:width/300),
                        child: Text(
                          widget.people[index],
                          style: TextStyle(color: Colors.black, fontSize: width / 100, fontWeight: FontWeight.bold),
                        ),
                      ),
                      SizedBox(height: height/12,),
                      index == 0
                          ? Icon(
                        Icons.person_2_outlined,
                        size: width / 60,
                      )
                          : index == 1
                          ? Icon(
                        Icons.group_work,
                        size: width / 60,
                      )
                          : Icon(
                        Icons.sick_outlined,
                        size: width / 60,
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}