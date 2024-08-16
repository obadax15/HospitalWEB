import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:hospital/data/repo/schedule_repo.dart';

part 'schedule_state.dart';

class ScheduleCubit extends Cubit<ScheduleState> {
  ScheduleCubit() : super(ScheduleState.initial());

  var doctorSce ;
  var nurseSce ;
  var nurseAllSce ;
  var doctorsSce ;

  Future doctorSchedule (int id) async {
    emit(state.copyWith(scheduleStatus: ScheduleStatus.loading)) ;
    try {
      doctorSce = await ScheduleRepo.getDoctorSchedule(id) ;
      print(doctorSce) ;
      emit(state.copyWith(scheduleStatus: ScheduleStatus.success)) ;
      print(state.scheduleStatus) ;
    } catch (e) {
      emit(state.copyWith(scheduleStatus: ScheduleStatus.failure)) ;
    }
  }

  Future nurseSchedule (int id) async {
    emit(state.copyWith(scheduleStatus: ScheduleStatus.loading)) ;
    try {
      nurseSce = await ScheduleRepo.getNurseSchedule(id) ;
      emit(state.copyWith(scheduleStatus: ScheduleStatus.success)) ;
    } catch (e) {
      emit(state.copyWith(scheduleStatus: ScheduleStatus.failure)) ;
    }
  }

  Future doctorsSchedule (int id) async {
    emit(state.copyWith(scheduleStatus: ScheduleStatus.loading)) ;
    try {
      doctorsSce = await ScheduleRepo.getDoctorsSchedule(id) ;
      emit(state.copyWith(scheduleStatus: ScheduleStatus.success)) ;
    } catch (e) {
      emit(state.copyWith(scheduleStatus: ScheduleStatus.failure)) ;
    }
  }

  Future nurseAllSchedule () async {
    emit(state.copyWith(scheduleStatus: ScheduleStatus.loading)) ;
    try {
      nurseAllSce = await ScheduleRepo.getAllNurseSchedule() ;
      emit(state.copyWith(scheduleStatus: ScheduleStatus.success)) ;
    } catch (e) {
      emit(state.copyWith(scheduleStatus: ScheduleStatus.failure)) ;
    }
  }
}
