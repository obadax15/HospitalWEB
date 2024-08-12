part of 'add_rad_emp_cubit.dart';

enum Add_Rad_Emp_Status{
  loading ,
  success ,
  failure ,
  initial,
  deletedone,
  editdone,
}
class Add_Rad_Emp_State extends Equatable{
  final Add_Rad_Emp_Status add_rad_emp_status;

  const Add_Rad_Emp_State({required this.add_rad_emp_status});
  factory Add_Rad_Emp_State.initial()=> const Add_Rad_Emp_State(add_rad_emp_status: Add_Rad_Emp_Status.initial);

  @override
  // TODO: implement props
  List<Object?> get props => [add_rad_emp_status];

  Add_Rad_Emp_State copyWith({Add_Rad_Emp_Status? add_rad_emp_status}){
    return Add_Rad_Emp_State(add_rad_emp_status:add_rad_emp_status?? this.add_rad_emp_status);
  }
}