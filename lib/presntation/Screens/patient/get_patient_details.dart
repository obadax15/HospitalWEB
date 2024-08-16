import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hospital/bussines_logic/check_cubit/check_cubit.dart';
import 'package:hospital/bussines_logic/patient_cubit/patient_cubit.dart';
import 'package:hospital/presntation/Screens/companion/get_companion_screen.dart';

import '../../../constances/mycolor.dart';

class GetPatientDetails extends StatefulWidget {
  const GetPatientDetails({super.key, required this.id});

  final int id ;

  @override
  State<GetPatientDetails> createState() => _GetPatientDetailsState();
}

class _GetPatientDetailsState extends State<GetPatientDetails> {
  var details ;

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      await BlocProvider.of<PatientCubit>(context).getPatientByRoom(widget.id);
    });
    super.initState();
  }

  var id ;

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
    ];
    List<String> empoinfo = [];
    return Scaffold(
      backgroundColor: MyColor.myBlue,
      body: BlocBuilder<PatientCubit, PatientState>(
        builder: (context, state) {
          if (state.patientStatus == PatientStatus.loading || BlocProvider.of<PatientCubit>(context).patient==null) {
            return const Center(child: CircularProgressIndicator(color: MyColor.mykhli,),) ;
          }
          details = BlocProvider.of<PatientCubit>(context).patient ;
          id = details['id'] ;
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
                      Text(
                        empoinfo[index],
                        style: TextStyle(
                            fontSize: width / 70,
                            fontWeight: FontWeight.bold,
                            color: MyColor.mykhli),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        info[index],
                        style: TextStyle(
                            fontSize: width / 70,
                            fontWeight: FontWeight.bold,
                            color: MyColor.mykhli),
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
                      BlocListener<CheckCubit, CheckState>(
                        listener: (context, state) {
                          if (state.checkStatus == CheckStatus.success) {
                            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('checkout successfully'))) ;
                          }
                        },
                        child: InkWell(
                          onTap: () async {
                            await BlocProvider.of<CheckCubit>(context).checkOut(widget.id);
                          },
                          child: const Text(
                            'تخريج الحساب',
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
                          Navigator.of(context).push(MaterialPageRoute(builder: (_) => GetCompanionScreen(id: id))) ;
                        },
                        child: const Text(
                          'مرافق المريض',
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
