part of 'nurse_cubit.dart';

enum NurseStatus {
  loading ,
  success ,
  failure ,
  initial
}

class NurseState extends Equatable {
  final NurseStatus nurseStatus ;

  const NurseState({required this.nurseStatus}) ;

  factory NurseState.initial() => const NurseState(nurseStatus: NurseStatus.initial) ;

  @override
  // TODO: implement props
  List<Object?> get props => [nurseStatus];

  NurseState copyWith({NurseStatus? nurseStatus}) {
    return NurseState(nurseStatus: nurseStatus ?? this.nurseStatus) ;
  }

}
