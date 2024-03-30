import 'package:flutter/material.dart';

class SheetCloseButton extends StatelessWidget {
  const SheetCloseButton({Key? key,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topLeft,
      child: CircleAvatar(
        backgroundColor: Colors.black12,
        child: CloseButton(color: Colors.black,),
      ),
    );
  }
}
