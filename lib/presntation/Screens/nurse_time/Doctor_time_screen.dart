import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../bussines_logic/nurse_schedule_cubit/nurse_schedule_cubit.dart';
import '../../../constances/mycolor.dart';

class DoctorTimeScreen extends StatefulWidget {
  const DoctorTimeScreen({super.key, required this.id});

  final int id ;

  @override
  State<DoctorTimeScreen> createState() => _DoctorTimeScreenState();
}

class _DoctorTimeScreenState extends State<DoctorTimeScreen> {
  bool isexpand1 = false;
  bool isexpand2 = false;
  bool isexpand3 = false;
  bool isexpand4 = false;
  bool isexpand5 = false;
  bool isexpand6 = false;
  bool isexpand7 = false;

  bool isFulled1 = false;
  bool isFulled2 = false;
  bool isFulled3 = false;
  bool isFulled4 = false;
  bool isFulled5 = false;
  bool isFulled6 = false;
  bool isFulled7 = false;

  var day = TextEditingController();

  var start = TextEditingController();

  var end = TextEditingController();

  List hh = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColor.myBlue,
      appBar: AppBar(
        backgroundColor: MyColor.mykhli,
        title: const Text(
          'اضافة اوقات الدوام',
          style: TextStyle(
              fontWeight: FontWeight.bold, fontSize: 25, color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(26.0),
          child: SafeArea(
            child: Column(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    InkWell(
                      onTap: () {
                        if (!isFulled1) {
                          print('clicked');
                          setState(() {
                            isexpand1 = !isexpand1;
                          });
                        }
                      },
                      child: Container(
                        padding: const EdgeInsets.all(10),
                        width: double.infinity,
                        decoration: const BoxDecoration(
                          color: Colors.white,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              'الدوام الاول',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w400),
                            ),
                            isFulled1
                                ? const Icon(
                              Icons.check,
                              color: Colors.green,
                            )
                                : Container(),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    isexpand1
                        ? Center(
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
                                  borderRadius: BorderRadius.circular(
                                      8.0), // Customize borderRadius
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                      color: Color.fromRGBO(
                                          173, 173, 173, 1),
                                      width: 1.0),
                                  borderRadius: BorderRadius.circular(
                                      8.0), // Customize borderRadius
                                ),
                              ),
                            ),
                          ),
                          TextFieldToAddInformationReception(
                              12, 'start', start),
                          TextFieldToAddInformationReception(
                              13, 'end', end),
                          InkWell(
                            onTap: () {
                              hh.add({
                                "day": day.text,
                                "startTime": start.text.split(','),
                                "endTime": end.text.split(',') ,
                              });
                              setState(() {
                                day.clear();
                                start.clear();
                                end.clear();
                                isFulled1 = true;
                                isexpand1 = false;
                              });
                            },
                            child: Container(
                              padding: const EdgeInsets.all(15),
                              decoration: BoxDecoration(
                                  color: MyColor.mykhli,
                                  borderRadius:
                                  BorderRadius.circular(25)),
                              child: const Text(
                                'save',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 15,
                                    fontWeight: FontWeight.w400),
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                        : Container(),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    InkWell(
                      onTap: () {
                        if (!isFulled2) {
                          print('clicked');
                          setState(() {
                            isexpand2 = !isexpand2;
                          });
                        }
                      },
                      child: Container(
                        padding: const EdgeInsets.all(10),
                        width: double.infinity,
                        decoration: const BoxDecoration(
                          color: Colors.white,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              'الدوام الثاني',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w400),
                            ),
                            isFulled2
                                ? const Icon(
                              Icons.check,
                              color: Colors.green,
                            )
                                : Container(),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    isexpand2
                        ? Center(
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
                                  borderRadius: BorderRadius.circular(
                                      8.0), // Customize borderRadius
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                      color: Color.fromRGBO(
                                          173, 173, 173, 1),
                                      width: 1.0),
                                  borderRadius: BorderRadius.circular(
                                      8.0), // Customize borderRadius
                                ),
                              ),
                            ),
                          ),
                          TextFieldToAddInformationReception(
                              12, 'start', start),
                          TextFieldToAddInformationReception(
                              13, 'end', end),
                          InkWell(
                            onTap: () {
                              hh.add({
                                "day": day.text,
                                "startTime": start.text.split(','),
                                "endTime": end.text.split(',') ,
                              });
                              setState(() {
                                day.clear();
                                start.clear();
                                end.clear();
                                isFulled2 = true;
                                isexpand2 = false;
                              });
                            },
                            child: Container(
                              padding: const EdgeInsets.all(15),
                              decoration: BoxDecoration(
                                  color: MyColor.mykhli,
                                  borderRadius:
                                  BorderRadius.circular(25)),
                              child: const Text(
                                'save',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 15,
                                    fontWeight: FontWeight.w400),
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                        : Container(),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    InkWell(
                      onTap: () {
                        if (!isFulled3) {
                          print('clicked');
                          setState(() {
                            isexpand3 = !isexpand3;
                          });
                        }
                      },
                      child: Container(
                        padding: const EdgeInsets.all(10),
                        width: double.infinity,
                        decoration: const BoxDecoration(
                          color: Colors.white,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              'الدوام الثالث',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w400),
                            ),
                            isFulled3
                                ? const Icon(
                              Icons.check,
                              color: Colors.green,
                            )
                                : Container(),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    isexpand3
                        ? Center(
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
                                  borderRadius: BorderRadius.circular(
                                      8.0), // Customize borderRadius
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                      color: Color.fromRGBO(
                                          173, 173, 173, 1),
                                      width: 1.0),
                                  borderRadius: BorderRadius.circular(
                                      8.0), // Customize borderRadius
                                ),
                              ),
                            ),
                          ),
                          TextFieldToAddInformationReception(
                              12, 'start', start),
                          TextFieldToAddInformationReception(
                              13, 'end', end),
                          InkWell(
                            onTap: () {
                              hh.add({
                                "day": day.text,
                                "startTime": start.text.split(','),
                                "endTime": end.text.split(',')
                              });
                              setState(() {
                                day.clear();
                                start.clear();
                                end.clear();
                                isFulled3 = true;
                                isexpand3 = false;
                              });
                            },
                            child: Container(
                              padding: const EdgeInsets.all(15),
                              decoration: BoxDecoration(
                                  color: MyColor.mykhli,
                                  borderRadius:
                                  BorderRadius.circular(25)),
                              child: const Text(
                                'save',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 15,
                                    fontWeight: FontWeight.w400),
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                        : Container(),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    InkWell(
                      onTap: () {
                        if (!isFulled4) {
                          print('clicked');
                          setState(() {
                            isexpand4 = !isexpand4;
                          });
                        }
                      },
                      child: Container(
                        padding: const EdgeInsets.all(10),
                        width: double.infinity,
                        decoration: const BoxDecoration(
                          color: Colors.white,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              'الدوام الرابع',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w400),
                            ),
                            isFulled4
                                ? const Icon(
                              Icons.check,
                              color: Colors.green,
                            )
                                : Container(),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    isexpand4
                        ? Center(
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
                                  borderRadius: BorderRadius.circular(
                                      8.0), // Customize borderRadius
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                      color: Color.fromRGBO(
                                          173, 173, 173, 1),
                                      width: 1.0),
                                  borderRadius: BorderRadius.circular(
                                      8.0), // Customize borderRadius
                                ),
                              ),
                            ),
                          ),
                          TextFieldToAddInformationReception(
                              12, 'start', start),
                          TextFieldToAddInformationReception(
                              13, 'end', end),
                          InkWell(
                            onTap: () {
                              hh.add({
                                "day": day.text,
                                "startTime": start.text.split(','),
                                "endTime": end.text.split(',') ,
                              });
                              setState(() {
                                day.clear();
                                start.clear();
                                end.clear();
                                isFulled4 = true;
                                isexpand4 = false;
                              });
                            },
                            child: Container(
                              padding: const EdgeInsets.all(15),
                              decoration: BoxDecoration(
                                  color: MyColor.mykhli,
                                  borderRadius:
                                  BorderRadius.circular(25)),
                              child: const Text(
                                'save',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 15,
                                    fontWeight: FontWeight.w400),
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                        : Container(),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    InkWell(
                      onTap: () {
                        if (!isFulled5) {
                          print('clicked');
                          setState(() {
                            isexpand5 = !isexpand5;
                          });
                        }
                      },
                      child: Container(
                        padding: const EdgeInsets.all(10),
                        width: double.infinity,
                        decoration: const BoxDecoration(
                          color: Colors.white,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              'الدوام الخامس',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w400),
                            ),
                            isFulled5
                                ? const Icon(
                              Icons.check,
                              color: Colors.green,
                            )
                                : Container(),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    isexpand5
                        ? Center(
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
                                  borderRadius: BorderRadius.circular(
                                      8.0), // Customize borderRadius
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                      color: Color.fromRGBO(
                                          173, 173, 173, 1),
                                      width: 1.0),
                                  borderRadius: BorderRadius.circular(
                                      8.0), // Customize borderRadius
                                ),
                              ),
                            ),
                          ),
                          TextFieldToAddInformationReception(
                              12, 'start', start),
                          TextFieldToAddInformationReception(
                              13, 'end', end),
                          InkWell(
                            onTap: () {
                              hh.add({
                                "day": day.text,
                                "startTime": start.text.split(','),
                                "endTime": end.text.split(',') ,
                              });
                              setState(() {
                                day.clear();
                                start.clear();
                                end.clear();
                                isFulled5 = true;
                                isexpand5 = false;
                              });
                            },
                            child: Container(
                              padding: const EdgeInsets.all(15),
                              decoration: BoxDecoration(
                                  color: MyColor.mykhli,
                                  borderRadius:
                                  BorderRadius.circular(25)),
                              child: const Text(
                                'save',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 15,
                                    fontWeight: FontWeight.w400),
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                        : Container(),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    InkWell(
                      onTap: () {
                        if (!isFulled6) {
                          print('clicked');
                          setState(() {
                            isexpand6 = !isexpand6;
                          });
                        }
                      },
                      child: Container(
                        padding: const EdgeInsets.all(10),
                        width: double.infinity,
                        decoration: const BoxDecoration(
                          color: Colors.white,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              'الدوام السادس',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w400),
                            ),
                            isFulled6
                                ? const Icon(
                              Icons.check,
                              color: Colors.green,
                            )
                                : Container(),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    isexpand6
                        ? Center(
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
                                  borderRadius: BorderRadius.circular(
                                      8.0), // Customize borderRadius
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                      color: Color.fromRGBO(
                                          173, 173, 173, 1),
                                      width: 1.0),
                                  borderRadius: BorderRadius.circular(
                                      8.0), // Customize borderRadius
                                ),
                              ),
                            ),
                          ),
                          TextFieldToAddInformationReception(
                              12, 'start', start),
                          TextFieldToAddInformationReception(
                              13, 'end', end),
                          InkWell(
                            onTap: () {
                              hh.add({
                                "day": day.text,
                                "startTime": start.text.split(','),
                                "endTime": end.text.split(',') ,
                              });
                              setState(() {
                                day.clear();
                                start.clear();
                                end.clear();
                                isFulled6 = true;
                                isexpand6 = false;
                              });
                            },
                            child: Container(
                              padding: const EdgeInsets.all(15),
                              decoration: BoxDecoration(
                                  color: MyColor.mykhli,
                                  borderRadius:
                                  BorderRadius.circular(25)),
                              child: const Text(
                                'save',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 15,
                                    fontWeight: FontWeight.w400),
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                        : Container(),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    InkWell(
                      onTap: () {
                        if (!isFulled7) {
                          print('clicked');
                          setState(() {
                            isexpand7 = !isexpand7;
                          });
                        }
                      },
                      child: Container(
                        padding: const EdgeInsets.all(10),
                        width: double.infinity,
                        decoration: const BoxDecoration(
                          color: Colors.white,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              'الدوام السابع',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w400),
                            ),
                            isFulled7
                                ? const Icon(
                              Icons.check,
                              color: Colors.green,
                            )
                                : Container(),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    isexpand7
                        ? Center(
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
                                  borderRadius: BorderRadius.circular(
                                      8.0), // Customize borderRadius
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                      color: Color.fromRGBO(
                                          173, 173, 173, 1),
                                      width: 1.0),
                                  borderRadius: BorderRadius.circular(
                                      8.0), // Customize borderRadius
                                ),
                              ),
                            ),
                          ),
                          TextFieldToAddInformationReception(
                              12, 'start', start),
                          TextFieldToAddInformationReception(
                              13, 'end', end),
                          InkWell(
                            onTap: () {
                              hh.add({
                                "day": day.text,
                                "startTime": start.text.split(','),
                                "endTime": end.text.split(',') ,
                              });
                              setState(() {
                                day.clear();
                                start.clear();
                                end.clear();
                                isFulled7 = true;
                                isexpand7 = false;
                              });
                            },
                            child: Container(
                              padding: const EdgeInsets.all(15),
                              decoration: BoxDecoration(
                                  color: MyColor.mykhli,
                                  borderRadius:
                                  BorderRadius.circular(25)),
                              child: const Text(
                                'save',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 15,
                                    fontWeight: FontWeight.w400),
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                        : Container(),
                  ],
                ),
                BlocListener<NurseScheduleCubit, NurseScheduleState>(
                  listener: (context, state) {
                    if (state.nurseStatus == NurseScheduleStatus.success) {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('done successfully'))) ;
                    }
                  },
                  child: InkWell(
                    onTap: () async {
                      await BlocProvider.of<NurseScheduleCubit>(context).addDoctorSchedule(widget.id, hh) ;
                    },
                    child: Container(
                      padding: const EdgeInsets.all(15),
                      decoration: BoxDecoration(
                          color: MyColor.mykhli,
                          borderRadius: BorderRadius.circular(25)),
                      child: const Text(
                        'save all',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                            fontWeight: FontWeight.w400),
                      ),
                    ),
                  ),
                ),
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
          decoration: BoxDecoration(
            color: MyColor.mykhli,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Center(
              child: Text(
                dailyname,
                style: const TextStyle(
                    color: Colors.white, fontSize: 16, fontWeight: FontWeight.w500),
              )),
        ),
        Container(
          decoration: BoxDecoration(
              color: MyColor.mykhli, borderRadius: BorderRadius.circular(15)),
          child: ElevatedButton(
            onPressed: () {},
            child: const Text(
              'Save',
              style: TextStyle(
                  color: Colors.grey,
                  fontWeight: FontWeight.w500,
                  fontSize: 20),
            ),
          ),
        ),
      ],
    );
  }

  Column TextFieldToAddInformationReception(
      int index, String startEnd, TextEditingController controller) {
    var width = MediaQuery.of(context).size.width;
    return Column(
      children: [
        Text(
          startEnd,
          style: const TextStyle(
              color: Colors.black, fontSize: 15, fontWeight: FontWeight.w400),
        ),
        SizedBox(
          width: width / 4,
          height: 50,
          child: TextFormField(
            controller: controller,
            decoration: InputDecoration(
              fillColor: Colors.white,
              filled: true,
              border: OutlineInputBorder(
                borderRadius:
                BorderRadius.circular(8.0), // Customize borderRadius
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                    color: Color.fromRGBO(173, 173, 173, 1), width: 1.0),
                borderRadius:
                BorderRadius.circular(8.0), // Customize borderRadius
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
      ],
    );
  }
}
