
part of 'reception_cubit.dart';

enum ReceptionStatus {
  loading ,
  success ,
  failure ,
  initial,
  deletedone,
  editdone,
}

class ReceptionState extends Equatable {
  final ReceptionStatus receptionStatus ;

  const ReceptionState({required this.receptionStatus}) ;

  factory ReceptionState.initial() => const ReceptionState(receptionStatus: ReceptionStatus.initial) ;

  @override
  // TODO: implement props
  List<Object?> get props => [receptionStatus];

  ReceptionState copyWith({ReceptionStatus? receptionStatus}) {
    return ReceptionState(receptionStatus: receptionStatus ?? this.receptionStatus) ;
  }

}