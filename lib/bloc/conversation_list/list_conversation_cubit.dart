import 'dart:convert';
import 'package:bloc/bloc.dart';
import 'package:double_dating_front/models/message.dart';
import 'package:equatable/equatable.dart';
import 'package:http/http.dart' as http;
import '../../models/conversation.dart';
import '../../shared/constants/constants.dart';
import '../../shared/network/remote/http_helper.dart';
import '../../shared/services/websocket.dart';
part 'list_conversation_state.dart';

class ListConversationCubit extends Cubit<ListConversationState>{

  ListConversationCubit() : super(ListConversationInitState());

  getConversations()async{
      emit(ListConversationLoadingState());
      // String token=CacheHelper.getData(key: "token");
      http.Response response=await HttpHelper.getData(url: "/conversation",token: "Bearer ${token}");
      var resp=jsonDecode(response.body);
      if(response.statusCode! <= 299 && response.statusCode! >= 200){
        List<Conversation> conversations=conversationListFromJson(response.body);
        emit(ListConversationLoadedState(conversations: conversations));
      }else{
        _handleError(response.body);
      }
  }



  _handleError(dynamic response){
    var jsonResp=jsonDecode(response);
    emit(ListConversationErrorState(message: jsonResp["message"]));
  }


  onMessage(){
    // String token=CacheHelper.getData(key: "token");
    Websocket websocket=Websocket(token: token);
    websocket.connect();
    websocket.listenToEvent("onMessage",
        (message){
            List<Conversation> conversations = (this.state as ListConversationLoadedState).conversations;
            Conversation convId=conversationFromJson(jsonEncode(message["conversation"]));
            Message lastMessage=messageFromJson(jsonEncode(message["message"]));
            List<Conversation>newConversations= List.from(conversations.map(
                    (e) {
                  if (e.id==convId.id){

                    Conversation newConversation=Conversation(
                      lastMessage: lastMessage,
                      author: e.author,
                      recipient: e.recipient,
                      id: e.id
                    );
                    return newConversation;
                  }else{
                    return e;
                  }
                }
            ));

            if(conversations[0].id!=convId.id){
              newConversations.sort(
                      (e,e1)=> e1.lastMessage!.creationDate!.compareTo(e.lastMessage!.creationDate!)
              );
            }
            emit(ListConversationLoadedState(conversations: newConversations));

        }
    );

  }




}