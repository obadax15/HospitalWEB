import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:hospital/bussines_logic/login_cubit/login_cubit.dart';
import 'package:hospital/constances/role.dart';
import 'package:hospital/constances/strings.dart';
import 'package:hospital/constances/token.dart';
import 'package:hospital/data/repo/login_repo.dart';

import '../../constances/id.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginState.initial());

  Future login(String password , int sp , String type) async {
    emit(state.copyWith(loginStatus: LoginStatus.loading)) ;
    try {
      var rr = await LoginRepo.login(password, sp, type) ;
      Token.token = rr['token'] ;
      Role.role = rr['user']['type'] ;
      Id.id = rr['user']['id'] ;
      emit(state.copyWith(loginStatus: LoginStatus.success)) ;
    } catch (e) {
      emit(state.copyWith(loginStatus: LoginStatus.failure)) ;
    }
  }
}
