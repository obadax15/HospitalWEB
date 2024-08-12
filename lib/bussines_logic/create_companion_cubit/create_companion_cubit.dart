import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:hospital/data/repo/create_companion_repo.dart';

part 'create_companion_state.dart';

class CreateCompanionCubit extends Cubit<CreateCompanionState> {
  CreateCompanionCubit() : super(CreateCompanionState.initial());

  Map details = {} ;

  Future createCompanion (String name , String number , String inNumber , int id) async {
    emit(state.copyWith(createCompanionStatus: CreateCompanionStatus.loading)) ;
    try {
      await CreateCompanionRepo.createCompanion(name, number, inNumber, id) ;
      emit(state.copyWith(createCompanionStatus: CreateCompanionStatus.success)) ;
    } catch (e) {
      emit(state.copyWith(createCompanionStatus: CreateCompanionStatus.failure)) ;
    }
  }

  Future editCompanion (String name , String number , String inNumber , int id) async {
    emit(state.copyWith(createCompanionStatus: CreateCompanionStatus.loading)) ;
    try {
      await CreateCompanionRepo.editCompanion(name, number, inNumber, id) ;
      emit(state.copyWith(createCompanionStatus: CreateCompanionStatus.success)) ;
    } catch (e) {
      emit(state.copyWith(createCompanionStatus: CreateCompanionStatus.failure)) ;
    }
  }

  Future getCompanion (int id) async {
    emit(state.copyWith(createCompanionStatus: CreateCompanionStatus.loading)) ;
    try {
      details = await CreateCompanionRepo.getCompanion(id) ;
      emit(state.copyWith(createCompanionStatus: CreateCompanionStatus.success)) ;
    } catch (e) {
      emit(state.copyWith(createCompanionStatus: CreateCompanionStatus.failure)) ;
    }
  }
}
