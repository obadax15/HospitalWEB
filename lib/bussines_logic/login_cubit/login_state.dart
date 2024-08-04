part of 'login_cubit.dart';

enum LoginStatus { loading, initial, failure, success }

class LoginState extends Equatable {
  final LoginStatus loginStatus;

  const LoginState({required this.loginStatus});

  factory LoginState.initial() => const LoginState(loginStatus: LoginStatus.initial);

  @override
  List<Object?> get props => [loginStatus];

  LoginState copyWith({LoginStatus? loginStatus}) => LoginState(loginStatus: loginStatus ?? this.loginStatus);
}
