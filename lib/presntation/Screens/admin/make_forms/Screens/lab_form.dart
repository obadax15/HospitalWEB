import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:hospital/constances/mycolor.dart';

class Lab_Form extends StatelessWidget {
  Lab_Form({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery
        .of(context)
        .size
        .height;
    var width = MediaQuery
        .of(context)
        .size
        .width;
    return Scaffold(
      backgroundColor: const Color.fromRGBO(175, 216, 251, 0.3),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 60),
        child: Column(
          children: [
            SizedBox(height: height / 30,),
            Align(
                alignment: Alignment.topCenter,
                child: Text(
                  'استمارة مخبر',
                  style: TextStyle(
                    color: MyColor.mykhli,
                    fontSize: 34,
                    fontWeight: FontWeight.bold,
                  ),
                )),
            Align(
                alignment: Alignment.topLeft,
                child: Row(
                  children: [
                    Image.asset('images/img_10.png', height: height / 7, width: height / 10,),
                    Text(
                      'Labs',
                      style: TextStyle(
                        color: MyColor.mykhli,
                        fontWeight: FontWeight.bold,
                        fontSize: 56,
                      ),
                    ),
                  ],
                )),
            SizedBox(height: 20,),
            Expanded(
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, // Number of columns
                  childAspectRatio: height / 60, crossAxisSpacing: width / 30,
                ),
                itemCount: 16,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TestTextFields(
                      index: index,
                    ),
                  );
                },
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [SaveAndNextButtons(height, width, 'Save'),SaveAndNextButtons(height, width, 'Next')],)
          ],
        ),
      ),
    );
  }

  Align SaveAndNextButtons(double height, double width, String name) {
    return Align(
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
            onTap: () {

            },
            child: Text(
              name,
              style: const TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ),
    );
  }
}
class TestTextFields extends StatelessWidget {
  const TestTextFields({Key? key, this.index}) : super(key: key);
  final index;

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    List<String> test = [
      'K:',
      'Mg:',
      'Ca:',
      'Na:',
      'Troponin',
      'BNP:',
      'EF',
      'PT',
      'Inr',
      'Alts',
      'Hgb',
      'Hct',
      'Rbc',
      'WBC',
      'Albumin',
      'platelet',
    ];
    return Container(
      height: height / 25,
      width: width / 5,
      child: TextFormField(
        decoration: InputDecoration(
          fillColor: Colors.white,
          filled: true,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0), // Customize borderRadius
          ),
          hintText: test[index],
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Color.fromRGBO(173, 173, 173, 1), width: 1.0),
            borderRadius: BorderRadius.circular(8.0), // Customize borderRadius
          ),
        ),
      ),
    );
  }
}


