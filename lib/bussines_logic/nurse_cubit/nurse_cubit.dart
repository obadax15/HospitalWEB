import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:hospital/data/repo/nurse_repo.dart';

part 'nurse_state.dart';

class NurseCubit extends Cubit<NurseState> {
  NurseCubit() : super(NurseState.initial());

  var nurse ;

  Future getNurse() async {
    emit(state.copyWith(nurseStatus: NurseStatus.loading)) ;
    try {
      nurse = await NurseRepo.getNurse() ;
      emit(state.copyWith(nurseStatus: NurseStatus.success)) ;
    } catch (e) {
      emit(state.copyWith(nurseStatus: NurseStatus.failure)) ;
    }
  }

  Future searchNurse (String search) async {
    emit(state.copyWith(nurseStatus: NurseStatus.loading)) ;
    try {
      nurse = await NurseRepo.searchNurse(search) ;
      emit(state.copyWith(nurseStatus: NurseStatus.success)) ;
    } catch (e) {
      emit(state.copyWith(nurseStatus: NurseStatus.failure)) ;
    }
  }

  Future deleteNurse(int id) async {
    emit(state.copyWith(nurseStatus: NurseStatus.loading)) ;
    try {
      await NurseRepo.deleteNurse(id) ;
      emit(state.copyWith(nurseStatus: NurseStatus.success)) ;
    } catch (e) {
      emit(state.copyWith(nurseStatus: NurseStatus.failure)) ;
    }
  }

  Future createNurse(String name , String number , String father , String mother , String inNumber , String location , String gender , String birthdate ) async {
    emit(state.copyWith(nurseStatus: NurseStatus.loading)) ;
    try {
      await NurseRepo.createNurse(name, number, father, mother, inNumber, location, gender, birthdate) ;
      emit(state.copyWith(nurseStatus: NurseStatus.success)) ;
    } catch (e) {
      emit(state.copyWith(nurseStatus: NurseStatus.failure)) ;
    }
  }

  Future editNurse(String name , String number , String father , String mother , String inNumber , String location , String gender , String birthdate ,int id) async {
    emit(state.copyWith(nurseStatus: NurseStatus.loading)) ;
    try {
      await NurseRepo.editNurse(name, number, father, mother, inNumber, location, gender, birthdate , id) ;
      emit(state.copyWith(nurseStatus: NurseStatus.success)) ;
    } catch (e) {
      emit(state.copyWith(nurseStatus: NurseStatus.failure)) ;
    }
  }
}
