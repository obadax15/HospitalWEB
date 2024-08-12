part of 'show_lab_emp_cubit.dart';



enum Show_Lab_Emp_Status{
  loading ,
  success ,
  failure ,
  initial

}
class Show_Lab_Emp_State extends Equatable{
  final Show_Lab_Emp_Status show_lab_emp_status;

  const Show_Lab_Emp_State({required this.show_lab_emp_status});
  factory Show_Lab_Emp_State.initial() => const Show_Lab_Emp_State(show_lab_emp_status: Show_Lab_Emp_Status.initial) ;

  @override
  // TODO: implement props
  List<Object?> get props => [show_lab_emp_status];
  Show_Lab_Emp_State copyWith({Show_Lab_Emp_Status?show_lab_emp_status}){
    return  Show_Lab_Emp_State(show_lab_emp_status: show_lab_emp_status??this.show_lab_emp_status);

  }


}
