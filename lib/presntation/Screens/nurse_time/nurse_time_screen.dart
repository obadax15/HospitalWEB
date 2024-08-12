import 'package:flutter/material.dart';
import 'package:flutter/material.dart%20';
import 'package:hospital/constances/mycolor.dart';
import 'package:hospital/presntation/Screens/nurse_time/nurse_controller_time.dart';

class Nurse_Time extends StatefulWidget {
  const Nurse_Time({Key? key}) : super(key: key);

  @override
  State<Nurse_Time> createState() => _Nurse_TimeState();
}

class _Nurse_TimeState extends State<Nurse_Time> {

  bool isexpand1 = false;
  bool isexpand2 = false;
  bool isexpand3 = false;
  bool isexpand4 = false;
  bool isexpand5 = false;
  bool isexpand6 = false;
  bool isexpand7 = false;

  var day = TextEditingController() ;
  var start = TextEditingController() ;
  var end = TextEditingController() ;

  List hh = [] ;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: MyColor.myBlue,
      appBar: AppBar(
        title: Text(
          'اضافة اوقات الدوام',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(26.0),
          child: SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                InkWell(
                  onTap: () {
                    print('clicked') ;
                    setState(() {
                      isexpand1 = !isexpand1;
                    });
                  },
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    width: double.infinity,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                    ),
                    child: const Text(
                      'الدوام الاول',
                      style: TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.w400),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                isexpand1 ? Center(
                  child: Column(
                    children: [
                      SizedBox(
                        width: 200,
                        height: 50,
                        child: TextFormField(
                          controller: day,
                          decoration: InputDecoration(
                            fillColor: Colors.white,
                            filled: true,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8.0), // Customize borderRadius
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: const BorderSide(color: Color.fromRGBO(173, 173, 173, 1), width: 1.0),
                              borderRadius: BorderRadius.circular(8.0), // Customize borderRadius
                            ),
                          ),
                        ),
                      ),
                      TextFieldToAddInformationReception(12, 'start' , start),
                      TextFieldToAddInformationReception(13, 'end' , end),
                      Container(
                        padding: const EdgeInsets.all(15),
                        decoration: BoxDecoration(
                          color: MyColor.mykhli ,
                          borderRadius: BorderRadius.circular(25)
                        ),
                        child: const Text(
                          'save' ,
                          style: TextStyle(
                            color: Colors.white ,
                            fontSize: 15 ,
                            fontWeight: FontWeight.w400
                          ),
                        ),
                      ) ,
                    ],
                  ),
                ):Container(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Row buildContainer(String dailyname) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          width: 200,
          height: 30,
          child: Center(
              child: Text(
            dailyname,
            style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w500),
          )),
          decoration: BoxDecoration(
            color: MyColor.mykhli,
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        Container(
          decoration: BoxDecoration(color: MyColor.mykhli, borderRadius: BorderRadius.circular(15)),
          child: ElevatedButton(
            onPressed: () {},
            child: Text(
              'Save',
              style: TextStyle(color: Colors.grey, fontWeight: FontWeight.w500, fontSize: 20),
            ),
          ),
        ),
      ],
    );
  }

  Column TextFieldToAddInformationReception(
    int index,
    String startEnd,
      TextEditingController controller
  ) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Column(
      children: [
        Text(
          startEnd,
          style: TextStyle(color: Colors.black, fontSize: 15, fontWeight: FontWeight.w400),
        ),
        Container(
          width: width / 4,
          height: 50,
          child: TextFormField(
            controller: controller,
            decoration: InputDecoration(
              fillColor: Colors.white,
              filled: true,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.0), // Customize borderRadius
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Color.fromRGBO(173, 173, 173, 1), width: 1.0),
                borderRadius: BorderRadius.circular(8.0), // Customize borderRadius
              ),
            ),
          ),
        ),
        SizedBox(
          height: 20,
        ),
      ],
    );
  }
}
