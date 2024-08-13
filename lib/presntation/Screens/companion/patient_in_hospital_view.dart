import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart%20';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hospital/bussines_logic/check_cubit/check_cubit.dart';
import 'package:hospital/bussines_logic/view-patient_cubit/view_patient_cubit.dart';
import 'package:hospital/constances/mycolor.dart';
import 'package:hospital/presntation/Screens/companion/create_companion_screen.dart';
import 'package:hospital/presntation/Screens/companion/get_companion_screen.dart';
import 'package:hospital/presntation/Screens/reception/screens/addPatient/add_Patient.dart';

class PatientInHospitalView extends StatefulWidget {
  const PatientInHospitalView({super.key});

  @override
  State<PatientInHospitalView> createState() => _PatientInHospitalViewState();
}

class _PatientInHospitalViewState extends State<PatientInHospitalView> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      await BlocProvider.of<ViewPatientCubit>(context).getPatientIn();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: BlocBuilder<ViewPatientCubit, View_Patient_State>(
        builder: (context, state) {
          if (state.view_patient_status == View_Patient_Status.loading) {
            return const CircularProgressIndicator(
              color: MyColor.mykhli,
            );
          }
          if (BlocProvider.of<ViewPatientCubit>(context).rr3 == null) {
            return const CircularProgressIndicator(
              color: MyColor.mykhli,
            );
          }
          List rr = BlocProvider.of<ViewPatientCubit>(context).rr3;
          return Padding(
            padding: const EdgeInsets.all(10),
            child: Expanded(
              child: Column(
                children: [
                  Container(
                    height: 70,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Icon(Icons.search_outlined),
                            Text(
                              'ابحث هنا',
                              style:
                              TextStyle(color: Colors.grey, fontSize: 12),
                            ),
                          ],
                        ),
                        Padding(
                          padding: EdgeInsets.only(right: 25.0),
                          child: Text(
                            'البحث عن مريض',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 26,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Column(
                        children: [
                          const Padding(
                            padding: EdgeInsets.all(20.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'المرافق',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 25,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  'الحالة',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 25,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  'رقم الموبايل',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 25,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  ' اسم المريض',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 25,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ),
                          const Padding(padding: EdgeInsets.all(30)),
                          Expanded(
                            child: ListView.builder(
                              itemCount: rr.length,
                              itemBuilder: (_, index) {
                                return Padding(
                                padding: const EdgeInsets.only(
                                    left: 50.0, right: 20),
                                child: Row(
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                                  children: [
                                    IconButton(
                                      onPressed: () {
                                        showDialog(
                                          context: context,
                                          builder: (context) {
                                            return Directionality(
                                              textDirection: TextDirection.rtl,
                                              child: AlertDialog(
                                                title: const Text(
                                                  'خيارات',
                                                  style: TextStyle(
                                                      color: MyColor.mykhli,
                                                      fontSize: 18,
                                                      fontWeight:
                                                      FontWeight.w400),
                                                ),
                                                content: Column(
                                                  mainAxisSize:
                                                  MainAxisSize.min,
                                                  children: [
                                                    InkWell(
                                                      onTap: () {
                                                        Navigator.of(context).push(
                                                            MaterialPageRoute(
                                                                builder: (_) =>
                                                                    CreateCompanionScreen(
                                                                        id: rr[index]
                                                                        [
                                                                        'id'])));
                                                      },
                                                      child: const Text(
                                                        'اضافة مرافق',
                                                        style: TextStyle(
                                                            color:
                                                            MyColor.myBlue2,
                                                            fontSize: 18,
                                                            fontWeight:
                                                            FontWeight
                                                                .w400),
                                                      ),
                                                    ),
                                                    const SizedBox(height: 10),
                                                    const Divider(
                                                      color: Colors.black12,
                                                    ),
                                                    const SizedBox(height: 10),
                                                    InkWell(
                                                      onTap: () {
                                                        Navigator.of(context).push(
                                                            MaterialPageRoute(
                                                                builder: (_) =>
                                                                    GetCompanionScreen(
                                                                      id: rr[index]
                                                                      [
                                                                      'id'],
                                                                    )));
                                                      },
                                                      child: const Text(
                                                        'عرض المرافق',
                                                        style: TextStyle(
                                                            color:
                                                            MyColor.myBlue2,
                                                            fontSize: 18,
                                                            fontWeight:
                                                            FontWeight
                                                                .w400),
                                                      ),
                                                    )
                                                  ],
                                                ),
                                              ),
                                            );
                                          },
                                        );
                                      },
                                      icon: const Icon(
                                        Icons.person_2_outlined,
                                        size: 25,
                                      ),
                                    ),
                                    BlocListener<CheckCubit, CheckState>(
                                      listener: (context, state) {
                                        if (state.checkStatus ==
                                            CheckStatus.success) {
                                          if (rr[index]['deleted_at'] == null) {
                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(const SnackBar(
                                                content: Text(
                                                    'check out successfully')));
                                          } else {
                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(const SnackBar(
                                                content: Text(
                                                    'restore successfully')));
                                          }
                                        }
                                      },
                                      child: InkWell(
                                        onTap: () async {
                                          if (rr[index]['deleted_at'] == null) {
                                            await BlocProvider.of<CheckCubit>(
                                                context)
                                                .checkOut(rr[index]['id']);
                                          } else {
                                            await BlocProvider.of<CheckCubit>(
                                                context)
                                                .restorePatient(
                                                rr[index]['id']);
                                          }
                                        },
                                        child: Container(
                                          alignment: Alignment.center,
                                          width: 50,
                                          height: 30,
                                          decoration: BoxDecoration(
                                            color:
                                            rr[index]['deleted_at'] == null
                                                ? Colors.green
                                                : Colors.red,
                                            borderRadius:
                                            BorderRadius.circular(12),
                                          ),
                                          child: Text(
                                            rr[index]['deleted_at'] == null
                                                ? 'in'
                                                : 'out',
                                            style: const TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.w400,
                                                color: Colors.white),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Text(
                                      rr[index]['phoneNumber'],
                                      style: const TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w400,
                                          color: Colors.black45),
                                    ),
                                    InkWell(
                                      onTap: () {
                                        Navigator.of(context).push(MaterialPageRoute(builder: (_) => Add_Patient(details: rr[index], id: rr[index]['id'],))) ;
                                      },
                                      child: Text(
                                        rr[index]['fullName'],
                                        style: const TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.w400,
                                            color: Colors.black45),
                                      ),
                                    ),
                                  ],
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
            ),
          );
        },
      ),
    );
  }
}
