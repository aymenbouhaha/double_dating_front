import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:http/http.dart' as http;

import '../../shared/network/remote/http_helper.dart';
part 'sign_up_state.dart';

class SignUpCubit extends Cubit<SignUpState>{

  SignUpCubit(): super(SignUpInitState());


  signUp({required dynamic data}) async {
    print(data);
    emit(SignUpLoadingState());
    http.Response response= await HttpHelper.postData(url: "/couple/sign-up",
      data:jsonEncode(data)
    );
    if(response.statusCode! <= 299 && response.statusCode! >= 200){
      emit(SignUpSuccessState());
    }else{
      _handleError(response.body);
    }
  }

  _handleError(dynamic response){
    var jsonResp = jsonDecode(response);
    dynamic message=jsonResp["message"];
    if(message is List){
      message=message.join(" , ");
    }
    emit(SignUpErrorState(message: message));
  }



}

