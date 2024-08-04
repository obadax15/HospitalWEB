import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:hospital/constances/mycolor.dart';

class General_Emp_Info extends StatelessWidget {
  const General_Emp_Info({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    List<IconData> iconsmodels = [
      Icons.lock_outlined,
      Icons.person_2_outlined,

      Icons.location_on_outlined,
      Icons.local_hospital_outlined,
      Icons.male_outlined,
      Icons.person_3_outlined,
      Icons.card_travel_sharp,
      Icons.call,
      Icons.calendar_month_outlined,
      Icons.alarm_add_outlined,
    ];
    List<String> info = [
      ':كلمة السر ',
      ':الاسم',

      ':تقيم في',
      ':الاختصاص',
      ':الجنس',
      ':اسم الأم',
      ':الرقم الوطني',
      ':الرقم الشخصي',
      ':ولدت في',
      ':أوقات المناوبة'
    ];List<String> empoinfo = [
      '1224234234 ',
      'شهد محمد مطلق',

      'درعا',
      'جراحة عامة',
      'أنثى',
      'علية',
      '12345698',
      '54415351',
      'في درعا ',
      'أوقات المناوبة'
    ];
    return Scaffold(
      backgroundColor: MyColor.myBlue,
      body: Column(
        children: [
          SizedBox(
            height: height / 35,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                'قسم الموظفين العامين',
                style: TextStyle(
                  color: MyColor.mykhli,
                  fontSize: width/47,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: width / 3, right: 20),
                child: Image.asset(
                  'images/img_12.png',
                  height: height / 10,
                  width: height / 10,
                ),
              ),
            ],
          ),
          Text(
            'المعلومات الشخصية',
            style: TextStyle(
              color: Colors.blueAccent,
              fontSize: width/65,
              fontWeight: FontWeight.bold,

            ),

          ),
          Expanded(
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount( crossAxisCount: 2, // Number of columns
                childAspectRatio: height / 200, crossAxisSpacing: width /2,),
              itemCount: iconsmodels.length,
              itemBuilder: (context, index) =>
                  Row(mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(empoinfo[index],style: TextStyle(fontSize: width/70,fontWeight: FontWeight.bold,color: MyColor.mykhli),),
SizedBox(width: 5,),
                      Text(info[index],style: TextStyle(fontSize: width/70,fontWeight: FontWeight.bold,color: MyColor.mykhli),),

                      Padding(
                        padding:  EdgeInsets.only(right: width/89,left: 15),
                        child: Container(
                          height: width/30,width: width/30,
                          decoration: BoxDecoration(color: Color.fromRGBO(255, 228, 228,1),shape: BoxShape.circle),

                          child: Icon(iconsmodels[index],size: width/70,),
                        ),
                      ),
                    ],

                  ),
            ),
          ),
        ],
      ),
    );
  }
}
