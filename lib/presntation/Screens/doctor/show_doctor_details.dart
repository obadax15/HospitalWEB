import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hospital/bussines_logic/create_doctor_cubit/create_doctor_cubit.dart';
import 'package:hospital/bussines_logic/doctor_cubit/doctor_cubit.dart';
import 'package:hospital/presntation/Screens/doctor/create_doctor_screen.dart';
import 'package:hospital/presntation/Screens/doctor/doctor_schedule_view.dart';
import 'package:hospital/presntation/Screens/nurse_time/Doctor_time_screen.dart';

import '../../../constances/mycolor.dart';

class ShowDoctorDetails extends StatefulWidget {
  const ShowDoctorDetails({super.key, required this.id});

  final int id ;

  @override
  State<ShowDoctorDetails> createState() => _ShowDoctorDetailsState();
}

class _ShowDoctorDetailsState extends State<ShowDoctorDetails> {

  var details ;

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      await BlocProvider.of<DoctorCubit>(context).getDoctorDetails(widget.id);
    });
    super.initState();
  }

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
      ':اوقات الدوام',
    ];
    List<String> empoinfo = [];
    return Scaffold(
      backgroundColor: MyColor.myBlue,
      body: BlocBuilder<DoctorCubit, DoctorState>(
  builder: (context, state) {
    if (state.doctorStatus == DoctorStatus.loading || BlocProvider.of<DoctorCubit>(context).details==null) {
      return const Center(child: CircularProgressIndicator(color: MyColor.mykhli,),) ;
    }
    details = BlocProvider.of<DoctorCubit>(context).details['doctor'] ;
    empoinfo = [
      details['fatherName'],
      details['fullName'],
      details['currentLocation'],
      '_',
      details['gender'] == 1 ? "ذكر" : "انثى",
      details['motherName'],
      details['internationalNumber'],
      details['phoneNumber'],
      details['birthdate'],
      'جدول الدوام',
    ];
    return Column(
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
              itemBuilder: (context, index) => Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  InkWell(
                    onTap: () {
                      if (index == iconsmodels.length - 1) {
                        Navigator.of(context).push(MaterialPageRoute(builder: (context) => DoctorScheduleView(id: widget.id))) ;
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
                  const SizedBox(
                    width: 5,
                  ),
                  InkWell(
                    onTap: () {
                      if (index == info.length - 1) {
                        Navigator.of(context).push(MaterialPageRoute(builder: (context) => DoctorTimeScreen(id : widget.id))) ;
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
              ),
            ),
          ),
        ],
      );
  },
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
                      BlocListener<CreateDoctorCubit, CreateDoctorState>(
                        listener: (context, state) {
                          if (state.doctorStatus == DoctorStatus.success) {
                            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('deleted successfully'))) ;
                          }
                        },
                        child: InkWell(
                          onTap: () async {
                            await BlocProvider.of<CreateDoctorCubit>(context).deleteDoctor(widget.id);
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
                          Navigator.of(context).push(MaterialPageRoute(builder: (_) => CreateDoctorScreen(isediting: true , details: details,id: widget.id,))) ;
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
