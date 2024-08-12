part of 'create_doctor_cubit.dart';

enum CreateDoctorStatus {
  loading ,
  success ,
  failure ,
  initial
}

class CreateDoctorState extends Equatable {
  final CreateDoctorStatus doctorStatus ;

  const CreateDoctorState({required this.doctorStatus}) ;

  factory CreateDoctorState.initial() => const CreateDoctorState(doctorStatus: CreateDoctorStatus.initial) ;

  @override
  // TODO: implement props
  List<Object?> get props => [doctorStatus];

  CreateDoctorState copyWith({CreateDoctorStatus? doctorStatus}) {
    return CreateDoctorState(doctorStatus: doctorStatus ?? this.doctorStatus) ;
  }

}