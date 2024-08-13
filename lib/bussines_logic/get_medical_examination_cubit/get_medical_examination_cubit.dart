import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:hospital/data/repo/get_medical_examination_repo.dart';

part 'get_medical_examination_state.dart';

class GetMedicalExaminationCubit extends Cubit<GetMedicalExaminationState> {
  GetMedicalExaminationCubit() : super(GetMedicalExaminationState.initial());
  var getallExamination;
  Future Get_Medical_Examination_Api()async{

    emit(state.copyWith(getMedicalExaminationStatus: GetMedicalExaminationStatus.loading));
    try{
     getallExamination=await Get_Medical_Examination_Repo.getMedExam();
     print(getallExamination) ;
     emit(state.copyWith(getMedicalExaminationStatus: GetMedicalExaminationStatus.success));

    }catch(e){ emit(state.copyWith(getMedicalExaminationStatus: GetMedicalExaminationStatus.failure));}
  }
}
