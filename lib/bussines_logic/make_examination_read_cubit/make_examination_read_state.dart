part of 'make_examination_read_cubit.dart';

enum Make_Examination_Read_Status{
  loading,
  success ,
  failure ,
  initial
}
class Make_Examination_Read_State extends Equatable{
  final Make_Examination_Read_Status make_examination_read_status;

 const Make_Examination_Read_State({required this.make_examination_read_status});
  factory Make_Examination_Read_State.initial()=> const Make_Examination_Read_State(make_examination_read_status:Make_Examination_Read_Status.initial);
  @override
  // TODO: implement props
  List<Object?> get props => [Make_Examination_Read_Status];

  Make_Examination_Read_State copyWith({Make_Examination_Read_Status? make_examination_read_status}) {
    return Make_Examination_Read_State(make_examination_read_status: make_examination_read_status ?? this.make_examination_read_status) ;
  }
}