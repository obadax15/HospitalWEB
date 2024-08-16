import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hospital/bussines_logic/room_cubit/room_cubit.dart';
import 'package:hospital/presntation/Screens/doctor/doctor_schedule_sp_view.dart';

import '../../../bussines_logic/doctor_cubit/doctor_cubit.dart';
import '../../../constances/mycolor.dart';

class ShowSpelciaistDoctor extends StatefulWidget {
  const ShowSpelciaistDoctor({super.key});

  @override
  State<ShowSpelciaistDoctor> createState() => _ShowSpelciaistDoctorState();
}

class _ShowSpelciaistDoctorState extends State<ShowSpelciaistDoctor> {
  TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      await BlocProvider.of<DoctorCubit>(context).getSpe();
      await BlocProvider.of<DoctorCubit>(context).getSpDoctor(1);
    });
    super.initState();
  }

  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    List<String> pathofimages = [
      'images/img_1.png',
    ];

    return Padding(
      padding: const EdgeInsets.all(15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          BlocBuilder<DoctorCubit, DoctorState>(
            builder: (context, state) {
              if (state.doctorStatus == DoctorStatus.loading) {
                return const CircularProgressIndicator(color: MyColor.mykhli);
              }
              if (BlocProvider.of<DoctorCubit>(context).sp == null) {
                return const CircularProgressIndicator(color: MyColor.mykhli);
              }
              List specialists = BlocProvider.of<DoctorCubit>(context).sp;
              print(specialists);
              return Expanded(
                flex: 1,
                child: Center(
                  child: ListView.builder(
                    itemCount: specialists.length,
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () async {
                          setState(() {
                            currentIndex = index;
                          });
                          await BlocProvider.of<DoctorCubit>(context).getSpDoctor(specialists[index]['id']);
                        },
                        onDoubleTap: () {
                          Navigator.of(context).push(MaterialPageRoute(builder: (context) => DoctorScheduleSpView(id: specialists[index]['id']))) ;
                        },
                        child: Container(
                          padding: const EdgeInsets.all(10),
                          margin: const EdgeInsets.symmetric(horizontal: 5),
                          decoration: BoxDecoration(
                            color: currentIndex == index ? MyColor.myBlue : MyColor.mykhli,
                            borderRadius: BorderRadius.circular(25),
                          ),
                          child: Text(
                            'الاختصاص ${specialists[index]['name']}',
                            style: TextStyle(
                                color: currentIndex != index ? Colors.white : Colors.black,
                                fontSize: 18,
                                fontWeight: FontWeight.w400),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              );
            },
          ),
          const SizedBox(
            height: 100,
          ),
          BlocBuilder<DoctorCubit, DoctorState>(
            builder: (context, state) {
              if (state.doctorStatus == DoctorStatus.loading) {
                return const Expanded(
                  flex: 15,
                  child: CircularProgressIndicator(
                    color: MyColor.mykhli,
                  ),
                );
              }
              if (BlocProvider.of<DoctorCubit>(context).spDoctor == null) {
                return const Expanded(
                  flex: 15,
                  child: CircularProgressIndicator(
                    color: MyColor.mykhli,
                  ),
                );
              }
              List sp = BlocProvider.of<DoctorCubit>(context).spDoctor;
              return Expanded(
                flex: 11,
                child: GridView.builder(
                  physics: const BouncingScrollPhysics(),
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 4, // Number of columns
                      mainAxisExtent: 155,
                      crossAxisSpacing: 50,
                      mainAxisSpacing: 20),
                  itemCount: sp.length,
                  itemBuilder: (context, index) {
                    return Container(
                      width: width / 7,
                      height: height / 10,
                      decoration: BoxDecoration(
                        boxShadow: MyColor.boxshadow,
                        borderRadius: const BorderRadius.all(
                          Radius.circular(12),
                        ),
                        color: Colors.white,
                      ),
                      child: InkWell(
                        hoverColor: Colors.transparent,
                        child: Column(
                          children: [
                            Image.asset(
                              pathofimages[0],
                              height: height / 7,
                              width: width / 7,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  sp[index]['fullName'],
                                  style: TextStyle(fontSize: width / 80),
                                ),
                              ],
                            )
                          ],
                        ),
                        onTap: () {
                          // Navigator.push(
                          //   context,
                          //   MaterialPageRoute(
                          //     builder: (context) => EditReception(
                          //       isediting: true,
                          //     ),
                          //   ),
                          // );
                        },
                      ),
                    );
                  },
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
