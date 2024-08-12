part of 'show_rad_emp_cubit.dart';

enum Show_Rad_Emp_Status{
  loading ,
  success ,
  failure ,
  initial}
class Show_Rad_Emp_State extends Equatable{
  final Show_Rad_Emp_Status show_rad_emp_status;

  Show_Rad_Emp_State({required this.show_rad_emp_status});
  factory Show_Rad_Emp_State.initial() => Show_Rad_Emp_State(show_rad_emp_status: Show_Rad_Emp_Status.initial);
  @override
  // TODO: implement props
  List<Object?> get props =>[show_rad_emp_status];
  Show_Rad_Emp_State copWith({Show_Rad_Emp_Status?show_rad_emp_status}){
    return Show_Rad_Emp_State(show_rad_emp_status: show_rad_emp_status??this.show_rad_emp_status);
  }

}