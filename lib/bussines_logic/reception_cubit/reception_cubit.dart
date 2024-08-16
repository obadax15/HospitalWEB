import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import 'package:hospital/data/repo/reception_repo.dart';

part 'reception_state.dart';

class ReceptionCubit extends Cubit<ReceptionState> {
  ReceptionCubit() : super(ReceptionState.initial());

  var reception ;
  var details ;


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

  Future searchNon(String search) async {
    emit(state.copyWith(receptionStatus: ReceptionStatus.loading)) ;
    try {
      reception = await ReceptionRepo.searchNon(3,search);
      emit(state.copyWith(receptionStatus: ReceptionStatus.success)) ;
    } catch (e) {
      emit(state.copyWith(receptionStatus: ReceptionStatus.failure)) ;
    }
  }

  Future deleteReception(int id) async {
    emit(state.copyWith(receptionStatus: ReceptionStatus.loading)) ;
    try {
      await ReceptionRepo.deleteReception(id);
      emit(state.copyWith(receptionStatus: ReceptionStatus.deletedone)) ;
    } catch (e) {
      emit(state.copyWith(receptionStatus: ReceptionStatus.failure)) ;
    }
  }

  Future getReceptionDetails(int id) async {
    emit(state.copyWith(receptionStatus: ReceptionStatus.loading)) ;
    try {
      details = await ReceptionRepo.getReceptionDetails(id) ;
      emit(state.copyWith(receptionStatus: ReceptionStatus.success)) ;
    } catch (e) {
      emit(state.copyWith(receptionStatus: ReceptionStatus.failure)) ;
    }
  }

  Future edit_Reception(
      String name,
      String number,
      String father,
      String mother,
      String inNumber,
      String location,
      String gender,
      String birthdate,
      int id
      ) async {
    emit(state.copyWith(receptionStatus: ReceptionStatus.loading)) ;
    try {
      await ReceptionRepo.edit_Reception(name, number, father, mother, inNumber, location, gender, birthdate, id) ;
      emit(state.copyWith(receptionStatus: ReceptionStatus.editdone)) ;
      print(state.receptionStatus) ;
    } catch (e) {
      emit(state.copyWith(receptionStatus: ReceptionStatus.failure)) ;
    }
  }
}