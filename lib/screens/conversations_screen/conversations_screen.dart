import 'package:double_dating_front/bloc/%20connected_user/connected_user_cubit.dart';
import 'package:double_dating_front/bloc/conversation_list/list_conversation_cubit.dart';
import 'package:double_dating_front/screens/chat_room_screen/chat_room_screen.dart';
import 'package:double_dating_front/screens/conversations_screen/widgets/conversation_item.dart';
import 'package:double_dating_front/screens/conversations_screen/widgets/profile_indicator.dart';
import 'package:double_dating_front/shared/widgets/app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../models/couple.dart';
import '../../models/conversation.dart';
import '../../shared/styles/colors.dart';

class ListConversation extends StatefulWidget {
  const ListConversation({Key? key}) : super(key: key);

  @override
  State<ListConversation> createState() => _ListConversationState();
}

class _ListConversationState extends State<ListConversation> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    double width10 = MediaQuery.of(context).size.width / 41;
    double height10 = MediaQuery.of(context).size.height / 68;

    return SafeArea(
      child: Container(
        decoration: BoxDecoration(gradient: AppColors.backGroundGradient),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: CustomAppBar(
              context: context, leading: true, title: "Conversations"),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              BlocBuilder<ConnectedUserCubit, ConnectedUserState>(
                builder: (context, state) {
                  if (state is ConnectedUserLoadingState) {
                    return Container(
                      height: 100,
                      child: Center(
                        child: CircularProgressIndicator(),
                      ),
                    );
                  }

                  if (state is ConnectedUserLoadedState) {
                    if (state.connectedCouples.length <= 0) {
                      return Container();
                    }
                    return Container(
                      height: 100,
                      alignment: Alignment.center,
                      child: ListView.builder(
                          itemCount: state.connectedCouples.length,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            Couple connectedCouple =
                                state.connectedCouples[index];
                            var imageData = null;
                            if (connectedCouple.profilePicture != null) {
                              imageData =
                                  connectedCouple.profilePicture!.data!.data;
                            }

                            return ProfileIndicator(
                              imageData: imageData,
                              containerHeigth: width10 * 9,
                              containerWidth: width10 * 9,
                              onTap: () {},
                            );
                          }),
                    );
                  }
                  return Container(
                      // height: 100,
                      );
                },
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: width10 * 0.4),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: 1,
                      width: width * 0.9,
                      decoration:
                          BoxDecoration(gradient: AppColors.fillGradient),
                    ),
                  ],
                ),
              ),
              Flexible(
                child: BlocBuilder<ListConversationCubit, ListConversationState>(
                    builder: (context, state) {
                    if (state is ListConversationLoadingState) {
                return Center(child: CircularProgressIndicator());
                    }

                    if (state is ListConversationLoadedState) {
                return ListView.builder(
                    itemCount: state.conversations.length,
                    itemBuilder: (context, index) {
                      Conversation conversation =
                          state.conversations[index];
                      var secondCouple;
                      var username;
                      var imageData = null;
                      var lastMessage;
                      if (conversation.lastMessage!.author!.id==5){
                        lastMessage =
                        "You : ${conversation.lastMessage!.content}";
                      }else{
                        lastMessage =
                        "${conversation.lastMessage!.content}";
                      }
                      if (conversation.author!.id == 5) {
                        secondCouple = conversation.recipient!;
                        username = conversation.recipient!.username!;
                        if (conversation.recipient!.profilePicture !=
                            null) {
                          imageData = conversation
                              .recipient!.profilePicture!.data!.data;
                        }
                      } else {
                        print("object ${conversation.author!.id}");
                        secondCouple = conversation.author!;
                        username = conversation.author!.username!;
                        if (conversation.author!.profilePicture != null) {
                          imageData = conversation
                              .author!.profilePicture!.data!.data;
                        }
                      }
                      return ConversationItem(
                        imageData: imageData,
                        username: username,
                        lastMessage: lastMessage,
                        date: conversation.lastMessage!.creationDate!,
                        notReadMessages: 0,
                        onTap: () {
                          Navigator.of(context)
                              .push(MaterialPageRoute(builder: (context) {
                            return ChatRoomScreen(conversationId: conversation.id!,secondPart: secondCouple,);
                          }));
                        },
                      );
                    });
                    }

                    return Container();
                  }),
              )
            ],
          ),
        ),
      ),
    );
  }
}
