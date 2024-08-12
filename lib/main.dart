import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hospital/bussines_logic/create_doctor_cubit/create_doctor_cubit.dart';
import 'package:hospital/bussines_logic/doctor_cubit/doctor_cubit.dart';
import 'package:hospital/bussines_logic/login_cubit/login_cubit.dart';
import 'package:hospital/bussines_logic/nurse_cubit/nurse_cubit.dart';
import 'package:hospital/bussines_logic/patient_cubit/patient_cubit.dart';
import 'package:hospital/bussines_logic/reception_cubit/reception_cubit.dart';
import 'package:hospital/bussines_logic/room_cubit/room_cubit.dart';
import 'package:hospital/bussines_logic/view-patient_cubit/view_patient_cubit.dart';

import 'appRouter.dart';

void main() {
  runApp(MultiBlocProvider(
    providers: [
      BlocProvider(create: (context) => LoginCubit()),
      BlocProvider(create: (context) => PatientCubit()),
      BlocProvider(create: (context) => ReceptionCubit()),
      BlocProvider(create: (context) => RoomCubit()),
      BlocProvider(create: (context) => ViewPatientCubit()),
      BlocProvider(create: (context) => NurseCubit()),
      BlocProvider(create: (context) => DoctorCubit()),
      BlocProvider(create: (context) => CreateDoctorCubit()),
    ],
    child: Hospital(
      app_router: App_Router(),
    ),
  ));
}

class Hospital extends StatelessWidget {
  const Hospital({super.key, required this.app_router});

  final App_Router app_router;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: app_router.generateRoute,
    );
  }
}
