part of 'nurse_schedule_cubit.dart';

enum NurseScheduleStatus {
  loading ,
  success ,
  failure ,
  initial
}

class NurseScheduleState extends Equatable {
  final NurseScheduleStatus nurseStatus ;

  const NurseScheduleState({required this.nurseStatus}) ;

  factory NurseScheduleState.initial() => const NurseScheduleState(nurseStatus: NurseScheduleStatus.initial) ;

  @override
  List<Object?> get props => [nurseStatus];

  NurseScheduleState copyWith({NurseScheduleStatus? nurseStatus}) {
    return NurseScheduleState(nurseStatus: nurseStatus ?? this.nurseStatus) ;
  }

}