import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hospital/bussines_logic/doctor_cubit/doctor_cubit.dart';
import 'package:hospital/presntation/Screens/doctor/create_doctor_screen.dart';
import 'package:hospital/presntation/Screens/doctor/show_doctor_details.dart';

import '../../../constances/mycolor.dart';

class ShowDoctorScreen extends StatefulWidget {
  const ShowDoctorScreen({super.key});

  @override
  State<ShowDoctorScreen> createState() => _ShowDoctorScreenState();
}

class _ShowDoctorScreenState extends State<ShowDoctorScreen> {
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      await BlocProvider.of<DoctorCubit>(context).getDoctor();
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

    return Padding(
      padding: const EdgeInsets.all(15),
      child: Column(
        children: [
          Container(
            margin: const EdgeInsets.only(left: 20, right: 20, top: 10),
            decoration: BoxDecoration(
              boxShadow: MyColor.boxshadow,
              borderRadius: const BorderRadius.all(
                Radius.circular(12),
              ),
              color: Colors.white,
            ),
            height: 50,
            width: width / 1.2,
            child: TextField(
              controller: _searchController,
              decoration: InputDecoration(
                suffixIcon: BlocListener<DoctorCubit, DoctorState>(
                  listener: (context, state) {},
                  child: IconButton(
                    icon: const Icon(Icons.search),
                    onPressed: () async {
                      if (_searchController.text.isEmpty) {
                        await BlocProvider.of<DoctorCubit>(context)
                            .getDoctor();
                      } else {
                        await BlocProvider.of<DoctorCubit>(context)
                            .search(_searchController.text);
                      }
                    },
                  ),
                ),
                hintText: 'Search Doctor',
                border: InputBorder.none,
                hintStyle: TextStyle(color: Colors.black.withOpacity(0.7)),
              ),
              style: const TextStyle(
                color: Colors.black,
              ),
            ),
          ),
          const SizedBox(
            height: 100,
          ),
          BlocBuilder<DoctorCubit, DoctorState>(
            builder: (context, state) {
              if (state.doctorStatus == DoctorStatus.loading) {
                return const Expanded(
                  child: CircularProgressIndicator(
                    color: MyColor.mykhli,
                  ),
                );
              }
              if (BlocProvider.of<DoctorCubit>(context).allDoctor == null) {
                return const Expanded(
                  child: CircularProgressIndicator(
                    color: MyColor.mykhli,
                  ),
                );
              }
              List rec = BlocProvider.of<DoctorCubit>(context).allDoctor;
              return Expanded(
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
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  ShowDoctorDetails(id: rec[index]['id']),
                            ),
                          );
                        },
                      ),
                    );
                  },
                ),
              );
            },
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (_) => const CreateDoctorScreen(isediting: false)));
            },
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(MyColor.mykhli),
            ),
            child: const Icon(
              Icons.add,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
