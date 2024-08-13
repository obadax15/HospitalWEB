part of 'get_examination_notify_cubit.dart';


enum GetNotifyExaminationStatus {
  loading ,
  success ,
  failure ,
  initial
}

class GetNotifyExaminationState extends Equatable {
  final GetNotifyExaminationStatus getNotifyExaminationStatus ;

  const GetNotifyExaminationState({required this.getNotifyExaminationStatus}) ;

  factory GetNotifyExaminationState.initial() => const GetNotifyExaminationState(getNotifyExaminationStatus: GetNotifyExaminationStatus.initial) ;

  @override
  // TODO: implement props
  List<Object?> get props => [getNotifyExaminationStatus];

  GetNotifyExaminationState copyWith({GetNotifyExaminationStatus? getNotifyExaminationStatus}) {
    return GetNotifyExaminationState(getNotifyExaminationStatus: getNotifyExaminationStatus ?? this.getNotifyExaminationStatus) ;
  }

}