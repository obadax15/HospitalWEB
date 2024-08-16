part of 'check_cubit.dart';

enum CheckStatus {
  loading ,
  success ,
  failure ,
  initial ,
  successR ,
  successO ,
}

class CheckState extends Equatable {
  final CheckStatus checkStatus ;

  const CheckState({required this.checkStatus}) ;

  factory CheckState.initial() => const CheckState(checkStatus: CheckStatus.initial) ;

  @override
  List<Object?> get props => [checkStatus];

  CheckState copyWith({CheckStatus? checkStatus}) {
    return CheckState(checkStatus: checkStatus ?? this.checkStatus) ;
  }

}