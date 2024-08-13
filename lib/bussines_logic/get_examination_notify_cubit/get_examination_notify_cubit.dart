import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:hospital/bussines_logic/get_examination_notify_cubit/get_examination_notify_cubit.dart';
import 'package:hospital/data/repo/get_examination_notify_repo.dart';

part 'get_examination_notify_state.dart';

class GetExaminationNotifyCubit extends Cubit<GetNotifyExaminationState> {
  GetExaminationNotifyCubit() : super(GetNotifyExaminationState.initial());
  var getallNotifyExamination;
  Future Get_Notify_Examination_Api()async{

    emit(state.copyWith(getNotifyExaminationStatus: GetNotifyExaminationStatus.loading));
    try{
      getallNotifyExamination=await Get_Notify_Examination_Repo.getNotifyExam();
      print(getallNotifyExamination) ;
      emit(state.copyWith(getNotifyExaminationStatus: GetNotifyExaminationStatus.success));

    }catch(e){ emit(state.copyWith(getNotifyExaminationStatus: GetNotifyExaminationStatus.failure));}
  }
}
