import 'package:double_dating_front/shared/styles/themes.dart';
import 'package:flutter/material.dart';

const double BUBBLE_RADIUS = 30;

class ChatBubble extends StatelessWidget {
  final double bubbleRadius;
  final bool isSender;
  final Color color;
  final String text;
  final TextStyle textStyle;

  ChatBubble({
    Key? key,
    required this.text,
    this.bubbleRadius = BUBBLE_RADIUS,
    this.isSender = true,
    this.color = Colors.white70,
    this.textStyle = const TextStyle(
      color: Colors.black87,
      fontSize: 16,
    ),
  }) : super(key: key);

  ///chat bubble builder method
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 5, bottom: 5),
      child: Row(
        children: <Widget>[
          isSender
              ? Expanded(
                  child: SizedBox(
                    width: 5,
                  ),
                )
              : Container(),
          Container(
            color: Colors.transparent,
            constraints:
                BoxConstraints(maxWidth: MediaQuery.of(context).size.width * 0.7),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 2),
              child: Container(
                decoration: BoxDecoration(
                  color: color,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(
                      isSender ? bubbleRadius : 0
                    ),
                    topRight: Radius.circular(isSender ? 0 : bubbleRadius),
                    bottomLeft:  Radius.circular(bubbleRadius),
                    bottomRight: Radius.circular(bubbleRadius),
                  ),
                ),
                child: Stack(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                      child: Text(
                        text,
                        style: AppThemes.textStyle.copyWith(fontSize: 12, fontWeight: FontWeight.w600),
                        textAlign: TextAlign.left,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
