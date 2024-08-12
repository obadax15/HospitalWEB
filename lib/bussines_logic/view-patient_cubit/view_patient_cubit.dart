import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:hospital/data/repo/patient-view-repo.dart';

part 'view_patient_state.dart';

class ViewPatientCubit extends Cubit<View_Patient_State> {
  ViewPatientCubit() : super(View_Patient_State.initial());

  var rr;
  var rr3;

  Future getPatient() async {
    emit(state.copyWith(view_patient_status: View_Patient_Status.loading));
    try {
      rr = await Patient_View_Repo.ViewPatient();
      emit(state.copyWith(view_patient_status: View_Patient_Status.success));
    } catch (e) {
      emit(state.copyWith(view_patient_status: View_Patient_Status.failure));
    }
  }

  Future getPatientIn() async {
    emit(state.copyWith(view_patient_status: View_Patient_Status.loading));
    try {
      rr3 = await Patient_View_Repo.ViewPatientIn();
      emit(state.copyWith(view_patient_status: View_Patient_Status.success));
    } catch (e) {
      emit(state.copyWith(view_patient_status: View_Patient_Status.failure));
    }
  }
}
