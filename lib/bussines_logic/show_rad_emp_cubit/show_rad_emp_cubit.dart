import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:hospital/bussines_logic/show_lab_emp_cubit/show_lab_emp_cubit.dart';
import 'package:hospital/data/repo/reception_repo.dart';
import 'package:hospital/data/repo/show-rad-emp_repo.dart';

part 'show_rad_emp_state.dart';

class ShowRadEmpCubit extends Cubit<Show_Rad_Emp_State> {
  ShowRadEmpCubit() : super(Show_Rad_Emp_State.initial());
  var rr;

  Future showRadEmp() async {
    emit(state.copWith(show_rad_emp_status: Show_Rad_Emp_Status.loading));
    try {
      rr = await Show_Rad_Emp_Repo.showRadEmp();
      print(rr) ;
      emit(state.copWith(show_rad_emp_status: Show_Rad_Emp_Status.success));
    } catch (e) {
      emit(state.copWith(show_rad_emp_status: Show_Rad_Emp_Status.failure));
    }
  }

  Future search(String search) async {
    emit(state.copWith(show_rad_emp_status: Show_Rad_Emp_Status.loading));
    try {
      rr = await ReceptionRepo.searchNon(2 , search);
      emit(state.copWith(show_rad_emp_status: Show_Rad_Emp_Status.success));
    } catch (e) {
      emit(state.copWith(show_rad_emp_status: Show_Rad_Emp_Status.failure));
    }
  }
}
