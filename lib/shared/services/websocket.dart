import 'package:double_dating_front/shared/constants/constants.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

class Websocket {

  IO.Socket? socket;

  connect(){
    this.socket!.connect();
  }

  listenToEvent(String eventName,Function(dynamic) handleEvent){
    socket!.on(eventName, handleEvent);
  }

  Websocket({required token}){
     this.socket=IO.io(baseUrl,<String, dynamic>{
       'transports': ["websocket"],
       'extraHeaders': {
         'Authorization': '${token}',
       },
     }
     );

  }
}