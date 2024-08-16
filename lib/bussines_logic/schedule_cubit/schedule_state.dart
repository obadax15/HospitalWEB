part of 'schedule_cubit.dart';

enum ScheduleStatus {
  loading ,
  success ,
  failure ,
  initial
}

class ScheduleState extends Equatable {
  final ScheduleStatus scheduleStatus ;

  const ScheduleState({required this.scheduleStatus}) ;

  factory ScheduleState.initial() => const ScheduleState(scheduleStatus: ScheduleStatus.initial) ;

  @override
  List<Object?> get props => [scheduleStatus];

  ScheduleState copyWith({ScheduleStatus? scheduleStatus}) {
    return ScheduleState(scheduleStatus: scheduleStatus ?? this.scheduleStatus) ;
  }

}