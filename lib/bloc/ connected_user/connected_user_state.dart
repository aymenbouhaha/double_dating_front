
part of 'connected_user_cubit.dart';


class ConnectedUserState extends Equatable{


  @override
  List<Object?> get props => [];

}


class ConnectedUsersInitialState extends ConnectedUserState{

  ConnectedUsersInitialState();
}

class ConnectedUserLoadingState extends ConnectedUserState{

  ConnectedUserLoadingState();

}

class ConnectedUserLoadedState extends ConnectedUserState{

  List<Couple> connectedCouples;

  ConnectedUserLoadedState({required this.connectedCouples});

  @override
  List<Object?> get props => [connectedCouples];

}


class ConnectedUserError extends ConnectedUserState{

}