part of 'list_conversation_cubit.dart';


class ListConversationState extends Equatable{

  @override
  List<Object?> get props => [];

}

class ListConversationInitState extends ListConversationState{

  ListConversationInitState();

}

class ListConversationLoadingState extends ListConversationState{

  ListConversationLoadingState();

}


class ListConversationLoadedState extends ListConversationState{

  List<Conversation> conversations;


  ListConversationLoadedState({ required this.conversations});

  @override
  List<Object?> get props => [conversations];

}


class ListConversationErrorState extends ListConversationState{

  String message ;

  ListConversationErrorState({required this.message});

  @override
  List<Object?> get props => [message];
}

