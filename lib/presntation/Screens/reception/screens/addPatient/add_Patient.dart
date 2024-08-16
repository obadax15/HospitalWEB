import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hospital/bussines_logic/patient_cubit/patient_cubit.dart';
import 'package:hospital/constances/mycolor.dart';
import 'package:hospital/presntation/Screens/reception/screens/addPatient/controller/addpatierntcontroller.dart';

class Add_Patient extends StatefulWidget {
  final Map? details;

  final int? id;

  final int? roomID;

  const Add_Patient({super.key, this.details, this.id, this.roomID});

  @override
  State<Add_Patient> createState() => _CharacterEditScreenState();
}

class _CharacterEditScreenState extends State<Add_Patient> {
  Patient patient = Patient();

  @override
  void initState() {
    super.initState();
    if (widget.details != null) {
      patient.controllers[1].text = widget.details!['fullName'];
      patient.controllers[3].text = widget.details!['phoneNumber'];
      patient.controllers[2].text = widget.details!['fatherName'];
      patient.controllers[0].text = widget.details!['motherName'];
      patient.controllers[4].text = widget.details!['work'];
      patient.controllers[5].text = widget.details!['currentLocation'];
      patient.controllers[7].text =
          widget.details!['gender'] == 1 ? 'Male' : "Female";
      patient.controllers[6].text = widget.details!['birthdate'];
      patient.controllers[8].text = widget.details!['socialStatus'];
      patient.controllers[9].text = widget.details!['internationalNumber'];
    }
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    List<String> patientinfo = [
      'اسم ونسبة الأم',
      '',
      'اسم ونسبة الأب',
      'الرقم  الشخصي',
      'العمل',
      'محل الولادة',
      "تاريخ الولادة",
      'الجنس',
      'الحالة الاجتماعية',
      'الرقم الوطني',
    ];
    return Scaffold(
      backgroundColor: Colors.transparent,
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
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, // Number of columns
                childAspectRatio: height / 120, crossAxisSpacing: width / 30,
              ),
              itemCount: patientinfo.length,
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
                          index == 1 ? 'الاسم الثلاثي' : patientinfo[index],
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
                      child: TextFieldToAddInformationReception(index),
                    ),
                  ],
                );
              },
            ),
          ),
          ButtonToAddPatient(height, width),
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
        widget.details != null ? 'تعديل مريض' : 'إضافة مريض',
        style: const TextStyle(fontSize: 34, fontWeight: FontWeight.bold),
      )),
    );
  }

  Widget ButtonToAddPatient(double height, double width) {
    return BlocListener<PatientCubit, PatientState>(
        listener: (context, state) {
          if (state.patientStatus == PatientStatus.success) {
            if (widget.details != null) {
              ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text("patient edited successfully")));
            } else {
              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                  content: Text("patient created successfully")));
            }
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
                  if (widget.details != null) {
                    await BlocProvider.of<PatientCubit>(context).edit(
                      patient.controllers[1].text,
                      patient.controllers[3].text,
                      patient.controllers[2].text,
                      patient.controllers[0].text,
                      patient.controllers[9].text,
                      patient.controllers[5].text,
                      patient.controllers[7].text,
                      patient.controllers[6].text,
                      patient.controllers[4].text,
                      patient.controllers[8].text,
                      widget.id!,
                    );
                  } else {
                    await BlocProvider.of<PatientCubit>(context).createPatient(
                        patient.controllers[1].text,
                        patient.controllers[3].text,
                        patient.controllers[2].text,
                        patient.controllers[0].text,
                        patient.controllers[9].text,
                        patient.controllers[5].text,
                        patient.controllers[7].text,
                        patient.controllers[6].text,
                        patient.controllers[4].text,
                        patient.controllers[8].text);
                    await BlocProvider.of<PatientCubit>(context).checkIn(
                        widget.roomID!,
                        BlocProvider.of<PatientCubit>(context).id);
                  }
                },
                child: Text(
                  widget.details != null ? 'تعديل' : 'اضافة',
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
        ));
  }

  TextFormField TextFieldToAddInformationReception(int index) {
    return TextFormField(
      controller: patient.controllers[index],
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
