import 'package:flutter/material.dart';
import 'package:hospital/constances/mycolor.dart';
import 'package:hospital/presntation/Screens/add_Reception/addreception.dart';

class CharacterEditScreen extends StatelessWidget {
  final Character character;
  final Function(Character) onSave;

  final bool isediting;

  const CharacterEditScreen({super.key, required this.character, required this.isediting, required this.onSave});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    List<String> people = [
      'اسم ونسبة الأم',
      '',
      'الرقم  الشخصي',
      'العنوان',
      'محل وتاريخ الولادة',
      'الجنس',
      'اختصاص السكرتارية',
      'الرقم الوطني',
      'أوقات المناوبة',
      'إدخال كلمة السر'
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
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, // Number of columns
                childAspectRatio: height / 120, crossAxisSpacing: width / 30,
              ),
              itemCount: character.controllers.length,
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
                      child: TextFieldToAddInformationReception(index),
                    ),
                  ],
                );
              },
            ),
          ),
          ButtonToAddReception(height, width),
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
        isediting == true ? ' السكرتارية ${character.controllers[1].text}' : 'أضافة سكرتارية',
        style: const TextStyle(fontSize: 34, fontWeight: FontWeight.bold),
      )),
    );
  }

  Align ButtonToAddReception(double height, double width) {
    return Align(
      alignment: Alignment.centerRight,
      child: Container(
        margin: EdgeInsets.only(bottom: height / 17, right: width / 13),
        decoration: BoxDecoration(
          boxShadow:MyColor.boxshadow,
          color: const Color.fromRGBO(65, 99, 142, 1),
          borderRadius: BorderRadius.circular(8),
        ),
        height: height / 20,
        width: width / 8,
        child: Center(
          child: InkWell(
            onTap: () {
              onSave(character);
            },
            child: Text(
              isediting == true ? 'تعديل' : 'تسجيل الدخول',
              style: const TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ),
    );
  }

  TextFormField TextFieldToAddInformationReception(int index) {
    return TextFormField(
      controller: character.controllers[index],
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
    );
  }
}
