import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:hospital/data/repo/add_rad_emp_repo.dart';

part 'add_rad_emp_state.dart';




class AddRadEmpCubit extends Cubit<Add_Rad_Emp_State> {
  AddRadEmpCubit() : super(Add_Rad_Emp_State.initial());
  var details ;

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
  Future deleteRadEmp(int id) async {
    emit(state.copyWith(add_rad_emp_status: Add_Rad_Emp_Status.loading)) ;
    try {
      await Add_Rad_Emp_Repop.deleteRadEmp(id);
      emit(state.copyWith(add_rad_emp_status: Add_Rad_Emp_Status.deletedone)) ;
    } catch (e) {
      emit(state.copyWith(add_rad_emp_status: Add_Rad_Emp_Status.failure)) ;
    }
  }

  Future getRadEmpDetails(int id) async {
    emit(state.copyWith(add_rad_emp_status: Add_Rad_Emp_Status.loading)) ;
    try {
      details = await Add_Rad_Emp_Repop.getRadEmpDetails(id) ;
      emit(state.copyWith(add_rad_emp_status: Add_Rad_Emp_Status.success)) ;
    } catch (e) {
      emit(state.copyWith(add_rad_emp_status: Add_Rad_Emp_Status.failure)) ;
    }
  }

  Future edit_Rad_Emp(
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
    emit(state.copyWith(add_rad_emp_status: Add_Rad_Emp_Status.loading)) ;
    try {
      await Add_Rad_Emp_Repop.edit_Rad_Emp(name, number, father, mother, inNumber, location, gender, birthdate, id) ;
      emit(state.copyWith(add_rad_emp_status: Add_Rad_Emp_Status.editdone)) ;
      print(state.add_rad_emp_status) ;
    } catch (e) {
      emit(state.copyWith(add_rad_emp_status: Add_Rad_Emp_Status.failure)) ;
    }
  }
}
