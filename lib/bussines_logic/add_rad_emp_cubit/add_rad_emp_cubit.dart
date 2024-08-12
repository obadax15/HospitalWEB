import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:hospital/data/repo/add_rad_emp_repo.dart';

part 'add_rad_emp_state.dart';




class AddRadEmpCubit extends Cubit<Add_Rad_Emp_State> {
  AddRadEmpCubit() : super(Add_Rad_Emp_State.initial());

  Future createRadEmp(
      String name,
      String number,
      String father,
      String mother,
      String inNumber,
      String location,
      String gender,
      String birthdate,
      ) async {
    print('kkj') ;
    emit(state.copyWith(add_rad_emp_status: Add_Rad_Emp_Status.loading));
    try {
      await Add_Rad_Emp_Repop.createRadEmp(name, number, father, mother, inNumber, location, gender, birthdate);
      emit(state.copyWith(add_rad_emp_status: Add_Rad_Emp_Status.success));
    } catch (e) {
      emit(state.copyWith(add_rad_emp_status: Add_Rad_Emp_Status.failure));
    }
  }
}
