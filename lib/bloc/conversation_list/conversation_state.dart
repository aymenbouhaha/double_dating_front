part of 'conversation_cubit.dart';


class ConversationState extends Equatable{

  @override
  List<Object?> get props => [];

}

class ConversationInitState extends ConversationState{

  ConversationInitState();

}

class ConversationLoadingState extends ConversationState{

  ConversationLoadingState();

}


class ConversationLoadedState extends ConversationState{

  List<Conversation> conversations;

  List<Couple> connectedCouples;

  ConversationLoadedState({required this.connectedCouples , required this.conversations});

  @override
  List<Object?> get props => [conversations, connectedCouples];

}


class ConversationErrorState extends ConversationState{

  String message ;

  ConversationErrorState({required this.message});

  @override
  List<Object?> get props => [message];
}

