import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hospital/bussines_logic/create_companion_cubit/create_companion_cubit.dart';

import '../../../constances/mycolor.dart';

class CreateCompanionScreen extends StatefulWidget {
  const CreateCompanionScreen({super.key, required this.id, this.details});

  final int id;

  final Map? details;

  @override
  State<CreateCompanionScreen> createState() => _CreateCompanionScreenState();
}

class _CreateCompanionScreenState extends State<CreateCompanionScreen> {
  List receptionController = [
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
  ];

  @override
  void initState() {
    if (widget.details != null) {
      receptionController[0].text = widget.details!['fullName'];
      receptionController[1].text = widget.details!['phoneNumber'];
      receptionController[2].text = widget.details!['internationalNumber'];
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    List<String> people = [
      '',
      'الرقم  الشخصي',
      'الرقم  الوطني  ',
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
              itemCount: receptionController.length,
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
                          index == 0 ? 'الاسم الثلاثي' : people[index],
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
            widget.details != null ? 'تعديل مرافق': 'أضافة مرافق',
        style: const TextStyle(fontSize: 34, fontWeight: FontWeight.bold),
      )),
    );
  }

  Widget ButtonToAddReception(double height, double width) {
    return BlocListener<CreateCompanionCubit, CreateCompanionState>(
      listener: (context, state) {
        if (state.createCompanionStatus == CreateCompanionStatus.success) {
          ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text("done successfully")));
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
                  await BlocProvider.of<CreateCompanionCubit>(context)
                      .editCompanion(
                    receptionController[0].text,
                    receptionController[1].text,
                    receptionController[2].text,
                    widget.id,
                  );
                } else {
                  await BlocProvider.of<CreateCompanionCubit>(context)
                      .createCompanion(
                    receptionController[0].text,
                    receptionController[1].text,
                    receptionController[2].text,
                    widget.id,
                  );
                }
              },
              child: Text(
                widget.details != null ? 'تعديل': 'اضافة مرافق',
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
      controller: receptionController[index],
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
