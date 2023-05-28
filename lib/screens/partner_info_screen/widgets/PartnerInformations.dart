import 'package:flutter/cupertino.dart';

class PartnerInformations extends StatelessWidget {
  final String text ;
  const PartnerInformations({required this.text}) ;
  @override
  Widget build(BuildContext context) {
    return Text(text);
  }
}
