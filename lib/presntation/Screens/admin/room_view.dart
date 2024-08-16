import 'package:flutter/material.dart ';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hospital/bussines_logic/room_cubit/room_cubit.dart';
import 'package:hospital/constances/mycolor.dart';
import 'package:hospital/presntation/Screens/checks/patient_grid_view.dart';
import 'package:hospital/presntation/Screens/patient/get_patient_details.dart';
import 'package:hospital/presntation/Screens/reception/screens/addPatient/add_Patient.dart';

class Room_View extends StatefulWidget {
  const Room_View({Key? key}) : super(key: key);

  @override
  State<Room_View> createState() => _Room_ViewState();
}

class _Room_ViewState extends State<Room_View> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      await BlocProvider.of<RoomCubit>(context).getRoom(1);
      await BlocProvider.of<RoomCubit>(context).getFloor();
    });
    super.initState();
  }

  int currentIndex = 0 ;

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: BlocBuilder<RoomCubit, RoomState>(
        builder: (context, state) {
          if (state.roomStatus == RoomStatus.loading) {
            return const CircularProgressIndicator(
              color: MyColor.mykhli,
            );
          }
          if (BlocProvider.of<RoomCubit>(context).floor == null) {
            return const CircularProgressIndicator(
              color: MyColor.mykhli,
            );
          }
          if (BlocProvider.of<RoomCubit>(context).room == null) {
            return const CircularProgressIndicator(
              color: MyColor.mykhli,
            );
          }
          List room = BlocProvider.of<RoomCubit>(context).room;
          List floor = BlocProvider.of<RoomCubit>(context).floor;
          return Expanded(
            child: Column(
              children: [
                Expanded(
                  flex: 1,
                  child: ListView.builder(
                    itemCount: floor.length,
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () async {
                          await BlocProvider.of<RoomCubit>(context).getRoom(floor[index]['id']) ;
                          setState(() {
                            currentIndex = index ;
                          });
                        },
                        child: Container(
                          padding: const EdgeInsets.all(10),
                          margin: const EdgeInsets.symmetric(horizontal: 5),
                          decoration: BoxDecoration(
                            color: currentIndex != index ?  MyColor.mykhli : MyColor.myBlue,
                            borderRadius: BorderRadius.circular(25) ,
                          ),
                          child: Text (
                            'الطابق ${floor[index]['id']}' ,
                            style: TextStyle(
                              color: currentIndex != index ? Colors.white  : Colors.black,
                              fontSize: 18 ,
                              fontWeight: FontWeight.w400
                            ),
                          ),
                        ),
                      ) ;
                    },
                  ),
                ),
                floor[currentIndex]['id'] == 7 ? Container(
                  alignment: Alignment.center ,
                  child: const Text (
                    'غرف عمليات وعناية مشددة' ,
                    style: TextStyle (
                      color: Colors.black ,
                      fontWeight: FontWeight.bold ,
                      fontSize: 18
                    ),
                  ),
                ) : Container() ,
                Expanded(
                  flex: 15,
                  child: Container(
                    padding: const EdgeInsets.all(15),
                    child: GridView.builder(
                      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                        maxCrossAxisExtent: 110,
                        mainAxisSpacing: 25,
                        crossAxisSpacing: 25,
                        mainAxisExtent: 110,
                      ),
                      itemCount: room.length,
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () {
                            if (room[index]['status'] == 'available') {
                              Navigator.of(context).push(MaterialPageRoute(builder: (_) => Add_Patient(roomID: room[index]['id']))) ;
                            } else {
                              Navigator.of(context).push(MaterialPageRoute(builder: (_) => GetPatientDetails(id: room[index]['id']))) ;
                            }
                          },
                          child: Container(
                            padding: const EdgeInsets.all(25),
                            decoration: BoxDecoration(
                              color: room[index]['status'] == 'available'
                                  ? Colors.greenAccent.withOpacity(0.2)
                                  : Colors.red.withOpacity(0.2),
                              borderRadius: BorderRadius.circular(25),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.bed,
                                  size: 25,
                                  color: room[index]['status'] == 'available'
                                      ? Colors.green
                                      : Colors.red,
                                ),
                                Text(
                                  room[index]['roomNumber'].toString(),
                                  style: TextStyle(
                                      color: room[index]['status'] == 'available'
                                          ? Colors.green
                                          : Colors.red,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
