import 'package:double_dating_front/shared/styles/colors.dart';
import 'package:double_dating_front/shared/styles/themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ChatBar extends StatelessWidget {
  ChatBar({Key? key, this.onSend, this.onTapCloseReply, this.onTextChanged})
      : super(key: key);

  TextEditingController _textController = TextEditingController();
  final void Function(String)? onTextChanged;
  final void Function(String)? onSend;
  final void Function()? onTapCloseReply;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;

    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              color: AppColors.appBarColor,
              padding: const EdgeInsets.symmetric(
                vertical: 8,
                horizontal: 6,
              ),
              child: Row(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(right: 8),
                    child: InkWell(
                      onTap: () {},
                      child: SvgPicture.asset(
                        "assets/icons/Image.svg",
                        height: 40,
                        width: 40,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      child: TextField(
                        style: AppThemes.textStyle.copyWith(fontSize: 16, fontWeight: FontWeight.w500),
                        controller: _textController,
                        keyboardType: TextInputType.multiline,
                        textCapitalization: TextCapitalization.sentences,
                        minLines: 1,
                        maxLines: 3,
                        onChanged: onTextChanged,
                        decoration: InputDecoration(
                          hintText: "Type your message",
                          hintMaxLines: 1,
                          contentPadding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 10),
                          hintStyle: AppThemes.textStyle.copyWith(fontSize: 16, fontWeight: FontWeight.w500),
                          fillColor: Color.fromRGBO(255, 255, 255, 0.5),
                          filled: true,
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30.0),
                            borderSide: const BorderSide(
                              color: Colors.white,
                              width: 0.2,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30.0),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8),
                    child: InkWell(
                      child: Icon(
                        Icons.send,
                        color: Colors.white,
                        size: 35,
                      ),
                      onTap: () {
                        if (_textController.text.trim() != '') {
                          if (onSend != null) {
                            onSend!(_textController.text.trim());
                          }
                          _textController.text = '';
                        }
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
