import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../models/couple.dart';
import '../../shared/constants/constants.dart';
import '../../shared/services/websocket.dart';

part 'connected_user_state.dart';


class ConnectedUserCubit extends Cubit<ConnectedUserState> {


  ConnectedUserCubit() : super(ConnectedUsersInitialState());


  onConnect() {
    Websocket websocket = Websocket(token: token);
    websocket.connect();
    websocket.listenToEvent("connectedUsers",
            (message) {
          emit(ConnectedUserLoadingState());
          List<Couple> connectedUsers = coupleListFromJson(jsonEncode(message));
          connectedUsers.removeWhere((element) => element.id == 5);
          emit(ConnectedUserLoadedState(connectedCouples: connectedUsers));
        }
    );
  }

  onUserDisconnect() {
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
