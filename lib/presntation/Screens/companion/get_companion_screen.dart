import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hospital/bussines_logic/create_companion_cubit/create_companion_cubit.dart';
import 'package:hospital/presntation/Screens/companion/create_companion_screen.dart';

import '../../../constances/mycolor.dart';

class GetCompanionScreen extends StatefulWidget {
  const GetCompanionScreen({super.key, required this.id});

  final int id ;

  @override
  State<GetCompanionScreen> createState() => _GetCompanionScreenState();
}

class _GetCompanionScreenState extends State<GetCompanionScreen> {
  var details ;

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      await BlocProvider.of<CreateCompanionCubit>(context).getCompanion(widget.id);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    List<IconData> iconsmodels = [
      Icons.person_2_outlined,
      Icons.numbers,
      Icons.phone,
    ];

    List<String> info = [
      ':الاسم',
      ':الرقم الوطني',
      ':الرقم الشخصي',
    ];
    List<String> empoinfo = [];
    return Scaffold(
      backgroundColor: MyColor.myBlue,
      body: BlocBuilder<CreateCompanionCubit, CreateCompanionState>(
        builder: (context, state) {
          if (state.createCompanionStatus == CreateCompanionStatus.loading ) {
            return const Center(child: CircularProgressIndicator(color: MyColor.mykhli,),) ;
          }
          if (BlocProvider.of<CreateCompanionCubit>(context).details == null) {
            return const Center(child: CircularProgressIndicator(color: MyColor.mykhli,),) ;
          }
          if (!BlocProvider.of<CreateCompanionCubit>(context).details.containsKey('companion')) {
            return Center (
              child: Text(
                'لايوجد مرافق',
                style: TextStyle(
                  color: MyColor.mykhli,
                  fontSize: width / 47,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ) ;
          }
          details = BlocProvider.of<CreateCompanionCubit>(context).details['companion'] ;
          empoinfo = [
            details['fullName'],
            details['internationalNumber'],
            details['phoneNumber'],
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
                    'قسم المرافق',
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
                      const SizedBox(
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
          Navigator.of(context).push(MaterialPageRoute(builder: (context) => CreateCompanionScreen(id: details['id'] , details: details,),)) ;
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
