part of 'room_cubit.dart';

enum RoomStatus {
  loading ,
  success ,
  failure ,
  initial
}

class RoomState extends Equatable {
  final RoomStatus roomStatus ;

  const RoomState({required this.roomStatus}) ;

  factory RoomState.initial() => const RoomState(roomStatus: RoomStatus.initial) ;

  @override
  // TODO: implement props
  List<Object?> get props => [roomStatus];

  RoomState copyWith({RoomStatus? roomStatus}) {
    return RoomState(roomStatus: roomStatus ?? this.roomStatus) ;
  }

}