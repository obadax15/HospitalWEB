import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart%20';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hospital/bussines_logic/get_examination_notify_cubit/get_examination_notify_cubit.dart';
import 'package:hospital/bussines_logic/get_medical_examination_cubit/get_medical_examination_cubit.dart';
import 'package:hospital/bussines_logic/make_examination_read_cubit/make_examination_read_cubit.dart';
import 'package:hospital/presntation/Screens/examination/widget/add_response_esimation_screen.dart';

import '../../../constances/mycolor.dart';

class AddExaminationScreen extends StatefulWidget {
  const AddExaminationScreen({super.key});

  @override
  State<AddExaminationScreen> createState() => _AddExaminationScreenState();
}

class _AddExaminationScreenState extends State<AddExaminationScreen> {
  int currentIndex = 0;

  List listOfImages = [
    'images/img_5.png',
    'images/img_6.png',
  ];

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      await BlocProvider.of<GetMedicalExaminationCubit>(context).Get_Medical_Examination_Api();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: MyColor.myBlue,
      body: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Expanded(
            child: Column(
              children: [
                Align(
                    alignment: Alignment.topCenter,
                    child: Image.asset(
                      'images/img_4.png',
                      height: width / 20,
                      width: width / 10,
                    )),
                currentIndex == 0 ? MakeListViewExamination() : MakeListViewNotifyExamination(),
              ],
            ),
          ),
          Stack(
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
                      onTap: () async {
                        setState(() {
                          currentIndex = index;
                        });
                        if (currentIndex == 1) {
                          await BlocProvider.of<GetExaminationNotifyCubit>(context).Get_Notify_Examination_Api();
                        }
                        if (currentIndex == 0) {
                          await BlocProvider.of<GetMedicalExaminationCubit>(context).Get_Medical_Examination_Api();
                        }
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(vertical: 100),
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
        ],
      ),
    );
  }

  Widget MakeListViewExamination() {
    return BlocBuilder<GetMedicalExaminationCubit, GetMedicalExaminationState>(
      builder: (context, state) {
        if (state.getMedicalExaminationStatus == GetMedicalExaminationStatus.loading) {
          return CircularProgressIndicator();
        }
        if (BlocProvider.of<GetMedicalExaminationCubit>(context).getallExamination == null) {
          return CircularProgressIndicator();
        }
        List rr = BlocProvider.of<GetMedicalExaminationCubit>(context).getallExamination['Examinations'];
        return Expanded(
          child: ListView.builder(
            itemCount: rr.length,
            itemBuilder: (_, index) => InkWell(
              onTap: (){Navigator.of(context).push(MaterialPageRoute(builder: (_)=>AddResponseEstimationScreen(id : rr[index]['id'])));},

              child: Column(
                children: [
                  const SizedBox(
                    height: 40,
                  ),
                  Container(
                    decoration: BoxDecoration(color: Colors.white60, boxShadow: MyColor.boxshadow),
                    width: 600,
                    child: Column(
                      children: [
                        Text(
                          rr[index]['askExaminations'],
                          style: TextStyle(color: Colors.black, fontSize: 20),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text(rr[index]['response'] == null ? 'not Response' : 'Response'),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget MakeListViewNotifyExamination() {
    return BlocBuilder<GetExaminationNotifyCubit, GetNotifyExaminationState>(
      builder: (context, state) {
        if (state.getNotifyExaminationStatus == GetMedicalExaminationStatus.loading) {
          return CircularProgressIndicator();
        }
        if (BlocProvider.of<GetExaminationNotifyCubit>(context).getallNotifyExamination == null) {
          return CircularProgressIndicator();
        }
        List rr = BlocProvider.of<GetExaminationNotifyCubit>(context).getallNotifyExamination['notification'];
        return Expanded(
          child: ListView.builder(
            itemCount: rr.length,
            itemBuilder: (_, index) => BlocListener<MakeExaminationReadCubit, Make_Examination_Read_State>(
  listener: (context, state) {
    // TODO: implement listener
  },
  child: InkWell(
              onTap: () async {
               await  BlocProvider.of<MakeExaminationReadCubit>(context).makeExaminationRead(rr[index]['id']);

              },
              child: Column(
                children: [
                  SizedBox(
                    height: 40,
                  ),
                  Container(
                    padding: EdgeInsets.all(20),
                    decoration: BoxDecoration(color: Colors.white60, boxShadow: MyColor.boxshadow),
                    width: 600,
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              rr[index]['message'],
                              style: TextStyle(color: Colors.black, fontSize: 20),
                            ),
                            rr[index]['read_at'] == null
                                ? Container(
                                    width: 15,
                                    height: 15,
                                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(8), color: MyColor.mykhli),
                                  )
                                : Container(),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
),
          ),
        );
      },
    );
  }
}
