import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../bussines_logic/schedule_cubit/schedule_cubit.dart';
import '../../../constances/mycolor.dart';

class NurseAllTimeView extends StatefulWidget {
  const NurseAllTimeView({super.key});

  @override
  State<NurseAllTimeView> createState() => _NurseAllTimeViewState();
}

class _NurseAllTimeViewState extends State<NurseAllTimeView> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      await BlocProvider.of<ScheduleCubit>(context).nurseAllSchedule();
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
            if (BlocProvider.of<ScheduleCubit>(context).nurseAllSce == null) {
              return const Center(child: CircularProgressIndicator(color: MyColor.mykhli,),) ;
            }
            Map sc = BlocProvider.of<ScheduleCubit>(context).nurseAllSce ;
            List keys = sc.keys.toList() ;
            return Padding(
              padding: const EdgeInsets.all(15),
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                itemCount: keys.length,
                itemBuilder: (context, index) {
                  return Container(
                    height: double.infinity,
                    width: 200,
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: Column(
                      children: [
                        Expanded(
                          flex : 1 ,
                          child: Text(
                            keys[index],
                            style: const TextStyle(
                                color: MyColor.mykhli,
                                fontSize: 18,
                                fontWeight: FontWeight.w400),
                          ),
                        ),
                        Expanded(
                          flex: 6,
                          child: ListView.builder(
                            shrinkWrap: true,
                            itemCount: sc[keys[index]].length,
                            itemBuilder: (context, index) {
                              return Container(
                                height: 80,
                                width: 50,
                                child: Column(
                                  children: [
                                    Text(
                                      sc[keys[index]][index]['id'].toString(),
                                      style: const TextStyle(
                                          color: Colors.black,
                                          fontSize: 18,
                                          fontWeight: FontWeight.w400),
                                    ),
                                    Text(
                                      sc[keys[index]][index]['start'].join(','),
                                      style: const TextStyle(
                                          color: Colors.black,
                                          fontSize: 18,
                                          fontWeight: FontWeight.w400),
                                    ),
                                    Text(
                                      sc[keys[index]][index]['end'].join(','),
                                      style: const TextStyle(
                                          color: Colors.black,
                                          fontSize: 18,
                                          fontWeight: FontWeight.w400),
                                    ),
                                  ],
                                ),
                              ) ;
                            },
                          ),
                        )
                      ],
                    ),
                  ) ;
                },
              ),
            );
          },
        ),
      ),
    );
  }
}
