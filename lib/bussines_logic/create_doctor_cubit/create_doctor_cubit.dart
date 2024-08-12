import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:hospital/data/repo/create_doctor_repo.dart';

part 'create_doctor_state.dart';

class CreateDoctorCubit extends Cubit<CreateDoctorState> {
  CreateDoctorCubit() : super(CreateDoctorState.initial());

  Future createDoctor(
      String name,
      String number,
      String father,
      String mother,
      String inNumber,
      String location,
      String gender,
      String birthdate,
      int id) async {
    emit(state.copyWith(doctorStatus: CreateDoctorStatus.loading)) ;
    try {
      await CreateDoctorRepo.createDoctor(name, number, father, mother, inNumber, location, gender, birthdate, id) ;
      emit(state.copyWith(doctorStatus: CreateDoctorStatus.success)) ;
    } catch (e) {
      emit(state.copyWith(doctorStatus: CreateDoctorStatus.failure)) ;
    }
  }

  Future editDoctor(
      String name,
      String number,
      String father,
      String mother,
      String inNumber,
      String location,
      String gender,
      String birthdate,
      int id) async {
    emit(state.copyWith(doctorStatus: CreateDoctorStatus.loading)) ;
    try {
      await CreateDoctorRepo.editDoctor(name, number, father, mother, inNumber, location, gender, birthdate, id) ;
      emit(state.copyWith(doctorStatus: CreateDoctorStatus.success)) ;
    } catch (e) {
      emit(state.copyWith(doctorStatus: CreateDoctorStatus.failure)) ;
    }
  }

  Future deleteDoctor(int id) async {
    emit(state.copyWith(doctorStatus: CreateDoctorStatus.loading)) ;
    try {
      await CreateDoctorRepo.deleteDoctor(id);
      emit(state.copyWith(doctorStatus: CreateDoctorStatus.success)) ;
    } catch (e) {
      emit(state.copyWith(doctorStatus: CreateDoctorStatus.failure)) ;
    }
  }
}
