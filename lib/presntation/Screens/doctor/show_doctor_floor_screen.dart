import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hospital/bussines_logic/room_cubit/room_cubit.dart';

import '../../../bussines_logic/doctor_cubit/doctor_cubit.dart';
import '../../../constances/mycolor.dart';

class ShowDoctorFloorScreen extends StatefulWidget {
  const ShowDoctorFloorScreen({super.key});

  @override
  State<ShowDoctorFloorScreen> createState() => _ShowDoctorFloorScreenState();
}

class _ShowDoctorFloorScreenState extends State<ShowDoctorFloorScreen> {
  TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      await BlocProvider.of<RoomCubit>(context).getFloor();
      await BlocProvider.of<DoctorCubit>(context).getFloorDoctor(1);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    List<String> pathofimages = [
      'images/img_1.png',
    ];

    int currentIndex = 0;

    return Padding(
      padding: const EdgeInsets.all(15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          BlocBuilder<RoomCubit, RoomState>(
            builder: (context, state) {
              if (state.roomStatus == RoomStatus.loading) {
                return const CircularProgressIndicator(color: MyColor.mykhli);
              }
              if (BlocProvider.of<RoomCubit>(context).floor == null) {
                return const CircularProgressIndicator(color: MyColor.mykhli);
              }
              List floor = BlocProvider.of<RoomCubit>(context).floor;
              return Expanded(
                flex: 1,
                child: Center(
                  child: ListView.builder(
                    itemCount: floor.length,
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () async {
                          setState(() {
                            currentIndex = index;
                          });
                          await BlocProvider.of<DoctorCubit>(context).getFloorDoctor(floor[index]['id']);
                        },
                        child: Container(
                          padding: const EdgeInsets.all(10),
                          margin: const EdgeInsets.symmetric(horizontal: 5),
                          decoration: BoxDecoration(
                            color: MyColor.mykhli,
                            borderRadius: BorderRadius.circular(25),
                          ),
                          child: Text(
                            'الطابق ${floor[index]['id']}',
                            style: const TextStyle(
                                color: Colors.white,
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
              if (BlocProvider.of<DoctorCubit>(context).floorDoctor == null) {
                return const Expanded(
                  flex: 15,
                  child: CircularProgressIndicator(
                    color: MyColor.mykhli,
                  ),
                );
              }
              List rec = BlocProvider.of<DoctorCubit>(context).floorDoctor;
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
                  itemCount: rec.length,
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
                                  rec[index]['fullName'],
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
