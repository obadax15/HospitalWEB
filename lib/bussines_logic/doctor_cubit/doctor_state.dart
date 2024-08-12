part of 'doctor_cubit.dart';

enum DoctorStatus {
  loading ,
  success ,
  failure ,
  initial
}

class DoctorState extends Equatable {
  final DoctorStatus doctorStatus ;

  const DoctorState({required this.doctorStatus}) ;

  factory DoctorState.initial() => const DoctorState(doctorStatus: DoctorStatus.initial) ;

  @override
  List<Object?> get props => [doctorStatus];

  DoctorState copyWith({DoctorStatus? doctorStatus}) {
    return DoctorState(doctorStatus: doctorStatus ?? this.doctorStatus) ;
  }

}