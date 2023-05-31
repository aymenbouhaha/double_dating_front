import 'package:double_dating_front/bloc/%20connected_user/connected_user_cubit.dart';
import 'package:double_dating_front/bloc/authentication/sign_in_cubit.dart';
import 'package:double_dating_front/bloc/authentication/sign_up_cubit.dart';
import 'package:double_dating_front/bloc/conversation/conversation_cubit.dart';
import 'package:double_dating_front/bloc/conversation_list/list_conversation_cubit.dart';
import 'package:double_dating_front/screens/categories_screen/categories_screen.dart';
import 'package:double_dating_front/screens/code_verification_screen/code_verification_screen.dart';
import 'package:double_dating_front/screens/home_page_screen/home_page_screen.dart';
import 'package:double_dating_front/screens/partner_info_screen/partner_info_screen.dart';
import 'package:double_dating_front/screens/search_screen/search_screen.dart';
import 'package:double_dating_front/screens/sign_in_screen/sing_in_screen.dart';
import 'package:double_dating_front/screens/sign_up_screen/sign_up_screen.dart';
import 'package:double_dating_front/shared/network/local/cache_helper.dart';
import 'package:double_dating_front/shared/network/remote/dio_helper.dart';
import 'package:flutter/foundation.dart';
import 'package:double_dating_front/screens/categories_screen/categories_screen.dart';
import 'package:double_dating_front/screens/code_verification_screen/code_verification_screen.dart';
import 'package:double_dating_front/screens/partner_info_screen/partner_info_screen.dart';
import 'package:double_dating_front/screens/sign_up_screen/sign_up_screen.dart';
import 'package:flutter/foundation.dart';
import 'package:double_dating_front/screens/chat_room_screen/chat_room_screen.dart';
import 'package:double_dating_front/screens/controller/controller.dart';
import 'package:double_dating_front/screens/conversations_screen/conversations_screen.dart';
import 'package:double_dating_front/screens/notifications_screen/notifications_screen.dart';
import 'package:double_dating_front/screens/profile_image_upload_screen/profile_image_upload_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    DioHelper.init();
    CacheHelper.init();
    return MultiBlocProvider(
      providers: [
          BlocProvider<SignInCubit>(create: (context)=>SignInCubit()),
          BlocProvider<ListConversationCubit>(create: (context)=>ListConversationCubit()..onMessage()..getConversations()),
          BlocProvider<ConversationCubit>(create: (context)=>ConversationCubit()..onMessage(connectedUserId: 5)),
          BlocProvider<ConnectedUserCubit>(create: (context)=>ConnectedUserCubit()..onUserDisconnect()..onUserConnect()..onConnect()),
          BlocProvider<SignUpCubit>(create: (context)=>SignUpCubit())
      ],
      child: MaterialApp(
        title: 'Double_Dating_App',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: SignUp(),
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}


