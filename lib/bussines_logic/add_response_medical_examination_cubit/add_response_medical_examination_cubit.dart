import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:hospital/data/repo/add_response_medical_examination_repo.dart';

part 'add_response_medical_examination_state.dart';

class AddResponseMedicalExaminationCubit extends Cubit<Add_Response_Medical_examination_State> {
  AddResponseMedicalExaminationCubit() : super(Add_Response_Medical_examination_State.initial());
  Future AddResponseMedicalExamination(String responseexam , int id)async{
    emit(state.copyWith(add_response_medical_examination_status: Add_Response_Medical_examination_Status.loading)) ;
try{
  await Add_Response_Medical_Examination_Repo.AddResponseMedicalExamination(responseexam , id);
  emit(state.copyWith(add_response_medical_examination_status: Add_Response_Medical_examination_Status.success)) ;

}catch(e){
  emit(state.copyWith(add_response_medical_examination_status: Add_Response_Medical_examination_Status.failure)) ;

}

  }
}
