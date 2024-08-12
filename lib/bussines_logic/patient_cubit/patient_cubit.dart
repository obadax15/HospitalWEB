import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:hospital/data/repo/patient_repo.dart';

part 'patient_state.dart';

class PatientCubit extends Cubit<PatientState> {
  PatientCubit() : super(PatientState.initial());

  Future createPatient(String name , String number , String father , String mother , String inNumber , String location , String gender , String birthdate , String work , String social) async {
    emit(state.copyWith(patientStatus: PatientStatus.loading)) ;
    try {
      await PatientRepo.createPatient(name, number, father, mother, inNumber, location, gender, birthdate, work, social);
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
