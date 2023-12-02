import 'package:flutter/material.dart';

class StyledText extends StatelessWidget {
  const StyledText({super.key});

  @override
  Widget build(BuildContext context) {
    return const Text(
      "Hello world", // here string is the first Positional argument as it is required argument others are optional and hence they should be named arguments
      style: TextStyle(
        // configruational Object
        color: Colors.white,
        fontSize: 28,
      ),
    );
  }
}
