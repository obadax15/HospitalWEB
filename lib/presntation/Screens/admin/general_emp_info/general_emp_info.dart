import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hospital/bussines_logic/nurse_cubit/nurse_cubit.dart';
import 'package:hospital/constances/mycolor.dart';
import 'package:hospital/presntation/Screens/nurse_screens/create_nurse_screen.dart';
import 'package:hospital/presntation/Screens/nurse_screens/nurse_schedule_view.dart';
import 'package:hospital/presntation/Screens/nurse_time/nurse_time_screen.dart';

class General_Emp_Info extends StatelessWidget {
  const General_Emp_Info({Key? key, required this.details}) : super(key: key);

  final Map details;

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
      Icons.timer_outlined,
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
      ':مواليد',
      ': اوقات المناوبة',
    ];
    List<String> empoinfo = [
      details['fatherName'],
      details['fullName'],
      details['currentLocation'],
      '_',
      details['gender'] == 1 ? "ذكر" : "انثى",
      details['motherName'],
      details['internationalNumber'],
      details['phoneNumber'],
      details['birthdate'],
      '_'
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
                  fontSize: width / 47,
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
              fontSize: width / 65,
              fontWeight: FontWeight.bold,
            ),
          ),
          Expanded(
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, // Number of columns
                childAspectRatio: height / 200, crossAxisSpacing: width / 2,
              ),
              itemCount: iconsmodels.length,
              itemBuilder: (context, index) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    InkWell(
                      onTap: () {
                        if (index == 9) {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (_) => NurseScheduleView(
                                    id: details['id'],
                                  )));
                        }
                      },
                      child: Text(
                        empoinfo[index],
                        style: TextStyle(
                            fontSize: width / 70,
                            fontWeight: FontWeight.bold,
                            color: MyColor.mykhli),
                      ),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    InkWell(
                      onTap: () {
                        if (index == 9) {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (_) => Nurse_Time(
                                    id: details['id'],
                                  )));
                        }
                      },
                      child: Text(
                        info[index],
                        style: TextStyle(
                            fontSize: width / 70,
                            fontWeight: FontWeight.bold,
                            color: MyColor.mykhli),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(right: width / 89, left: 15),
                      child: Container(
                        height: width / 30,
                        width: width / 30,
                        decoration: const BoxDecoration(
                            color: Color.fromRGBO(255, 228, 228, 1),
                            shape: BoxShape.circle),
                        child: Icon(
                          iconsmodels[index],
                          size: width / 70,
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
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
                        fontWeight: FontWeight.w400),
                  ),
                  content: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      BlocListener<NurseCubit, NurseState>(
                        listener: (context, state) {},
                        child: InkWell(
                          onTap: () async {
                            await BlocProvider.of<NurseCubit>(context)
                                .deleteNurse(details['id']);
                          },
                          child: const Text(
                            'حذف حساب',
                            style: TextStyle(
                                color: MyColor.myBlue2,
                                fontSize: 18,
                                fontWeight: FontWeight.w400),
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      const Divider(
                        color: Colors.black12,
                      ),
                      const SizedBox(height: 10),
                      InkWell(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (_) => CreateNurseScreen(
                                    isEditing: true,
                                    details: details,
                                  )));
                        },
                        child: const Text(
                          'تعديل معلومات الحساب',
                          style: TextStyle(
                              color: MyColor.myBlue2,
                              fontSize: 18,
                              fontWeight: FontWeight.w400),
                        ),
                      )
                    ],
                  ),
                ),
              );
            },
          );
        },
        backgroundColor: MyColor.mykhli,
        child: const Icon(
          Icons.edit,
          color: Colors.white,
          size: 18,
        ),
      ),
    );
  }
}
