import 'package:flutter/material.dart';
import 'package:flutter/material.dart%20';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hospital/bussines_logic/add_response_medical_examination_cubit/add_response_medical_examination_cubit.dart';
import 'package:hospital/constances/mycolor.dart';

class AddResponseEstimationScreen extends StatelessWidget {
  AddResponseEstimationScreen({Key? key, required this.id}) : super(key: key);

  final int id ;

  TextEditingController textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;

    return BlocBuilder<AddResponseMedicalExaminationCubit, Add_Response_Medical_examination_State>(
      builder: (context, state) {
        return Scaffold(
          backgroundColor: MyColor.myBlue,
          body: Column(
            children: [
              Container(width: double.infinity,
                height: 70,
                decoration: BoxDecoration(color: MyColor.mykhli,borderRadius: BorderRadius.circular(12)),
                child: Center(
                  child: Text(
                    'اضافة رد للتحاليل',
                    style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold,color: Colors.white),
                  ),
                ),
              ),
              SizedBox(height: width/12,),
              Align(
                alignment: Alignment.center,
                child: Column(
                  children: [
                    Container(
                      width: width/3,
                      height: 50,
                      child: TextFormField(
                        controller: textEditingController,
                        decoration: InputDecoration(
                          hintText: 'ادخل الرد',
                          hintStyle: TextStyle(fontSize: 16),
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
                    ),
SizedBox(height: width/17  ,),
                    Container(
                      child: IconButton(
                          onPressed: () async {
                            await BlocProvider.of<AddResponseMedicalExaminationCubit>(context)
                                .AddResponseMedicalExamination(textEditingController.text , id);
                          },
                          icon: Icon(Icons.save),color: Colors.white,),
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(12),color: MyColor.mykhli),
                      width: 100,
                      height: 50,
                    )  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
