import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../models/conversation.dart';
import '../../models/couple.dart';

part 'conversation_state.dart';

class ConversationCubit extends Cubit<ConversationState>{

  ConversationCubit() : super(ConversationInitState());




}