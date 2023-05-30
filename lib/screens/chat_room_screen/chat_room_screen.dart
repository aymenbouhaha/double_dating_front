import 'package:double_dating_front/screens/chat_room_screen/widgets/chat_bar.dart';
import 'package:double_dating_front/screens/chat_room_screen/widgets/chat_bubble.dart';
import 'package:double_dating_front/shared/styles/colors.dart';
import 'package:double_dating_front/shared/styles/themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/conversation/conversation_cubit.dart';
import '../../models/couple.dart';
import '../../models/message.dart';

class ChatRoomScreen extends StatefulWidget {
  ChatRoomScreen({Key? key, required this.secondPart, required this.conversationId}) : super(key: key);

  int conversationId;
  Couple secondPart;

  @override
  State<ChatRoomScreen> createState() => _ChatRoomScreenState();
}

class _ChatRoomScreenState extends State<ChatRoomScreen> {

  ScrollController _scrollController = ScrollController();


  @override
  void initState() {

    context.read<ConversationCubit>().getMessages(widget.conversationId);
    super.initState();
  }


  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return SafeArea(
      child: Container(
        decoration: BoxDecoration(gradient: AppColors.backGroundGradient),
        child: BlocConsumer<ConversationCubit,ConversationState>(
          listener: (context,currState){
            if(currState is ConversationLoadedState){
              WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
                _scrollController.jumpTo(_scrollController.position.maxScrollExtent);
              });
            }

            var previousState=context.read<ConversationCubit>().getPreviousState();
            if(previousState is ConversationLoadedState && currState is ConversationLoadedState){
              WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
                _scrollController.jumpTo(_scrollController.position.maxScrollExtent);
              });
            }
          },
          listenWhen: (previousState,currState){
            return previousState!=currState;
          },
          builder: (context, state) {

            if (state is ConversationLoadingState)
              return Center(
                child: CircularProgressIndicator(),
              );
            if (state is ConversationLoadedState) {
              return Scaffold(
                backgroundColor: Colors.transparent,
                appBar: AppBar(
                  // toolbarHeight: height*0.09,
                  leading: InkWell(
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10,top: 10,bottom: 10,right:0),
                      child: Container(
                        decoration: BoxDecoration(
                            color: AppColors.grey, shape: BoxShape.circle),
                        child: Icon(
                          Icons.arrow_back_ios_new,
                          size: 20,
                          color: Colors.black,
                        ),
                        alignment: Alignment.center,
                      ),
                    ),
                  ),
                  backgroundColor: AppColors.appBarColor,
                  title: Row(
                    children: [
                      widget.secondPart.profilePicture != null
                          ? CircleAvatar(radius: 23,foregroundImage: MemoryImage(widget.secondPart.profilePicture!.data!.data))
                          :
                      CircleAvatar(radius: 23,foregroundImage: AssetImage("assets/Group 68.png")),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        child: Text("${widget.secondPart.username}",
                            style: AppThemes.textStyle.copyWith(
                                fontSize: 15, fontWeight: FontWeight.w700)),
                      )
                    ],
                  ),
                  actions: [
                    IconButton(onPressed: () {}, icon: Icon(Icons.more_horiz))
                  ],
                ),
                body: Stack(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(bottom: height * 0.11),
                      child: ListView.builder(
                        controller: _scrollController,
                        itemBuilder: (context, index) {
                          Message message=state.messages[index];
                          bool isSender =  message.author!.id!= widget.secondPart.id;
                          if (!isSender) {
                            return Padding(
                              padding: const EdgeInsets.only(
                                  left: 14, top: 5, bottom: 5),
                              child: Stack(
                                children: [
                                  Align(
                                    child: ChatBubble(
                                        text:
                                        "${message.content}",
                                        color: AppColors.appBarColor,
                                        isSender: false),
                                    alignment: Alignment.bottomRight,
                                  ),
                                  widget.secondPart.profilePicture != null
                                      ? CircleAvatar(radius: 20,foregroundImage: MemoryImage(widget.secondPart.profilePicture!.data!.data))
                                      : CircleAvatar(radius: 20,foregroundImage: AssetImage("assets/Group 68.png")),
                                ],
                              ),
                            );
                          } else {
                            return Padding(
                              padding: const EdgeInsets.only(top: 5, bottom: 5),
                              child: ChatBubble(
                                  text:
                                  "${message.content}",
                                  color: AppColors.appBarColor,
                                  isSender: true),
                            );
                          }
                        },
                        itemCount: state.messages.length,
                      ),
                    ),
                    ChatBar(
                      onSend: (message){
                        context.read<ConversationCubit>().addMessage(content: message, recepientId: widget.secondPart.id!);
                        // _scrollController.animateTo(_scrollController.position.maxScrollExtent, duration: Duration(microseconds: 300), curve: Curves.easeOut);
                      },
                    )
                  ],
                ),
              );
            }
            return Container();
          },

        )
      ),
    );
  }
}
