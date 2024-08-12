import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hospital/bussines_logic/reception_cubit/reception_cubit.dart';
import 'package:hospital/constances/mycolor.dart';
import 'package:hospital/presntation/Screens/admin/add_Reception/Screens/editReception.dart';
import 'package:hospital/presntation/Screens/admin/add_Reception/addreception.dart';

class Show_RadioGraph extends StatefulWidget {
  @override
  _Show_RadioGraph createState() => _Show_RadioGraph();
}

class _Show_RadioGraph extends State<Show_RadioGraph> {
  final List<ReceptionController> characters = [];
  TextEditingController _searchController = TextEditingController();



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
                suffixIcon: const Icon(Icons.search_outlined),
                hintText: 'Search Reception',
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
                  mainAxisSpacing: 20
              ),
              itemCount: 3,
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
                          pathofimages[0] ,
                          height: height / 7,
                          width: width / 7,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'ads',
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
                          builder: (context) => EditReception(
                            isediting: true,
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
              Navigator.of(context).push(MaterialPageRoute(builder: (_) => EditReception(isediting: false)));
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