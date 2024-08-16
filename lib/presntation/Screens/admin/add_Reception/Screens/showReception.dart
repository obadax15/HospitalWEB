import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hospital/bussines_logic/reception_cubit/reception_cubit.dart';
import 'package:hospital/constances/mycolor.dart';
import 'package:hospital/presntation/Screens/admin/add_Reception/Screens/editReception.dart';
import 'package:hospital/presntation/Screens/admin/add_Reception/addreception.dart';
import 'package:hospital/presntation/Screens/admin/add_Reception/widgets/reception_info.dart';

class ShowReception extends StatefulWidget {
  @override
  _ShowReceptionState createState() => _ShowReceptionState();
}

class _ShowReceptionState extends State<ShowReception> {
  final List<ReceptionController> characters = [];
  TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      await BlocProvider.of<ReceptionCubit>(context).getReceptions();
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
                suffixIcon: BlocListener<ReceptionCubit, ReceptionState>(
                  listener: (context, state) {},
                  child: IconButton(
                    icon: const Icon(Icons.search_outlined),
                    onPressed: () async {
                      if (_searchController.text.isEmpty) {
                        await BlocProvider.of<ReceptionCubit>(context)
                            .getReceptions();
                      } else {
                        await BlocProvider.of<ReceptionCubit>(context)
                            .searchNon(_searchController.text);
                      }
                    },
                  ),
                ),
                hintText: 'Search Reception',
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
          BlocBuilder<ReceptionCubit, ReceptionState>(
            builder: (context, state) {
              if (state.receptionStatus == ReceptionStatus.loading) {
                return const Expanded(
                  child: CircularProgressIndicator(
                    color: MyColor.mykhli,
                  ),
                );
              }
              if (BlocProvider.of<ReceptionCubit>(context).reception == null) {
                return const Expanded(
                  child: CircularProgressIndicator(
                    color: MyColor.mykhli,
                  ),
                );
              }
              List rec = BlocProvider.of<ReceptionCubit>(context).reception;
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
                                    Reception_Info(id: rec[index]['id'])),
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
                  builder: (_) => EditReception(isediting: false)));
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
