part of 'patient_cubit.dart';

enum PatientStatus {
  loading ,
  success ,
  successI ,
  failure ,
  initial
}

class PatientState extends Equatable {
  final PatientStatus patientStatus ;

  const PatientState({required this.patientStatus}) ;

  factory PatientState.initial() => const PatientState(patientStatus: PatientStatus.initial) ;

  @override
  List<Object?> get props => [patientStatus];

  PatientState copyWith({PatientStatus? patientStatus}) {
    return PatientState(patientStatus: patientStatus ?? this.patientStatus) ;
  }
}
