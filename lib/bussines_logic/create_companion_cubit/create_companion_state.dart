part of 'create_companion_cubit.dart';

enum CreateCompanionStatus{
  loading ,
  success ,
  failure ,
  initial
}
class CreateCompanionState extends Equatable{
  final CreateCompanionStatus createCompanionStatus;

  const CreateCompanionState({required this.createCompanionStatus});

  factory CreateCompanionState.initial()=> const CreateCompanionState(createCompanionStatus: CreateCompanionStatus.initial);

  @override
  List<Object?> get props => [createCompanionStatus];

  CreateCompanionState copyWith({CreateCompanionStatus? createCompanionStatus}){
    return CreateCompanionState(createCompanionStatus:createCompanionStatus?? this.createCompanionStatus);
  }
}