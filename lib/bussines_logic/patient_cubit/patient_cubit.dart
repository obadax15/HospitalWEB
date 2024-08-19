import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:hospital/data/repo/patient_repo.dart';

import '../../data/repo/check_repo.dart';

part 'patient_state.dart';

class PatientCubit extends Cubit<PatientState> {
  PatientCubit() : super(PatientState.initial());

  var patient ;
  var patientS ;

  var id ;

  Future createPatient(String name , String number , String father , String mother , String inNumber , String location , String gender , String birthdate , String work , String social) async {
    emit(state.copyWith(patientStatus: PatientStatus.loading)) ;
    try {
      id = await PatientRepo.createPatient(name, number, father, mother, inNumber, location, gender, birthdate, work, social);
      emit(state.copyWith(patientStatus: PatientStatus.success)) ;
    } catch (e) {
      emit(state.copyWith(patientStatus: PatientStatus.failure)) ;
    }
  }

  Future checkIn (int id , int patientId) async {
    emit(state.copyWith(patientStatus: PatientStatus.loading)) ;
    try {
      await CheckRepo.getDoctorDetails(id, patientId) ;
      emit(state.copyWith(patientStatus: PatientStatus.successI)) ;
    } catch (e) {
      emit(state.copyWith(patientStatus: PatientStatus.failure)) ;
    }
  }

  Future getPatientByRoom(int roomID) async {
    emit(state.copyWith(patientStatus: PatientStatus.loading)) ;
    try {
      patient = await PatientRepo.getPatientByRoom(roomID);
      print(patient) ;
      emit(state.copyWith(patientStatus: PatientStatus.success)) ;
    } catch (e) {
      emit(state.copyWith(patientStatus: PatientStatus.failure)) ;
    }
  }

  Future downloadPdf(int id) async {
    emit(state.copyWith(patientStatus: PatientStatus.loading)) ;
    try {
      await PatientRepo.downloadPdf(id);
      emit(state.copyWith(patientStatus: PatientStatus.success)) ;
    } catch (e) {
      emit(state.copyWith(patientStatus: PatientStatus.failure)) ;
    }
  }

  Future statistics() async {
    emit(state.copyWith(patientStatus: PatientStatus.loading)) ;
    try {
      patientS = await PatientRepo.statistics();
      emit(state.copyWith(patientStatus: PatientStatus.success)) ;
    } catch (e) {
      emit(state.copyWith(patientStatus: PatientStatus.failure)) ;
    }
  }

  Future edit(String name , String number , String father , String mother , String inNumber , String location , String gender , String birthdate , String work , String social , int id) async {
    emit(state.copyWith(patientStatus: PatientStatus.loading)) ;
    try {
      await PatientRepo.edit(name, number, father, mother, inNumber, location, gender, birthdate, work, social , id);
      emit(state.copyWith(patientStatus: PatientStatus.success)) ;
    } catch (e) {
      emit(state.copyWith(patientStatus: PatientStatus.failure)) ;
    }
  }
}
