import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hospital/bussines_logic/add_lab_emp_cubit/add_lab_emp_cubit.dart';
import 'package:hospital/bussines_logic/reception_cubit/reception_cubit.dart';
import 'package:hospital/bussines_logic/show_lab_emp_cubit/show_lab_emp_cubit.dart';
import 'package:hospital/constances/mycolor.dart';
import 'package:hospital/presntation/Screens/admin/add_Reception/Screens/editReception.dart';
import 'package:hospital/presntation/Screens/admin/add_Reception/addreception.dart';
import 'package:hospital/presntation/Screens/choose-labrotary-screen/widget/add_lab_forms.dart';
import 'package:hospital/presntation/Screens/choose-labrotary-screen/widget/lab_emp_info.dart';

class Show_Labrotary extends StatefulWidget {
  @override
  _Show_Labrotary createState() => _Show_Labrotary();
}

class _Show_Labrotary extends State<Show_Labrotary> {
  TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      await BlocProvider.of<ShowLabEmpCubit>(context).ShowLabEmp();
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

    return BlocBuilder<ShowLabEmpCubit, Show_Lab_Emp_State>(
      builder: (context, state) {
        if (state.show_lab_emp_status == Show_Lab_Emp_Status.loading) {
          return const CircularProgressIndicator(
            color: MyColor.mykhli,
          );
        }
        if (BlocProvider.of<ShowLabEmpCubit>(context).rr == null) {
          return const CircularProgressIndicator(
            color: MyColor.mykhli,
          );
        }
        List rr = BlocProvider.of<ShowLabEmpCubit>(context).rr;
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
                    suffixIcon: IconButton(
                      icon: const Icon(Icons.search_outlined),
                      onPressed: () async {
                        if (_searchController.text.isEmpty) {
                          await BlocProvider.of<ShowLabEmpCubit>(context).ShowLabEmp();
                        } else {
                          await BlocProvider.of<ShowLabEmpCubit>(context).searchNon(_searchController.text);
                        }
                      },
                    ),
                    hintText: 'Search lab Employee',
                    border: InputBorder.none,
                    hintStyle: TextStyle(color: Colors.black.withOpacity(0.7)),
                  ),
                  style: const TextStyle(
                    color: Colors.black,
                  ),
                  onChanged: (value) {
                    setState(() {});
                  },
                ),
              ),
              const SizedBox(
                height: 100,
              ),
              Expanded(
                child: GridView.builder(
                  physics: const BouncingScrollPhysics(),
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 4, // Number of columns
                      mainAxisExtent: 155,
                      crossAxisSpacing: 50,
                      mainAxisSpacing: 20),
                  itemCount: rr.length,
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
                                  rr[index]['fullName'],
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
                              builder: (context) => Lab_Emp_Info(
                                id: rr[index]['id'],
                              ),
                            ),
                          );
                        },
                      ),
                    );
                  },
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (_) => Add_Lab_Forms(isediting: false)));
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
      },
    );
  }
}
