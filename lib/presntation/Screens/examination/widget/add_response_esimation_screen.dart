import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hospital/bussines_logic/add_response_medical_examination_cubit/add_response_medical_examination_cubit.dart';
import 'package:hospital/constances/mycolor.dart';

class AddResponseEstimationScreen extends StatelessWidget {
  AddResponseEstimationScreen({Key? key, required this.id}) : super(key: key);

  final int id ;

  TextEditingController textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddResponseMedicalExaminationCubit, Add_Response_Medical_examination_State>(
      builder: (context, state) {
        return Scaffold(
          body: Column(
            children: [
              Container(width: double.infinity,
                decoration: BoxDecoration(color: MyColor.mykhli),
                child: Text(
                  'اضافة رد للتحالبل',
                  style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
                ),
              ),
              TextFormField(
                controller: textEditingController,
                decoration: InputDecoration(
                  hintText: 'ادخل الرد',
                  hintStyle: TextStyle(fontSize: 12),
                  hintTextDirection: TextDirection.rtl,
                  fillColor: Colors.white,
                  filled: true,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(13.0), // Customize borderRadius
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Color.fromRGBO(173, 173, 173, 1), width: 1.0),
                    borderRadius: BorderRadius.circular(13.0), // Customize borderRadius
                  ),
                ),
              ),
              Container(
                child: IconButton(
                    onPressed: () async {
                      await BlocProvider.of<AddResponseMedicalExaminationCubit>(context)
                          .AddResponseMedicalExamination(textEditingController.text , id);
                    },
                    icon: Icon(Icons.send)),
                decoration: BoxDecoration(shape: BoxShape.circle),
                width: 25,
                height: 25,
              )
            ],
          ),
        );
      },
    );
  }
}
