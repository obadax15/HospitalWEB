import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hospital/bussines_logic/radiograph_cubit/radiograph_cubit.dart';
import 'package:hospital/bussines_logic/radiograph_cubit/radiograph_cubit.dart';
import 'package:hospital/constances/mycolor.dart';
import 'package:hospital/presntation/Screens/radiograph/radiograph_response_screen.dart';

class ShowRadiographScreen extends StatefulWidget {
  const ShowRadiographScreen({super.key});

  @override
  State<ShowRadiographScreen> createState() => _ShowRadiographScreenState();
}

class _ShowRadiographScreenState extends State<ShowRadiographScreen> {

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      await BlocProvider.of<RadiographCubit>(context).getRadiograph();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RadiographCubit, RadiographState>(
      builder: (context, state) {
        if (state.radiographStatus == RadiographStatus.loading || BlocProvider.of<RadiographCubit>(context).radiograph == null) {
          return const CircularProgressIndicator(color: MyColor.mykhli,) ;
        }
        List radiograph = BlocProvider.of<RadiographCubit>(context).radiograph ;
        return Expanded(
          child: Container(
            padding: const EdgeInsets.all(15),
            child: GridView.builder(
              itemCount: radiograph.length,
              gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                crossAxisSpacing: 15,
                mainAxisSpacing: 15,
                mainAxisExtent: 75,
                maxCrossAxisExtent: 500,
              ),
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    if (radiograph[index]['image'] == null) {
                      Navigator.of(context).push(MaterialPageRoute(builder: (context)=> RadiographResponseScreen(id: radiograph[index]['id'],))) ;
                    }
                  },
                  child: Container(
                    decoration: const BoxDecoration(
                      color: Colors.white,
                    ),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            const Text (
                              "ask examination : ",
                              style: TextStyle(
                                  color: MyColor.mykhli,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w400
                              ),
                            ),
                            Container(
                              width: 250,
                              child: Text(
                                radiograph[index]['askRadiographs'],
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                    color: Colors.blue.withOpacity(0.5),
                                    fontSize: 18,
                                    fontWeight: FontWeight.w400
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 15,),
                        Text(
                          radiograph[index]['image'] == null ? "Not response yet" : "Response correctly",
                          style: TextStyle(
                              color: MyColor.mykhli.withOpacity(0.6),
                              fontSize: 18,
                              fontWeight: FontWeight.w400
                          ),
                        ),
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
