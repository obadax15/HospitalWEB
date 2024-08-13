part of 'get_medical_examination_cubit.dart';

enum GetMedicalExaminationStatus {
  loading ,
  success ,
  failure ,
  initial
}

class GetMedicalExaminationState extends Equatable {
  final GetMedicalExaminationStatus getMedicalExaminationStatus ;

  const GetMedicalExaminationState({required this.getMedicalExaminationStatus}) ;

  factory GetMedicalExaminationState.initial() => const GetMedicalExaminationState(getMedicalExaminationStatus: GetMedicalExaminationStatus.initial) ;

  @override
  // TODO: implement props
  List<Object?> get props => [getMedicalExaminationStatus];

  GetMedicalExaminationState copyWith({GetMedicalExaminationStatus? getMedicalExaminationStatus}) {
    return GetMedicalExaminationState(getMedicalExaminationStatus: getMedicalExaminationStatus ?? this.getMedicalExaminationStatus) ;
  }

}