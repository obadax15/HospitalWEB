import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import 'package:hospital/data/repo/reception_repo.dart';

part 'reception_state.dart';

class ReceptionCubit extends Cubit<ReceptionState> {
  ReceptionCubit() : super(ReceptionState.initial());

  var reception ;

  Future createReception(String name , String number , String father , String mother , String inNumber , String location , String gender , String birthdate ) async {
    emit(state.copyWith(receptionStatus: ReceptionStatus.loading)) ;
    try {
      await ReceptionRepo.createReception(name, number, father, mother, inNumber, location, gender, birthdate);
      emit(state.copyWith(receptionStatus: ReceptionStatus.success)) ;
    } catch (e) {
      emit(state.copyWith(receptionStatus: ReceptionStatus.failure)) ;
    }
  }

  Future getReceptions() async {
    emit(state.copyWith(receptionStatus: ReceptionStatus.loading)) ;
    try {
      reception = await ReceptionRepo.getReception();
      emit(state.copyWith(receptionStatus: ReceptionStatus.success)) ;
    } catch (e) {
      emit(state.copyWith(receptionStatus: ReceptionStatus.failure)) ;
    }
  }
}