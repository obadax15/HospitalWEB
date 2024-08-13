import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:hospital/bussines_logic/make_examination_read_cubit/make_examination_read_cubit.dart';
import 'package:hospital/data/repo/make_examination_read_repo.dart';

part 'make_examination_read_state.dart';

class MakeExaminationReadCubit extends Cubit<Make_Examination_Read_State> {
  MakeExaminationReadCubit() : super(Make_Examination_Read_State.initial());
  Future makeExaminationRead (int id)async{
    emit(state.copyWith(make_examination_read_status: Make_Examination_Read_Status.loading));
    try{
      await Make_Examination_Read_Repo.makeExaminationRead(id);
      emit(state.copyWith(make_examination_read_status: Make_Examination_Read_Status.success));


    }catch(e){
      emit(state.copyWith(make_examination_read_status: Make_Examination_Read_Status.failure));    }
  }

}
