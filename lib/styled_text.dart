import 'package:flutter/material.dart';

class StyledText extends StatelessWidget {
  const StyledText(this.text,{super.key});

  final String text; // here we use final in front of the string because we are sure that the value of the text is not going to change after receiving from the calling function

  @override
  Widget build(BuildContext context) {
    return  Text(
      text, // here string is the first Positional argument as it is required argument others are optional and hence they should be named arguments
      style: const TextStyle(
        // configruational Object
        color: Colors.white,
        fontSize: 28,
      ),
    );
  }
}
