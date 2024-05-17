import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../models/media.dart';
import '../../models/message.dart';
import 'package:http/http.dart' as http;

import '../../shared/network/local/cache_helper.dart';
import '../../shared/network/remote/http_helper.dart';
import '../../shared/services/websocket.dart';
part 'conversation_state.dart';

class ConversationCubit extends Cubit<ConversationState>{


  ConversationCubit(): super(ConversationInitState());

  ConversationState previousState=ConversationInitState();

  onChange(Change<ConversationState> change){
    super.onChange(change);
    previousState=change.currentState;
  }




  getPreviousState(){
    return previousState;
  }


  getMessages(int conversationId) async {
    emit(ConversationLoadingState());
    String token=CacheHelper.getData(key: "token");
    http.Response response=await HttpHelper.getData(url: "/message/${conversationId}",token: "Bearer ${token}");
    var resp=jsonDecode(response.body);
    if(response.statusCode! <= 299 && response.statusCode! >= 200){
        List<Message> messages=messageListFromJson(response.body);
        emit(ConversationLoadedState(messages: messages));
    }else{
      _handleError(response.body);
    }
  }

  addMessage({required String content,required int recepientId,List<Media>? attachements}) async {
    String token=CacheHelper.getData(key: "token");
    http.Response response= await HttpHelper.postData(url: "/message/create", data: {
      "content": content,
      "recepientId" : jsonEncode(recepientId)
    },
      token: "Bearer ${token}"
    );
    if(response.statusCode! <= 299 && response.statusCode! >= 200){
      Message message=messageFromJson(response.body);
      print("hello everyone : ${message.content}");
      List<Message> messages=(this.state as ConversationLoadedState).messages;
      emit(ConversationLoadedState(messages: List.from(messages)..add(message)));
    }else{
      _handleError(response.body);
    }
  }

  onMessage({required int connectedUserId}){
    String token=CacheHelper.getData(key: "token");
    Websocket websocket=Websocket(token: token);
    websocket.connect();
    websocket.listenToEvent("onMessage",
        (message){
              Message newMessage=messageFromJson(jsonEncode(message["message"]));
              if(newMessage.author!.id != connectedUserId){
                List<Message> messages=(this.state as ConversationLoadedState).messages;
                List<Message> newMessages=List.from(messages);
                newMessages.add(newMessage);
                emit(ConversationLoadedState(messages: newMessages));
              }
        }
    );
  }

  _handleError(dynamic response){
    var jsonResp=jsonDecode(response);
    emit(ConversationErrorState(message: jsonResp["message"]));
  }
}