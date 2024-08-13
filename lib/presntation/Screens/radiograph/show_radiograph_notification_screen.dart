import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../bussines_logic/radiograph_cubit/radiograph_cubit.dart';
import '../../../constances/mycolor.dart';

class ShowRadiographNotificationScreen extends StatefulWidget {
  const ShowRadiographNotificationScreen({super.key});

  @override
  State<ShowRadiographNotificationScreen> createState() => _ShowRadiographNotificationScreenState();
}

class _ShowRadiographNotificationScreenState extends State<ShowRadiographNotificationScreen> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      await BlocProvider.of<RadiographCubit>(context).getRadiographNotification();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RadiographCubit, RadiographState>(
      builder: (context, state) {
        if (state.radiographStatus == RadiographStatus.loading || BlocProvider.of<RadiographCubit>(context).not == null) {
          return const CircularProgressIndicator(color: MyColor.mykhli,) ;
        }
        List not = BlocProvider.of<RadiographCubit>(context).not ;
        return Expanded(
          child: Container(
            padding: const EdgeInsets.all(15),
            child: GridView.builder(
              itemCount: not.length,
              gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                crossAxisSpacing: 15,
                mainAxisSpacing: 15,
                mainAxisExtent: 75,
                maxCrossAxisExtent: 500,
              ),
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () async {
                    await BlocProvider.of<RadiographCubit>(context).readNot(not[index]['id']) ;
                  },
                  child: Container(
                    decoration: const BoxDecoration(
                      color: Colors.white,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text (
                          not[index]['message'],
                          style: const TextStyle(
                              color: MyColor.mykhli,
                              fontSize: 18,
                              fontWeight: FontWeight.w400
                          ),
                        ),
                        not[index]['read_at'] == null ? Container(
                          width: 15,
                          height: 15,
                          decoration: BoxDecoration(
                            color: MyColor.mykhli ,
                            borderRadius: BorderRadius.circular(50) ,
                          ),
                        ) : Container() ,
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        );
      },
    );
  }
}
