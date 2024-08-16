import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hospital/bussines_logic/check_cubit/check_cubit.dart';
import 'package:hospital/bussines_logic/patient_cubit/patient_cubit.dart';
import 'package:hospital/bussines_logic/view-patient_cubit/view_patient_cubit.dart';

import '../../../constances/mycolor.dart';

class PatientGridView extends StatefulWidget {
  const PatientGridView({super.key, required this.roomID});

  final int roomID;

  @override
  State<PatientGridView> createState() => _PatientGridViewState();
}

class _PatientGridViewState extends State<PatientGridView> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      await BlocProvider.of<ViewPatientCubit>(context).getPatientNotInRoom();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    List<String> pathofimages = [
      'images/img_1.png',
    ];
    return Scaffold(
      backgroundColor: MyColor.myBlue,
      body: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.all(25),
        child: Column(
          children: [
            Container(
              width: 300,
              padding: const EdgeInsets.all(18),
              decoration: BoxDecoration(
                color: MyColor.mykhli,
                borderRadius: BorderRadius.circular(25),
              ),
              child: const Text(
                'المرضى',
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w400),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            BlocBuilder<ViewPatientCubit, View_Patient_State>(
              builder: (context, state) {
                if (state.view_patient_status == View_Patient_Status.loading) {
                  return const CircularProgressIndicator(color: MyColor.mykhli);
                }
                if (BlocProvider.of<ViewPatientCubit>(context).rr4 == null) {
                  return const CircularProgressIndicator(color: MyColor.mykhli);
                }
                List nurse = BlocProvider.of<ViewPatientCubit>(context).rr4;
                return Expanded(
                  child: GridView.builder(
                    physics: const BouncingScrollPhysics(),
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 4, // Number of columns
                            mainAxisExtent: 155,
                            crossAxisSpacing: 50,
                            mainAxisSpacing: 20),
                    itemCount: nurse.length,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          showDialog(
                            context: context,
                            builder: (context) {
                              return Directionality(
                                textDirection: TextDirection.rtl,
                                child: AlertDialog(
                                  title: const Text(
                                    'تاكيد دخول المريض',
                                    style: TextStyle(
                                        color: MyColor.mykhli,
                                        fontSize: 18,
                                        fontWeight: FontWeight.w400),
                                  ),
                                  actions: [
                                    BlocListener<CheckCubit, CheckState>(
                                      listener: (context, state) {
                                        if (state.checkStatus == CheckStatus.success) {
                                          Navigator.of(context).pop() ;
                                          Navigator.of(context).pop() ;
                                          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('check in successfully'))) ;
                                        }
                                      },
                                      child: TextButton(
                                        onPressed: () async {
                                          await BlocProvider.of<CheckCubit>(context).checkIn(widget.roomID, nurse[index]['id']) ;
                                        },
                                        child: const Text(
                                          'تاكيد',
                                          style:
                                              TextStyle(color: MyColor.mykhli),
                                        ),
                                      ),
                                    ),
                                    TextButton(
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                      child: const Text(
                                        'الغاء',
                                        style: TextStyle(color: MyColor.mykhli),
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            },
                          );
                        },
                        child: Container(
                          width: width / 7,
                          height: height / 10,
                          decoration: BoxDecoration(
                            boxShadow: MyColor.boxshadow,
                            borderRadius: const BorderRadius.all(
                              Radius.circular(12),
                            ),
                            color: Colors.white,
                          ),
                          child: Column(
                            children: [
                              Image.asset(
                                pathofimages[0],
                                height: height / 7,
                                width: width / 7,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    nurse[index]['fullName'],
                                    style: TextStyle(fontSize: width / 80),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
