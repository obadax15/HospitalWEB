import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../bussines_logic/schedule_cubit/schedule_cubit.dart';
import '../../../constances/mycolor.dart';

class NurseScheduleView extends StatefulWidget {
  const NurseScheduleView({super.key, required this.id});

  final int id ;

  @override
  State<NurseScheduleView> createState() => _NurseScheduleViewState();
}

class _NurseScheduleViewState extends State<NurseScheduleView> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      await BlocProvider.of<ScheduleCubit>(context).nurseSchedule(widget.id);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColor.myBlue,
      body: Directionality(
        textDirection: TextDirection.rtl,
        child: BlocBuilder<ScheduleCubit, ScheduleState>(
          builder: (context, state) {
            if (state.scheduleStatus == ScheduleStatus.loading) {
              return const Center(child: CircularProgressIndicator(color: MyColor.mykhli,),) ;
            }
            if (BlocProvider.of<ScheduleCubit>(context).nurseSce == null) {
              return const Center(child: CircularProgressIndicator(color: MyColor.mykhli,),) ;
            }
            List sc = BlocProvider.of<ScheduleCubit>(context).nurseSce ;
            return Padding(
              padding: const EdgeInsets.all(15),
              child: Column(
                children: [
                  Expanded(
                    flex: 2,
                    child: Column(
                      children: [
                        Container(
                          width: 300,
                          padding: const EdgeInsets.all(18),
                          decoration: BoxDecoration(
                            color: MyColor.mykhli,
                            borderRadius: BorderRadius.circular(25),
                          ),
                          child: const Text(
                            'جدول الدوام',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.w400),
                          ),
                        ),
                        const SizedBox(height: 20),
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'الدوام',
                              style: TextStyle(
                                  color: MyColor.mykhli,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w400),
                            ),
                            Text(
                              'وقت البداية',
                              style: TextStyle(
                                  color: MyColor.mykhli,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w400),
                            ),
                            Text(
                              'وقت النهاية',
                              style: TextStyle(
                                  color: MyColor.mykhli,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w400),
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 9,
                    child: ListView.builder(
                      itemCount: sc.length,
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.only(bottom: 15),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                sc[index]['day'],
                                style: const TextStyle(
                                    color: Colors.black,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w400),
                              ),
                              Text(
                                sc[index]['start'].join(','),
                                style: const TextStyle(
                                    color: Colors.black,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w400),
                              ),
                              Text(
                                sc[index]['end'].join(','),
                                style: const TextStyle(
                                    color: Colors.black,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w400),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
