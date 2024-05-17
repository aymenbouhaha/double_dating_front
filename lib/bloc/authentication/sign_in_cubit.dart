import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:double_dating_front/shared/network/local/cache_helper.dart';
import 'package:equatable/equatable.dart';
import 'package:http/http.dart' as http;
import '../../models/couple.dart';
import '../../shared/network/remote/http_helper.dart';
import '../../shared/services/websocket.dart';

part 'sign_in_state.dart';

class SignInCubit extends Cubit<SignInState> {
  SignInCubit() : super(SignInInitState());

  login(String email, String password) async {
    emit(SignInLoadingState());
    http.Response response = await HttpHelper.postData(
      url: "/couple/login",
      data: {"login": email, "password": password},
    );
    if (response.statusCode! <= 299 && response.statusCode! >= 200) {
      var decodedResponse=jsonDecode(response.body);
      Couple couple=coupleFromJson(response.body);
      CacheHelper.putData(key: "token", data: decodedResponse["token"]);
      emit(SignInSuccessState(couple: couple));
      print(decodedResponse["token"]);
      Websocket websocket=Websocket(token: decodedResponse["token"]);
      websocket.connect();
    } else {
      _handleError(response.body);
    }
  }

  _handleError(dynamic response) {
    var jsonResp = jsonDecode(response);
    dynamic message=jsonResp["message"];
    if(message is List){
      message=message.join(" , ");
    }
    emit(SignInError(message: message));
  }
}
