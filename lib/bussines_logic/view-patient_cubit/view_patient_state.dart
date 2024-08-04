part of 'view_patient_cubit.dart';

enum View_Patient_Status{
  loading ,
  success ,
  failure ,
  initial

}
class View_Patient_State extends Equatable{
  final View_Patient_Status view_patient_status;

  const View_Patient_State({required this.view_patient_status});
  factory View_Patient_State.initial() => const View_Patient_State(view_patient_status: View_Patient_Status.initial) ;

  @override
  // TODO: implement props
  List<Object?> get props => [view_patient_status];
  View_Patient_State copyWith({View_Patient_Status?view_patient_status}){
return  View_Patient_State(view_patient_status: view_patient_status??this.view_patient_status);

}


}