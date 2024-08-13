import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:hospital/data/repo/room_repo.dart';

part 'room_state.dart';

class RoomCubit extends Cubit<RoomState> {
  RoomCubit() : super(RoomState.initial());

  var room ;
  var floor ;

  Future getRoom(int id) async {
    emit(state.copyWith(roomStatus: RoomStatus.loading));
    try {
      room = await RoomRepo.getRoom(id) ;
      print(room);
      emit(state.copyWith(roomStatus: RoomStatus.success));
    } catch (e) {
      emit(state.copyWith(roomStatus: RoomStatus.failure));
    }
  }

  Future getFloor() async {
    emit(state.copyWith(roomStatus: RoomStatus.loading));
    try {
      floor = await RoomRepo.getFloor() ;
      emit(state.copyWith(roomStatus: RoomStatus.success));
    } catch (e) {
      emit(state.copyWith(roomStatus: RoomStatus.failure));
    }
  }
}
