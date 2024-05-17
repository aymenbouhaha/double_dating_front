part of 'conversation_cubit.dart';


class ConversationState extends Equatable{


  @override
  List<Object?> get props => [];

}


class ConversationInitState extends ConversationState{

}

class ConversationLoadingState extends ConversationState{


}

class ConversationLoadedState extends ConversationState{

  List<Message> messages;

  ConversationLoadedState({required this.messages});

  @override
  List<Object?> get props => [messages];

}

class ConversationErrorState extends ConversationState{


  String message;

  ConversationErrorState({required this.message});

  @override
  List<Object?> get props => [message];

}

