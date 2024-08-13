part of 'radiograph_cubit.dart';

enum RadiographStatus {
  loading ,
  notloading ,
  success ,
  failure ,
  initial ,
  notSuc
}

class RadiographState extends Equatable {
  final RadiographStatus radiographStatus ;

  const RadiographState({required this.radiographStatus}) ;

  factory RadiographState.initial() => const RadiographState(radiographStatus: RadiographStatus.initial) ;

  @override
  // TODO: implement props
  List<Object?> get props => [radiographStatus];

  RadiographState copyWith({RadiographStatus? radiographStatus}) {
    return RadiographState(radiographStatus: radiographStatus ?? this.radiographStatus) ;
  }

}