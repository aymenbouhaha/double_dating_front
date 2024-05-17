part of 'sign_in_cubit.dart';



class SignInState extends Equatable{


  @override
  List<Object?> get props => [];

}

class SignInInitState extends SignInState {}

class SignInLoadingState extends SignInState{


}

class SignInSuccessState extends SignInState{

  Couple couple;

  SignInSuccessState({required this.couple});

  @override
  List<Object?> get props => [couple];

}

class SignInError extends SignInState{

  String message;

  SignInError({required this.message});

  @override
  List<Object?> get props => [message];

}

