import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:hospital/data/repo/nurse_schedule_repo.dart';

part 'nurse_schedule_state.dart';

class NurseScheduleCubit extends Cubit<NurseScheduleState> {
  NurseScheduleCubit() : super(NurseScheduleState.initial());

  Future addSchedule (int id , List times) async {
    emit(state.copyWith(nurseStatus: NurseScheduleStatus.loading)) ;
    try {
      await NurseScheduleRepo.addSchedule(id, times) ;
      emit(state.copyWith(nurseStatus: NurseScheduleStatus.success)) ;
    } catch (e) {
      emit(state.copyWith(nurseStatus: NurseScheduleStatus.failure)) ;
    }
  }

  Future addDoctorSchedule (int id , List times) async {
    emit(state.copyWith(nurseStatus: NurseScheduleStatus.loading)) ;
    try {
      await NurseScheduleRepo.addDoctorSchedule(id, times) ;
      emit(state.copyWith(nurseStatus: NurseScheduleStatus.success)) ;
    } catch (e) {
      emit(state.copyWith(nurseStatus: NurseScheduleStatus.failure)) ;
    }
  }
}
