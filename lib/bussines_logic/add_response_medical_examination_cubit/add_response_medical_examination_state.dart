part of 'add_response_medical_examination_cubit.dart';

enum Add_Response_Medical_examination_Status {
  loading ,
  success ,
  failure ,
  initial
}
class Add_Response_Medical_examination_State extends Equatable{
  final Add_Response_Medical_examination_Status add_response_medical_examination_status;
  Add_Response_Medical_examination_State({required this.add_response_medical_examination_status});
  factory Add_Response_Medical_examination_State.initial() => Add_Response_Medical_examination_State(add_response_medical_examination_status:Add_Response_Medical_examination_Status.initial);

  @override
  // TODO: implement props
  List<Object?> get props => [add_response_medical_examination_status];
  Add_Response_Medical_examination_State copyWith({Add_Response_Medical_examination_Status ?add_response_medical_examination_status}){
    return Add_Response_Medical_examination_State(add_response_medical_examination_status: add_response_medical_examination_status??this.add_response_medical_examination_status);
  }

}
