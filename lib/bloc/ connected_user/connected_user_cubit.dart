import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:double_dating_front/shared/network/local/cache_helper.dart';
import 'package:equatable/equatable.dart';

import '../../models/couple.dart';
import '../../shared/services/websocket.dart';

part 'connected_user_state.dart';


class ConnectedUserCubit extends Cubit<ConnectedUserState> {


  ConnectedUserCubit() : super(ConnectedUserLoadedState(connectedCouples: []));


  onConnect() {
    String token=CacheHelper.getData(key: "token");
    Websocket websocket = Websocket(token: token);
    websocket.connect();
    websocket.listenToEvent("connectedUsers",
            (message) {
          print("From OnConnect");
          emit(ConnectedUserLoadingState());
          List<Couple> connectedUsers = coupleListFromJson(jsonEncode(message));
          connectedUsers.removeWhere((element) => element.id == 5);
          emit(ConnectedUserLoadedState(connectedCouples: connectedUsers));
        }
    );
  }

  onUserDisconnect() {
    String token=CacheHelper.getData(key: "token");
    Websocket websocket = Websocket(token: token);
    websocket.connect();
    websocket.listenToEvent("userDisconnected",
            (message) {
          Couple disConnectedUser = coupleFromJson(jsonEncode(message));
          List<Couple> connectedUsers = (this.state as ConnectedUserLoadedState)
              .connectedCouples;
          List<Couple> newList=List.from(connectedUsers);
          newList.removeWhere((element) => element.id == disConnectedUser.id);
          emit(ConnectedUserLoadedState(connectedCouples:newList));
        }
    );
  }

  onUserConnect() {
    String token=CacheHelper.getData(key: "token");
    Websocket websocket = Websocket(token: token);
    websocket.connect();
    websocket.listenToEvent("userConnected",
            (message) {
          Couple connectedUser = coupleFromJson(jsonEncode(message));
          if(connectedUser.id!= 5){
            print("haha");
            List<Couple> connectedUsers = (this.state as ConnectedUserLoadedState)
                .connectedCouples;
            int index=connectedUsers.indexWhere((e)=> e.id== connectedUser.id);
            print(index);
            if(index<0){
              List<Couple> newList=List.from(connectedUsers);
              newList.add(connectedUser);
              emit(
                  ConnectedUserLoadedState(connectedCouples: newList)
              );
            }
          }
        }
    );
  }

}
