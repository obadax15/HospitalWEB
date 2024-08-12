import 'package:flutter/material.dart';
import 'package:flutter/material.dart%20';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hospital/bussines_logic/create_doctor_cubit/create_doctor_cubit.dart';
import 'package:hospital/bussines_logic/doctor_cubit/doctor_cubit.dart';

import '../../../constances/mycolor.dart';
import '../admin/add_Reception/addreception.dart';

class CreateDoctorScreen extends StatefulWidget {
  const CreateDoctorScreen({super.key, required this.isediting, this.details , this.id});

  final bool isediting;
  final Map? details ;
  final int? id ;

  @override
  State<CreateDoctorScreen> createState() => _CreateDoctorScreenState();
}

class _CreateDoctorScreenState extends State<CreateDoctorScreen> {
  ReceptionController receptionController = ReceptionController();

  String spValue = "currentValue";

  int valueIndex = 0;

  @override
  void initState() {
    if (widget.details != null) {
      receptionController.controllers[1].text = widget.details!['fullName'];
      receptionController.controllers[3].text = widget.details!['phoneNumber'];
      receptionController.controllers[2].text = widget.details!['fatherName'];
      receptionController.controllers[0].text = widget.details!['motherName'];
      receptionController.controllers[4].text = widget.details!['internationalNumber'];
      receptionController.controllers[5].text = widget.details!['currentLocation'];
      receptionController.controllers[7].text = widget.details!['gender']== 1 ? 'Male' : "Female";
      receptionController.controllers[6].text = widget.details!['birthdate'];
    }
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      await BlocProvider.of<DoctorCubit>(context).getSpe();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    List<String> people = [
      'اسم ونسبة الأم',
      '',
      'اسم ونسبة الأب',
      'الرقم  الشخصي',
      'الرقم  الوطني  ',
      'العنوان',
      'تاريخ الولادة',
      'الجنس',
    ];
    return Scaffold(
      backgroundColor: const Color.fromRGBO(175, 216, 251, 0.3),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 30.0, left: 30, top: 30),
            child: AppBarContianer(width, height),
          ),
          const SizedBox(
            height: 30,
          ),
          Expanded(
            flex: 7,
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, // Number of columns
                childAspectRatio: height / 120, crossAxisSpacing: width / 30,
              ),
              itemCount: receptionController.controllers.length,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: width / 13,
                      ),
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: Text(
                          index == 1 ? 'الاسم الثلاثي' : people[index],
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: width / 3,
                      height: height / 18,
                      child: index == 8
                          ? TextFormField(
                              controller: receptionController.controllers[8],
                            )
                          : TextFieldToAddInformationReception(index),
                    ),
                  ],
                );
              },
            ),
          ),
          Expanded(flex: 1, child: customDropDownButton()),
          Expanded(flex: 1, child: ButtonToAddReception(height, width)),
        ],
      ),
    );
  }

  Container AppBarContianer(double width, double height) {
    return Container(
      width: width,
      height: height / 12,
      decoration: BoxDecoration(
        boxShadow: MyColor.boxshadow,
        borderRadius: const BorderRadius.all(
          Radius.circular(12),
        ),
        color: Colors.white,
      ),
      child: Center(
          child: Text(
        widget.isediting == true
            ? ' الدكتور ${receptionController.controllers[1].text}'
            : 'أضافة دكتور',
        style: const TextStyle(fontSize: 34, fontWeight: FontWeight.bold),
      )),
    );
  }

  Widget customDropDownButton() {
    return BlocBuilder<DoctorCubit, DoctorState>(
      builder: (context, state) {
        if (state.doctorStatus == DoctorStatus.loading) {
          return const CircularProgressIndicator(
            color: MyColor.mykhli,
          );
        }
        if (BlocProvider.of<DoctorCubit>(context).sp == null) {
          return const CircularProgressIndicator(
            color: MyColor.mykhli,
          );
        }
        List sp = BlocProvider.of<DoctorCubit>(context).sp;
        List s = [];
        s.add('currentValue');
        for (var e in sp) {
          s.add(e['name']);
        }
        return Container(
          decoration: const BoxDecoration(
            color: Colors.white,
          ),
          width: 200,
          child: DropdownButton(
            value: spValue,
            items: s.map((val) {
              return DropdownMenuItem(
                value: val,
                child: Text(val),
              );
            }).toList(),
            onChanged: (value) {
              setState(() {
                spValue = value as String;
                for (int i = 0; i < sp.length; i++) {
                  if (sp[i]['name'] == spValue) {
                    valueIndex = sp[i]['id'];
                  }
                }
              });
            },
          ),
        );
      },
    );
  }

  Widget ButtonToAddReception(double height, double width) {
    return BlocListener<CreateDoctorCubit, CreateDoctorState>(
      listener: (context, state) {
        if (state.doctorStatus == CreateDoctorStatus.success) {
          ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text("Doctor created successfully")));
        }
      },
      child: Align(
        alignment: Alignment.centerRight,
        child: Container(
          margin: EdgeInsets.only(bottom: height / 17, right: width / 13),
          decoration: BoxDecoration(
            boxShadow: MyColor.boxshadow,
            color: const Color.fromRGBO(65, 99, 142, 1),
            borderRadius: BorderRadius.circular(8),
          ),
          height: height / 20,
          width: width / 8,
          child: Center(
            child: InkWell(
              onTap: () async {
                if (widget.isediting) {
                  await BlocProvider.of<CreateDoctorCubit>(context).editDoctor(
                    receptionController.controllers[1].text,
                    receptionController.controllers[3].text,
                    receptionController.controllers[2].text,
                    receptionController.controllers[0].text,
                    receptionController.controllers[4].text,
                    receptionController.controllers[5].text,
                    receptionController.controllers[7].text,
                    receptionController.controllers[6].text,
                    widget.id!,
                  );
                } else {
                  await BlocProvider.of<CreateDoctorCubit>(context).createDoctor(
                    receptionController.controllers[1].text,
                    receptionController.controllers[3].text,
                    receptionController.controllers[2].text,
                    receptionController.controllers[0].text,
                    receptionController.controllers[4].text,
                    receptionController.controllers[5].text,
                    receptionController.controllers[7].text,
                    receptionController.controllers[6].text,
                    valueIndex,
                  );
                }
              },
              child: Text(
                widget.isediting == true ? 'تعديل' : 'انشاء حساب',
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ),
      ),
    );
  }

  TextFormField TextFieldToAddInformationReception(int index) {
    return TextFormField(
      controller: receptionController.controllers[index],
      decoration: InputDecoration(
        fillColor: Colors.white,
        filled: true,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0), // Customize borderRadius
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(
              color: Color.fromRGBO(173, 173, 173, 1), width: 1.0),
          borderRadius: BorderRadius.circular(8.0), // Customize borderRadius
        ),
      ),
    );
  }
}
