part of 'patient_cubit.dart';

enum PatientStatus {
  loading ,
  success ,
  failure ,
  initial
}

class PatientState extends Equatable {
  final PatientStatus patientStatus ;

  const PatientState({required this.patientStatus}) ;

  factory PatientState.initial() => const PatientState(patientStatus: PatientStatus.initial) ;

  @override
  // TODO: implement props
  List<Object?> get props => [patientStatus];

  PatientState copyWith({PatientStatus? patientStatus}) {
    return PatientState(patientStatus: patientStatus ?? this.patientStatus) ;
  }

}
