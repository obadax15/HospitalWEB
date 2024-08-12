part of 'add_lab_emp_cubit.dart';

enum Add_Lab_Emp_Status{
  loading ,
  success ,
  failure ,
  initial,
  deletedone,
  editdone,
}
class Add_Lab_Emp_State extends Equatable{
  final Add_Lab_Emp_Status add_lab_emp_status;

  const Add_Lab_Emp_State({required this.add_lab_emp_status});
  factory Add_Lab_Emp_State.initial()=> const Add_Lab_Emp_State(add_lab_emp_status: Add_Lab_Emp_Status.initial);

  @override
  // TODO: implement props
  List<Object?> get props => [add_lab_emp_status];

  Add_Lab_Emp_State copyWith({Add_Lab_Emp_Status? add_lab_emp_status}){
    return Add_Lab_Emp_State(add_lab_emp_status:add_lab_emp_status?? this.add_lab_emp_status);
  }
}