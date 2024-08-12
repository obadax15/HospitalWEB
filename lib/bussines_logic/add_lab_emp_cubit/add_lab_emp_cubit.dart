import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:hospital/data/repo/add_labrotary_repo.dart';

part 'add_lab_emp_state.dart';

class AddLabEmpCubit extends Cubit<Add_Lab_Emp_State> {
  AddLabEmpCubit() : super(Add_Lab_Emp_State.initial());

  Future createLabEmp(
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
    emit(state.copyWith(add_lab_emp_status: Add_Lab_Emp_Status.loading));
    try {
      await Add_Labrotary_Repo.createLabEmp(name, number, father, mother, inNumber, location, gender, birthdate);
      emit(state.copyWith(add_lab_emp_status: Add_Lab_Emp_Status.success));
    } catch (e) {
      emit(state.copyWith(add_lab_emp_status: Add_Lab_Emp_Status.failure));
    }
  }
}
