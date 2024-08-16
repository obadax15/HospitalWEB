import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hospital/bussines_logic/nurse_cubit/nurse_cubit.dart';
import 'package:hospital/constances/mycolor.dart';
import 'package:hospital/presntation/Screens/admin/general_emp_info/general_emp_info.dart';
import 'package:hospital/presntation/Screens/nurse_screens/create_nurse_screen.dart';
import 'package:hospital/presntation/Screens/nurse_time/nurse_all_time_view.dart';

class ShowNurseScreen extends StatefulWidget {
  const ShowNurseScreen({super.key});

  @override
  State<ShowNurseScreen> createState() => _ShowNurseScreenState();
}

class _ShowNurseScreenState extends State<ShowNurseScreen> {

  final TextEditingController _searchController = TextEditingController() ;

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      await BlocProvider.of<NurseCubit>(context).getNurse();
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
    return Scaffold(
      backgroundColor: MyColor.myBlue,
      body: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.all(25),
        child: Column(
          children: [
            InkWell(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => const NurseAllTimeView())) ;
              },
              child: Container(
                width: 300,
                padding: const EdgeInsets.all(18),
                decoration: BoxDecoration(
                  color: MyColor.mykhli,
                  borderRadius: BorderRadius.circular(25),
                ),
                child: const Text(
                  'ممرضين',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w400),
                ),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
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
                  suffixIcon: BlocListener<NurseCubit, NurseState>(
                    listener: (context, state) {},
                    child: IconButton(
                      icon: const Icon(Icons.search),
                      onPressed: () async {
                        if (_searchController.text.isEmpty) {
                          await BlocProvider.of<NurseCubit>(context).getNurse();
                        } else {
                          await BlocProvider.of<NurseCubit>(context).searchNurse(_searchController.text);
                        }
                      },
                    ),
                  ),
                  hintText: 'Search Nurse',
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
            BlocBuilder<NurseCubit, NurseState>(
              builder: (context, state) {
                if (state.nurseStatus == NurseStatus.loading) {
                  return const CircularProgressIndicator(color: MyColor.mykhli) ;
                }
                if (BlocProvider.of<NurseCubit>(context).nurse == null) {
                  return const CircularProgressIndicator(color: MyColor.mykhli) ;
                }
                List nurse = BlocProvider.of<NurseCubit>(context).nurse ;
                return Expanded(
                  child: GridView.builder(
                    physics: const BouncingScrollPhysics(),
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 4, // Number of columns
                            mainAxisExtent: 155,
                            crossAxisSpacing: 50,
                            mainAxisSpacing: 20),
                    itemCount: nurse.length,
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
                                    nurse[index]['fullName'],
                                    style: TextStyle(fontSize: width / 80),
                                  ),
                                ],
                              )
                            ],
                          ),
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(builder: (_) => General_Emp_Info(details: nurse[index],)));
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
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(builder: (_) => const CreateNurseScreen(isEditing: false,))) ;
        },
        backgroundColor: MyColor.mykhli,
        child: const Icon(
          Icons.add,
          color: Colors.white,
          size: 18,
        ),
      ),
    );
  }
}
