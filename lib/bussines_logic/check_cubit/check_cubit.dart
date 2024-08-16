import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:hospital/data/repo/check_repo.dart';

part 'check_state.dart';

class CheckCubit extends Cubit<CheckState> {
  CheckCubit() : super(CheckState.initial());

  Future checkIn (int id , int patientId) async {
    emit(state.copyWith(checkStatus: CheckStatus.loading)) ;
    try {
      await CheckRepo.getDoctorDetails(id, patientId) ;
      emit(state.copyWith(checkStatus: CheckStatus.success)) ;
    } catch (e) {
      emit(state.copyWith(checkStatus: CheckStatus.failure)) ;
    }
  }

  Future checkOut (int id) async {
    emit(state.copyWith(checkStatus: CheckStatus.loading)) ;
    try {
      await CheckRepo.checkOut(id) ;
      emit(state.copyWith(checkStatus: CheckStatus.successO)) ;
    } catch (e) {
      emit(state.copyWith(checkStatus: CheckStatus.failure)) ;
    }
  }

  Future restorePatient (int id) async {
    emit(state.copyWith(checkStatus: CheckStatus.loading)) ;
    try {
      await CheckRepo.restorePatient(id) ;
      emit(state.copyWith(checkStatus: CheckStatus.successR)) ;
    } catch (e) {
      emit(state.copyWith(checkStatus: CheckStatus.failure)) ;
    }
  }
}
