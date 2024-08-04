import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart%20';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hospital/bussines_logic/view-patient_cubit/view_patient_cubit.dart';
import 'package:hospital/constances/mycolor.dart';

class Patient_View extends StatefulWidget {
  const Patient_View({Key? key}) : super(key: key);

  @override
  State<Patient_View> createState() => _Patient_ViewState();
}

class _Patient_ViewState extends State<Patient_View> {

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      await BlocProvider.of<ViewPatientCubit>(context).getPatient();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    bool situation = false;
    return BlocBuilder<ViewPatientCubit, View_Patient_State>(
      builder: (context, state) {
        if(state.view_patient_status==View_Patient_Status.loading){
          return CircularProgressIndicator(color: MyColor.mykhli,);
        }
        if(BlocProvider.of<ViewPatientCubit>(context).rr == null) {
          return CircularProgressIndicator(color: MyColor.mykhli,);
        }
        List rr= BlocProvider.of<ViewPatientCubit>(context).rr ;

        return Padding(
          padding: EdgeInsets.all(10),
          child: Expanded(
            child: Column(
              children: [
                Container(
                  height: 70,
                  decoration: BoxDecoration(color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                  ), child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Icon(Icons.search_outlined),
                        Text(
                          'ابحث هنا',
                          style: TextStyle(color: Colors.grey, fontSize: 12),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 25.0),
                      child: Text(
                        'البحث عن مريض',
                        style: TextStyle(color: Colors.black, fontSize: 26, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
                ),
                SizedBox(height: 50,),
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(color: Colors.white,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,

                            children: [
                              Text(
                                'الملف',
                                style: TextStyle(color: Colors.black, fontSize: 25, fontWeight: FontWeight.bold),
                              ),
                              Text(
                                'الحالة',
                                style: TextStyle(color: Colors.black, fontSize: 25, fontWeight: FontWeight.bold),
                              ), Text(
                                'رقم الموبايل',
                                style: TextStyle(color: Colors.black, fontSize: 25, fontWeight: FontWeight.bold),
                              ), Text(
                                ' اسم المريض',
                                style: TextStyle(color: Colors.black, fontSize: 25, fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                        Padding(padding: EdgeInsets.all(30)),
                        Expanded(
                          child: ListView.builder(
                            itemCount: rr.length,
                            itemBuilder: (_, index) =>
                                Padding(
                                  padding: const EdgeInsets.only(left: 50.0, right: 20),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Icon(Icons.file_copy_outlined, size: 15,),

                                      Container(alignment: Alignment.center,
                                        width: 50,
                                        height: 30,
                                        decoration: BoxDecoration(
                                          color: rr[index]['deleted_at']==null ? Colors.green : Colors.red,
                                          borderRadius: BorderRadius.circular(12),

                                        ),
                                        child: Text(
                                          rr[index]['deleted_at']==null ? 'in' : 'out', style: TextStyle(fontSize: 15, color: Colors.black),),

                                      ),
                                      Text(rr[index]['phoneNumber'], style: TextStyle(fontSize: 15, color: Colors.black),),
                                      Text(rr[index]['fullName'], style: TextStyle(fontSize: 15, color: Colors.black),),

                                    ],

                                  ),
                                ),


                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
