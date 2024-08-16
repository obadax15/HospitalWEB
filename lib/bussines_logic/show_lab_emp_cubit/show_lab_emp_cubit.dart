import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:hospital/data/repo/show_labrotary_emp_repo.dart';

import '../../data/repo/reception_repo.dart';

part 'show_lab_emp_state.dart';

class ShowLabEmpCubit extends Cubit<Show_Lab_Emp_State> {
  var rr;

  ShowLabEmpCubit() : super(Show_Lab_Emp_State.initial());

  Future ShowLabEmp() async {
    emit(state.copyWith(show_lab_emp_status: Show_Lab_Emp_Status.loading));
    try {
      rr = await Show_Labrotary_Emp_Repo.ShowLabEmp();
      emit(state.copyWith(show_lab_emp_status: Show_Lab_Emp_Status.success));
    } catch (e) {
      emit(state.copyWith(show_lab_emp_status: Show_Lab_Emp_Status.failure));
    }
  }

  Future searchNon(String search) async {
    emit(state.copyWith(show_lab_emp_status: Show_Lab_Emp_Status.loading));
    try {
      rr = await ReceptionRepo.searchNon(1,search);
      emit(state.copyWith(show_lab_emp_status: Show_Lab_Emp_Status.success));
    } catch (e) {
      emit(state.copyWith(show_lab_emp_status: Show_Lab_Emp_Status.failure));
    }
  }
}
