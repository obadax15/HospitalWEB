import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:hospital/data/repo/doctor_repo.dart';

import '../../data/repo/room_repo.dart';

part 'doctor_state.dart';

class DoctorCubit extends Cubit<DoctorState> {
  DoctorCubit() : super(DoctorState.initial());

  var allDoctor ;
  var floorDoctor ;
  var sp ;
  var spDoctor ;
  var details ;

  Future getDoctor() async {
    emit(state.copyWith(doctorStatus: DoctorStatus.loading)) ;
    try {
      allDoctor = await DoctorRepo.getDoctor() ;
      emit(state.copyWith(doctorStatus: DoctorStatus.success)) ;
    } catch (e) {
      emit(state.copyWith(doctorStatus: DoctorStatus.failure)) ;
    }
  }

  Future getSpe() async {
    emit(state.copyWith(doctorStatus: DoctorStatus.loading)) ;
    try {
      sp = await DoctorRepo.getSp() ;
      emit(state.copyWith(doctorStatus: DoctorStatus.success)) ;
    } catch (e) {
      emit(state.copyWith(doctorStatus: DoctorStatus.failure)) ;
    }
  }

  Future getFloorDoctor(int id) async {
    emit(state.copyWith(doctorStatus: DoctorStatus.loading)) ;
    try {
      floorDoctor = await DoctorRepo.getFloorDoctor(id) ;
      emit(state.copyWith(doctorStatus: DoctorStatus.success)) ;
    } catch (e) {
      emit(state.copyWith(doctorStatus: DoctorStatus.failure)) ;
    }
  }

  Future getSpDoctor(int id) async {
    emit(state.copyWith(doctorStatus: DoctorStatus.loading)) ;
    try {
      spDoctor = await DoctorRepo.getSpDoctor(id) ;
      emit(state.copyWith(doctorStatus: DoctorStatus.success)) ;
    } catch (e) {
      emit(state.copyWith(doctorStatus: DoctorStatus.failure)) ;
    }
  }

  Future getDoctorDetails(int id) async {
    emit(state.copyWith(doctorStatus: DoctorStatus.loading)) ;
    try {
      details = await DoctorRepo.getDoctorDetails(id) ;
      emit(state.copyWith(doctorStatus: DoctorStatus.success)) ;
    } catch (e) {
      emit(state.copyWith(doctorStatus: DoctorStatus.failure)) ;
    }
  }

  Future search(String search) async {
    emit(state.copyWith(doctorStatus: DoctorStatus.loading)) ;
    try {
      allDoctor = await DoctorRepo.search(search) ;
      emit(state.copyWith(doctorStatus: DoctorStatus.success)) ;
    } catch (e) {
      emit(state.copyWith(doctorStatus: DoctorStatus.failure)) ;
    }
  }
}
