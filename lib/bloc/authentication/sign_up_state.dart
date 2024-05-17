part of 'sign_up_cubit.dart';


class SignUpState extends Equatable{

  @override
  // TODO: implement props
  List<Object?> get props => [];

}

class SignUpInitState extends SignUpState{


}

class SignUpLoadingState extends SignUpState{


}

class SignUpSuccessState extends SignUpState{

}

class SignUpErrorState extends SignUpState{

  String message;

  SignUpErrorState({required this.message});

  @override
  List<Object?> get props => [message];

}

