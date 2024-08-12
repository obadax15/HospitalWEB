import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:hospital/data/repo/add_labrotary_repo.dart';

part 'add_lab_emp_state.dart';

class AddLabEmpCubit extends Cubit<Add_Lab_Emp_State> {
  AddLabEmpCubit() : super(Add_Lab_Emp_State.initial());
  var details ;


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
  Future deleteLabEmp(int id) async {
    emit(state.copyWith(add_lab_emp_status: Add_Lab_Emp_Status.loading)) ;
    try {
      await Add_Labrotary_Repo.deleteLabEmp(id);
      emit(state.copyWith(add_lab_emp_status: Add_Lab_Emp_Status.deletedone)) ;
    } catch (e) {
      emit(state.copyWith(add_lab_emp_status: Add_Lab_Emp_Status.failure)) ;
    }
  }

  Future getLabEmpDetails(int id) async {
    emit(state.copyWith(add_lab_emp_status: Add_Lab_Emp_Status.loading)) ;
    try {
      details = await Add_Labrotary_Repo.getLabEmpDetails(id) ;
      emit(state.copyWith(add_lab_emp_status: Add_Lab_Emp_Status.success)) ;
    } catch (e) {
      emit(state.copyWith(add_lab_emp_status: Add_Lab_Emp_Status.failure)) ;
    }
  }

  Future edit_Lab_Emp(
      String name,
      String number,
      String father,
      String mother,
      String inNumber,
      String location,
      String gender,
      String birthdate,
      int id
      ) async {
    emit(state.copyWith(add_lab_emp_status: Add_Lab_Emp_Status.loading)) ;
    try {
      await Add_Labrotary_Repo.edit_Lab_Emp(name, number, father, mother, inNumber, location, gender, birthdate, id) ;
      emit(state.copyWith(add_lab_emp_status: Add_Lab_Emp_Status.editdone)) ;
    } catch (e) {
      emit(state.copyWith(add_lab_emp_status: Add_Lab_Emp_Status.failure)) ;
    }
  }
}
